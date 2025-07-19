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


def impl2(ctx):
    build = ctx.build(["//:hello"]);
    for event in build.events():
        if event.type == "progress":
            print(event.payload.stderr)
            print(event.payload.stdout)
        # print(dir(event))

build2 = task(
    impl = impl2,
    task_args = {
        "target": args.string(),
    }
)
