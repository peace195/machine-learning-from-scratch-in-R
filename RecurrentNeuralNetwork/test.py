import pandas as pd
import numpy as np
import neurolab as nl

# Read Data
X_test = pd.read_csv('../ML_Whitening/newTest.csv').ix[0:999, :].values.astype('float')
X_train = pd.read_csv('../ML_Whitening/newTrain.csv').ix[:, :].values.astype('float')
X_labels = pd.read_csv('../train.csv').ix[:, 0].values.astype('int')
Y_labels = np.zeros(1000).astype('int')

# Test
net = nl.net.newhop(X_train, max_init=100, delta=0)
out1 = (net.sim(X_test)).astype('int')
out2 = (net.sim(X_train)).astype('int')
del X_test, X_train
for i in range(1000):
	a=0
	for j in range(42000):
		if(np.count_nonzero(out1[i]==out2[j]) > a):
			a = np.count_nonzero(out1[i]==out2[j])
			Y_labels[i] = X_labels[j]

# Write Data
pd.DataFrame({"ImageId": range(1,len(Y_labels)+1), "Label": Y_labels}).to_csv('output.csv', index=False, header=True)