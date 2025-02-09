# Kotlin and Bazel -- How can?

I need to use both `kotlin` and `bazel` for $dayjob. This is an example
repository (basic http server) to help me learn how to work with both of
these. The goal is to be able to use neovim instead of IntelliJ IDEA to
work in with this kind of toolchain.

## Helpful links

- https://enoent.fr/posts/compiling-a-kotlin-application-with-bazel/
- https://bazel.build/start/java
- https://github.com/bazelbuild/rules_kotlin

## Getting [`kotlin-language-server`](https://github.com/fwcd/kotlin-language-server)

As you can imagine, the folks at JetBrains aren't keen on supporting a language
server for Kotlin so there is this open source version. Here are the concerns
with using this with bazel:

- The kotlin compiler isn't in our `PATH` so how will we get the language
server to find it? (Hint: some `bazel` query bullshit probably)
- The classpath is also going to be hiding is some silly location as well. How can we
make sure that the language server can find it?

Work in progress:

```bash
# Set up bazel remote jdk etc by building the project for the first time:
bazelisk build //...

# Now set up JAVA_HOME and PATH to use bazel jdk:
. .env

# TODO: Add the bazel kotlin compiler to the path as well so its accessible to neovim?
# NB: its the the path `$(bazelisk info output_base)/external/rules_kotlin++rules_kotlin_extenstions+com_github_jetbrains_kotlin_git/bin`
```
