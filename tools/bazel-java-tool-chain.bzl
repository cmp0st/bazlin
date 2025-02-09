def format(target):
    runtime_infos = {k: v for k, v in providers(target).items() if k.endswith("JavaRuntimeInfo")}

    if len(runtime_infos) == 1:
        java_runtime_info = runtime_infos.values()[0]

        # https://bazel.build/rules/lib/providers/JavaRuntimeInfo
        return java_runtime_info.java_home

    fail("Unable to obtain JavaRuntimeInfo.")
