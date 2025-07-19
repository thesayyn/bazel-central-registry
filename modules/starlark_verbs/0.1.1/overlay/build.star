def impl(ctx):
    print("Invoking Bazel ")
    # ctx.fs -> BXL FS  *in progress
    # ctx.net.download()
    # ctx.bazel.build_events
    # ctx.term.draw
    # ctx.stdio
    # ctx.query
    # ctx.aquery
    # ctx.module.add()
    # ctx.terminal
    info = ctx.bazel(
        "info",
        args = [],
        startup_options = [],
        # TODO:
        # working_dir = ctx.working_dir,
        # stdio = ctx.stdio,
    )
    out = info.wait()
    print(out.stdout)
    print(out.stderr)


build = task(
    impl = impl,
    task_args = {
        "startup_options": args.startup_options(),
        "args": args.var_args(),
    }
)
