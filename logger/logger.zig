const std = @import("std");
const Io = std.Io;

var log_file: ?Io.File = null;

pub const LocalTime = struct {
    year: u16,
    month: u4,
    day: u5,
    hour: u5,
    minute: u6,
    second: u6,
};

pub fn GetLocalTime(unix_seconds: i64) LocalTime {
    const seconds: std.time.epoch.EpochSeconds = .{ .secs = @intCast(unix_seconds + 8 * 60 * 60) };

    const year = seconds.getEpochDay().calculateYearDay();
    const month = year.calculateMonthDay();
    const second = seconds.getDaySeconds();

    return .{
        .year = year.year,
        .month = month.month.numeric(),
        .day = month.day_index + 1,
        .hour = second.getHoursIntoDay(),
        .minute = second.getMinutesIntoHour(),
        .second = second.getSecondsIntoMinute(),
    };
}

pub fn init(io: Io) !void {
    try Io.Dir.cwd().createDirPath(io, "logs");
    var logger_dir = try Io.Dir.cwd().openDir(io, "logs", .{});
    defer logger_dir.close(io);

    const time = GetLocalTime(Io.Clock.real.now(io).toSeconds());
    var num: u32 = 1;
    while (true) : (num += 1) {
        var name_buffer: [64]u8 = undefined;
        const file_name = try std.fmt.bufPrint(&name_buffer, "{d}-{d:0>2}-{d:0>2}-{d}.log", .{
            time.year,
            time.month,
            time.day,
            num,
        });

        log_file = logger_dir.createFile(io, file_name, .{ .exclusive = true }) catch |err| switch (err) {
            error.PathAlreadyExists => continue,
            else => return err,
        };

        return;
    }
}

pub fn deinit(io: Io) void {
    const file = log_file orelse return;
    file.close(io);
    log_file = null;
}

pub fn logFn(
    comptime level: std.log.Level,
    comptime scope: @EnumLiteral(),
    comptime format: []const u8,
    args: anytype,
) void {
    const io = std.Options.debug_io;
    const privious_protection = io.swapCancelProtection(.blocked);
    defer _ = io.swapCancelProtection(privious_protection);

    const time = GetLocalTime(Io.Clock.real.now(io).toSeconds());

    var console_buffer: [64]u8 = undefined;
    const console = std.debug.lockStderr(&console_buffer).terminal();
    defer std.debug.unlockStderr();

    // write console
    console.writer.print("[{d:0>2}:{d:0>2}:{d:0>2}] [{t}] [", .{ time.hour, time.minute, time.second, scope }) catch {};
    console.setColor(levelColor(level)) catch {};
    console.writer.writeAll(levelText(level)) catch {};
    console.setColor(.reset) catch {};
    console.writer.print("] " ++ format ++ "\n", args) catch {};

    // write file
    if (log_file) |file| {
        var file_buffer: [512]u8 = undefined;
        var file_writer = file.writerStreaming(io, &file_buffer);
        const writer = &file_writer.interface;

        writer.print("[{d:0>2}:{d:0>2}:{d:0>2}] [{t}] [{s}] ", .{
            time.hour, time.minute, time.second, scope, levelText(level),
        }) catch {};
        writer.print(format ++ "\n", args) catch {};
        writer.flush() catch {};
    }
}

fn levelColor(comptime level: std.log.Level) Io.Terminal.Color {
    return switch (level) {
        .err => .red,
        .debug => .blue,
        .info => .cyan,
        .warn => .yellow,
    };
}

fn levelText(comptime level: std.log.Level) []const u8 {
    return switch (level) {
        .err => "Error",
        .debug => "Debug",
        .info => "Info",
        .warn => "Warn",
    };
}
