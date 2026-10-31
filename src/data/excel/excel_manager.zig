const std = @import("std");
const Io = std.Io;
const json = std.json;
const Allocator = std.mem.Allocator;
const log = std.log.scoped(.excel);

const avatar = @import("avatar.zig");

pub const Excels = struct {
    avatar_config: Excel(avatar.AvatarConfig),

    pub fn load(arena: Allocator, gpa: Allocator, io: Io, res_dir: Io.Dir) !Excels {
        var excel_dir = try res_dir.openDir(io, "ExcelOutput", .{});
        defer excel_dir.close(io);

        var excel: Excels = undefined;
        const excel_info = @typeInfo(Excels).@"struct";

        inline for (excel_info.field_names, excel_info.field_types) |name, excelType| {
            @field(excel, name) = try excelType.load(arena, gpa, io, excel_dir);
        }

        return excel;
    }
};

pub fn Excel(comptime Row: type) type {
    const Key = @typeInfo(@TypeOf(Row.key)).@"fn".return_type.?;

    return struct {
        const Self = @This();

        pub const RowType = Row;

        rows: []const Row,
        specific_row: std.AutoHashMapUnmanaged(Key, u32),

        pub fn get(self: *const Self, key: Key) ?*const Row {
            const index = self.specific_row.get(key) orelse return null;

            return &self.rows[index];
        }

        pub fn load(arena: Allocator, gpa: Allocator, io: Io, excel_dir: Io.Dir) !Self {
            var rows: std.ArrayList(Row) = .empty;
            for (Row.files) |file_name| {
                const excel_rows = try LoadExcel(Row, arena, gpa, io, excel_dir, file_name);
                try rows.appendSlice(arena, excel_rows);
            }

            var row_index: std.AutoHashMapUnmanaged(Key, u32) = .empty;
            try row_index.ensureTotalCapacity(arena, @intCast(rows.items.len));

            for (rows.items, 0..) |*row, index| {
                const entry = row_index.getOrPutAssumeCapacity(row.key());

                if (entry.found_existing) {
                    log.warn("{s}: duplicate key at row {d}", .{ @typeName(Row), index });
                    continue;
                }
                entry.value_ptr.* = @intCast(index);
            }

            log.info("{s}: loaded {d} rows", .{ @typeName(Row), rows.items.len });

            return .{ .rows = rows.items, .specific_row = row_index };
        }
    };
}

pub fn LoadExcel(
    comptime Row: type,
    arena: Allocator,
    gpa: Allocator,
    io: Io,
    excel_dir: Io.Dir,
    file_name: []const u8,
) ![]const Row {
    const file_bytes = excel_dir.readFileAlloc(io, file_name, gpa, .unlimited) catch |err| {
        log.err("{s}: read fail: {s}", .{ file_name, @errorName(err) });
        return err;
    };
    defer gpa.free(file_bytes);

    var scanner: json.Scanner = .initCompleteInput(gpa, file_bytes);
    defer scanner.deinit();

    var diagnostics: json.Diagnostics = .{};
    scanner.enableDiagnostics(&diagnostics);

    return json.parseFromTokenSourceLeaky([]const Row, arena, &scanner, .{
        .ignore_unknown_fields = true,
        .allocate = .alloc_always,
    }) catch |err| {
        log.err("{s}:{d}:{d}: {s}", .{
            file_name,
            diagnostics.getLine(),
            diagnostics.getColumn(),
            @errorName(err),
        });
        return err;
    };
}
