import pandas as pd
import numpy as np
import neurolab as nl
from neurolab import trans

# Read Data
I_train = pd.read_csv('../train.csv')
X_labels = (I_train.ix[:, 0].values).astype('int')
X_train = (I_train.ix[:, 1:].values).astype('int')

# Pre-processing
Y_labels = np.zeros((42000,10))
Y_train = np.zeros((42000,784))
for i in range(42000):
	Y_labels[i][X_labels[i]] = 1
	for j in range(784):
		if (X_train[i,j]>200):
			Y_train[i,j] = 1
del I_train, X_labels, X_train

# Create Multi Layer Perceptron Network
net = nl.net.newff(nl.tool.minmax(Y_train), [30,10], transf=[trans.LogSig(), trans.LogSig()])
net.trainf = nl.train.train_gd
net.errorf = nl.error.CEE()
for l in net.layers:
	l.initf = nl.init.InitRand([-0.5, 0.5], 'wb')
net.init()
error = net.train(Y_train, Y_labels, epochs=100, show=1, goal=0.01, adapt=True)
net.save('newff.net')

# Plot results
import pylab as pl
pl.plot(error)
pl.xlabel('Epoch number')
pl.ylabel('Train error')
pl.grid()
pl.show()