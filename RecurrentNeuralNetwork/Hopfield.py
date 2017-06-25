import pandas as pd
import numpy as np
import neurolab as nl

# Read Data
I_train = pd.read_csv('../ML_Whitening/newTrain.csv')
X_train = I_train.ix[0:9999, :].values.astype('float')
X_test = I_train.ix[10000:10999, : ].values.astype('float')
I_label = pd.read_csv('../train.csv')
X_labels = I_label.ix[0:9999, 0].values.astype('int')
Y_labels = I_label.ix[10000:10999, 0].values.astype('int')
Z_labels = np.zeros(1000).astype('int')
del I_train, I_label

# Test
net = nl.net.newhop(X_train, max_init=100, delta=0)
out1 = (net.sim(X_test)).astype('int')
out2 = (net.sim(X_train)).astype('int')
del X_test, X_train
t = 0
for i in range(1000):
	a=0
	for j in range(10000):
		if(np.count_nonzero(out1[i]==out2[j]) > a):
			a = np.count_nonzero(out1[i]==out2[j])
			Z_labels[i] = X_labels[j]
	if(Y_labels[i]==Z_labels[i]):
		t = t+1
print(t/1000)

# Write Data
pd.DataFrame({"ImageId": range(1,len(Y_labels)+1), "Label": Y_labels}).to_csv('output.csv', index=False, header=True)