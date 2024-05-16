const std = @import("std");

pub fn normal(c: f64, n: u32) f64 {
    var result: f64 = 1.0;
    for (0..n) |_| {
        result *= c;
    }
    return result;
}

pub fn small_error(c: f64, n: u32) f64 {
    if (n == 1) {
        return c;
    }
    const a = n / 2;
    const b = n - a;
    return small_error(c, a) * small_error(c, b);
}

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    const c: f64 = 1.00001;
    const n = 100000;
    try stdout.print("{d} is more accurate than {d}\n", .{ normal(c, n), small_error(c, n) });
}
