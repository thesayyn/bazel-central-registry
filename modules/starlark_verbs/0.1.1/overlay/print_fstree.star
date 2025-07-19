def impl(ctx):
    pprint(ctx.fs)
    for entry in ctx.fs.read_dir("."):
        print(entry.path)
        if entry.is_dir:
            for entry in ctx.fs.read_dir(entry.path):
                print("   " + entry.path)

print_fstree = task(
    impl = impl,
    task_args = {
        "startup_options": args.startup_options(),
        "args": args.var_args(),
    }
)
