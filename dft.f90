program main

    use global_constants
    use utils
    implicit none

    include 'fftw3.f'


    integer(8) :: plan, FFTW_DIRECTION
    integer :: i, N
    double complex, allocatable :: datos(:), corr(:), spectrum(:)
    real, allocatable :: time(:), t(:)
    ! assign global variables
    call assign_globals

    ! initialize log file
    open(unit=Flog, file=Fname(Flog), status='replace')

    write(Flog, *) "FFTW3 numerical test"

    ! do i=1,N
    !     test_in(i) = i
    !     enddo
    ! FFTW_DIRECTION = FFTW_FORWARD

    ! call dfftw_plan_dft_1d(plan,N,test_in,corr,FFTW_DIRECTION,FFTW_ESTIMATE)
    ! call dfftw_execute(plan, test_in, corr)
    ! call dfftw_destroy_plan(plan)

    ! open(unit=Fcorr, file=Fname(Fcorr), status='replace')
    ! do i=1,N
    !     write(Fcorr, *) test_in(i)
    ! enddo
    ! close(unit=Fcorr, status='keep')

    ! print*, Fcorr
    

    write(Flog, *) "Reading correlation function from file corr.dat"
    N = 0
    call get_lines(Fcorr, N)
    write(Flog, *) "Total number of lines", N

    allocate(datos(N))
    allocate(time(N))
    call read_data(Fcorr, N, time, datos)
    write(Flog, *) "Finished"

    write(Flog, *) "Reconstrut correlation function with size 2*N"
    allocate(corr(2*N))
    do i=1,N
        corr(i+N) = datos(i)
        corr(N-i+1) =  real(datos(i)) - complex(0.0, 1.0)*aimag(datos(i))
         enddo
    write(Flog, *) "Reconstrut Finished"

    write(Flog, *) "Track correlation function"
    write(Flog, *) "Save correlation function to file", Fname(Fcorr_f)
    open(unit=Fcorr_f, file=Fname(Fcorr_f), status='replace')
    do i=1,2*N
        write(Fcorr_f, *) corr(i)
        enddo
    close(Fcorr_f)
    
    write(Flog, *) "Call FFTW3 for test"
    allocate(spectrum(2*N))
    FFTW_DIRECTION = FFTW_FORWARD

    call dfftw_plan_dft_1d(plan,2*N,corr,spectrum,FFTW_DIRECTION,FFTW_ESTIMATE)
    call dfftw_execute(plan, corr, spectrum)
    call dfftw_destroy_plan(plan)

    write(Flog, *) "Printing spectrum to file 'spec.dat'"
    open(unit=Fspec, file=Fname(Fspec), status='replace')
    do i=1,2*N
        write(Fspec, *) spectrum(i)
        enddo
    close(Fspec)
        




end program
