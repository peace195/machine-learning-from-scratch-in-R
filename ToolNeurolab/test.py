import numpy as np
import pandas as pd
import neurolab as nl
from neurolab import trans

# Read Data
X_test = (pd.read_csv('../test.csv').values).astype('int')

# Pre-processing
Y_labels = np.zeros(28000).astype('int')
Y_test = np.zeros((28000,784))
for i in range(28000):
	for j in range(784):
		if (X_test[i,j]>200):
			Y_test[i,j] = 1
del X_test

# Test
net = nl.load('newff.net')
out = net.sim(Y_test)
for i in range(28000):
	Y_labels[i] = np.argmax(out[i])

del out, Y_test

# Write Data	
pd.DataFrame({"ImageId": range(1,len(Y_labels)+1), "Label": Y_labels}).to_csv('output.csv', index=False, header=True)