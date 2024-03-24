require('venkat').config.languages = {
    go = { cmdline = "go run %s", pattern = "main.go" },
    java = { cmdline = "java %s", pattern = "Main.java" },
    python = { cmdline = "python %s", pattern = "main.py" },
    rust = { cmdline = "cargo run %s", pattern = "main.rs" },
    zig = { cmdline = "zig run %s", pattern = "main.zig" },
}

