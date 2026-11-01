const std = @import("std");

// `Type` names the JSON type stored in `Value`, for example "Int32".
Type: []const u8 = "",
Value: std.json.Value = .null,
