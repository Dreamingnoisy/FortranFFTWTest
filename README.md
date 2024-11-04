# FortranFFTWTest
Example codes to test Fortran FFTW3

# Fortran Source Files
`dft.f90`: read `corr.dat`, generate correlation function with Hermitian symmetry, and do DFT  
`utils.f90`: subroutines for utility  
`global_constants.f90`: input and ouput files manager  

# Python Files
`fft.py`: do same stuff as `dft.f90` 
`CORRGEN.py`: randomly generate `corr.dat` 

# Fortran codes installation 
## Dependence
`gfortran`: my local version is 9.5 
`fftw3`: see FFTW3 official site on how to install 
`make` 

## Install steps
1. Modify the `Makefile` and make sure the correct FFTW3 installation path is used
2. In the CLI, type `make`
3. A `dft` binary is generated if no error appears.

## Run compiled Fortran code
In the CLI, type `./dft` to run the code, make sure there is a correct formatted `corr.dat`


# Python dependencies
1. Numpy
2. pyfftw
These packages can be install via `pip` or `conda`

# Run Python scripts
In the CLI, type `python fft.py` to read `corr.dat` and output spectrum

# Randomly generate `corr.dat`
`python CORRGEN.py 1024` to randomly generate a corr.dat of size 1024 


# Input files
`corr.dat`: 3 columns data of correlation time, real part of correlation function and imaginary part of correlation function, respectively

# Output files
`spec.dat`: Fortran generated FFT results 
`spec_forward_from_np.dat`: Numpy generated FFT results 



