import numpy as np
import sys

# Given length of input
# randomly generate corr.dat with size of 2N

N = int(sys.argv[1])

print(f"Length {N}")

corr = np.zeros((N, 3))

dt = np.random.rand()
corr[:, 0] = np.arange(N)*dt
corr[:, 1] = np.random.rand(N)
corr[:, 2] = np.random.rand(N)

np.savetxt('corr.dat', corr, fmt="%18f  %18f  %18f")

