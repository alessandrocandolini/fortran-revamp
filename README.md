# llm-playground

Nothing interesting here for now. Just me trying to setup nix for modern fortran programming. Hopefully the repo will evolve into something interesting.

## How to run the examples?

The repo provides a simple `shell.nix` file which installs `gfortran`, `blas`, `lapack`, and an LSP server for fortran `fortls`.
Assuming [https://nixos.org/](nix) is available on the machine, in a shell type
```
nix-shell
```
and then you can compile using 
```
gfortran -O3 test.f90 -o test -L$BLAS_LIB -lopenblas -framework Accelerate
```
(`Accelerate` is for mac silicon to parallelise BLAS)

To run the executable
```
./test
```

Commands can also be executed via nix-shell directly. For instance,
```bash
 nix-shell --pure --run "gfortran -O3 test.f90 -o test -L$BLAS_LIB -lopenblas -framework Accelerate"
```
