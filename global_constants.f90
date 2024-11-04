module global_constants
    implicit none

    ! ---------
    ! I/O files
    ! ---------
    !
    integer, save :: Max_n_file
    character(len=30), allocatable, save :: Fname(:)
    !
    ! Unit numbers
    !
    integer, save :: Fcorr, Fchi, Flog, Fspec, Fcorr_f
    double complex :: Im
    

contains
    
    subroutine assign_globals
        ! Complex 1.0j
        Im = complex(0.0, 1.0) 

        Max_n_file = 1000
        allocate(Fname(1:Max_n_file))
        Fname = repeat(' ', 30)
    ! Unit number for input files
        Fcorr = 7
        Fchi = 8
        Fspec = 9
        Fcorr_f = 10
        Flog = 17
    ! Unit number for output files

    ! ----------
    ! File names
    ! ----------

    Fname(Fcorr) = 'corr.dat'
    Fname(Fchi) = 'chi.dat'
    Fname(Fspec) = 'spec.dat'
    Fname(Fcorr_f) = 'corr_from_fortran.dat'
    Fname(Flog) = 'log'
    end subroutine assign_globals
end module global_constants



