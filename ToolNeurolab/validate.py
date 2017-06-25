import pandas as pd
import numpy as np
import neurolab as nl
from neurolab import trans

# Read Data
I_valid = pd.read_csv('../train.csv')
X_labels = (I_valid.ix[:, 0].values).astype('int')
X_valid = (I_valid.ix[:, 1:].values).astype('int')

# Pre-processing
Y_valid = np.zeros((42000,784))
for i in range(42000):
	for j in range(784):
		if (X_valid[i,j]>200):
			Y_valid[i,j] = 1
del I_valid, X_valid

# Test
net = nl.load('newff.net')

out = net.sim(Y_valid)


# Validate	
j = 0
for i in range(42000):
	if (np.argmax(out[i]) == X_labels[i]):
		j = j+1
print('Accuracy: ')
print(j/42000)