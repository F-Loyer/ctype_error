# ctype_error

This example shows an example of fail of using a C function in a `.a` archive with ctypes with the gcc toolchain.

`a.c` expose a `f` function. The `Makefile` compiles it into a `a.o` object and packages it in a `libtest.a` archive.

The `main.ml` file tries to call this function with the Ctype module. It fails beacause Ctypes uses a dynamic link and 
the gcc toolchain only extract from the `libtest.a` archives the object files which are statically linked.

The error is:

```
$ dune exec ./main.exe
Done: 100% (2/2, 0 left) (jobs: 0)Fatal error: exception Dl.DL_error("_build/default/main.exe: undefined symbol: f")
```
