#!/usr/bin/env python

# The task is to plot
# (1-cos(x))/x^2
# in the interval [-4e-8, 4e-8]

import numpy as np
import matplotlib.pyplot as plt
#libraries

#specify number of points
N = int(input("How many points? "))

x = np.linspace(-4e-8,4e-8,N)
y_1 = (1-np.cos(x))/x**2
y_2 = -x**2/24.0    #subject to truncation error of higher order terms

#debug the reason
#print (1-np.cos(x))[:5]
#print (x**2)[:5]

#plot now
plt.plot(x,y_1)
plt.plot(x,y_2)
plt.ylim([-1e-15,1e-15])
plt.show()
