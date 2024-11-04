# compiler
FC = gfortran9.5 -fPIE

# compiler flags
FFLAGS = -O3

# FFTW path
FFTW_PATH = /home/nsw/software/fftw3
# library flags
LDFLAGS = -L${FFTW_PATH}/lib
# include flags
IFLAGS = -I${FFTW_PATH}/include

# library arguments
LIBS = -lfftw3

# source 
SRCS = global_constants.f90 utils.f90
MAIN = dft.f90
OBJS = global_constants.o dft.o utils.o

# program name
PROG = dft

.PHONY: all
all: ${SRCS}
	${FC}  -c $^ ${FFLAGS} ${LDFLAGS} ${IFLAGS} ${LIBS}
	${FC}  -c ${MAIN} ${FFLAGS} ${LDFLAGS} ${IFLAGS} ${LIBS}
	${FC}  -o ${PROG} ${OBJS} ${FFLAGS} ${LDFLAGS} ${IFLAGS} ${LIBS}

clean:
	-rm *.o *.mod
