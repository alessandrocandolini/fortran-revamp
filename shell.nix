{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.gfortran
    pkgs.openblas
    pkgs.lapack
    pkgs.fortls
  ];

  shellHook = ''
    export FC=gfortran
    export FFLAGS="-O3 -ftree-vectorize -mcpu=apple-m1 -fopenmp"
    export BLAS_LIB=${pkgs.openblas}/lib
    export LAPACK_LIB=${pkgs.lapack}/lib
  '';
}
