def impl(ctx):
    info = ctx.bazel(
        "info",
        args = [],
        startup_options = [],
    )
    out = info.wait()
    print(out.stderr)
    print(out.stdout)


info = task(
    impl = impl,
    task_args = {
        "startup_options": args.startup_options(),
        "args": args.var_args(),
    }
)
