import pyfftw
import numpy as np

# read corr.dat

raw = np.loadtxt('corr.dat')

N = raw.shape[0]

print("Number of lines", N)

time = pyfftw.zeros_aligned(2*N, dtype=float)
corr = pyfftw.zeros_aligned(2*N, dtype='complex256')

time[N:] = raw[:, 0]
time[:N] = -raw[:, 0][::-1]

corr[N:] = raw[:, 1] + raw[:, 2]*1.0j
corr[:N] = (raw[:, 1] - raw[:, 2]*1.0j)[::-1]

# write corr to file
np.savetxt('corr_from_np.dat', corr, fmt='(%.18e, %.18e)')

# do FFT
spec = pyfftw.interfaces.numpy_fft.fft(corr)
# write spec to file
np.savetxt('spec_forward_from_np.dat', spec, fmt='(%.18e, %.18e)')
