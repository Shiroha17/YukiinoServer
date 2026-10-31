const std = @import("std");
const Io = std.Io;
const Allocator = std.mem.Allocator;

const excel_manager = @import("excel/excel_manager.zig");

pub const GameData = struct {
    excel: excel_manager.Excels,

    pub fn load(arena: Allocator, gpa: Allocator, io: Io, res_path: []const u8) !GameData {
        var res_dir = try Io.Dir.cwd().openDir(io, res_path, .{});
        defer res_dir.close(io);

        return .{
            .excel = try excel_manager.Excels.load(arena, gpa, io, res_dir),
        };
    }
};
