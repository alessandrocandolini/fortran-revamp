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
    export BLAS_LIB=${pkgs.openblas}/lib
    export LAPACK_LIB=${pkgs.lapack}/lib
    ARCH=$(uname -m)  # Detect if running on ARM64
    if [ "$ARCH" = "arm64" ]; then
      export FFLAGS="-O3 -ftree-vectorize -mcpu=apple-m1 -fopenmp"
    else
      export FFLAGS="-O3 -ftree-vectorize -fopenmp"
    fi
  '';
}
