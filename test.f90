program test_blas
  implicit none
  external sgemm
  integer, parameter :: n = 1000
  real, dimension(n, n) :: A, B, C
  real :: alpha, beta

  ! Initialize matrices
  A = 1.0
  B = 2.0
  alpha = 1.0
  beta = 0.0

  ! Perform matrix multiplication C = alpha*A*B + beta*C using BLAS
  call sgemm('N', 'N', n, n, n, alpha, A, n, B, n, beta, C, n)

  print *, "Matrix multiplication complete!"
end program test_blas
