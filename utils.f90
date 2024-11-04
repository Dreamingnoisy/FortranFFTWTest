module utils
    use global_constants

    implicit none
    public :: get_lines, read_data

contains


subroutine read_data(Funit, N, time, datos)
    integer, intent(in) :: Funit ! File unit identifier
    integer, intent(in) :: N    ! size of array
    integer :: i
    real, dimension(1:N), intent(out) :: time
    double complex, dimension(1:N), intent(out) :: datos
    real :: temp_time, temp_real, temp_imag

    open(Funit, file=Fname(Funit), status='OLD')
    do i=1,N
        read(Funit, *) temp_time, temp_real, temp_imag
        time(i) = temp_time
        datos(i) = complex(temp_real, temp_imag)
    enddo

    end subroutine read_data


subroutine get_lines(Funit, N)
    integer, intent(in) :: Funit
    integer, intent(out) :: N
    integer :: IO

    N = 0
    open(Funit, file=Fname(Funit), status='OLD')
    do 
        read(Funit, *, iostat=IO)
        if (IO/=0) exit
        N = N + 1
    enddo
    close(Funit)
    end subroutine get_lines
    
end module utils





