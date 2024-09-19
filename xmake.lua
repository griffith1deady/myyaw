add_rules("mode.debug", "mode.release")

target("bloody")
    set_kind("binary")
    add_files("src/main.nim")
    set_toolchains("clang")
    