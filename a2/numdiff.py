#!/usr/bin/env python

# The task is to plot relative error in differentiaion
# versus the interval size used
# on a log-log plot

import numpy as np
import matplotlib.pyplot as plt
#libraries

#specify number of points
N = int(input("How many points? "))

#describe all interval sizes
H = []
h = 0.25*np.pi
for i in range(N):
    H.append(h)
    h = 0.5*h

H = np.array(H)
x_0 = 0.25*np.pi
#generate everything we'll need
sin_i = np.sin(x_0+0.0*H)
sin_i_f1 = np.sin(x_0+1.0*H)
sin_i_f2 = np.sin(x_0+2.0*H)
sin_i_b1 = np.sin(x_0-1.0*H)
sin_i_b2 = np.sin(x_0-2.0*H)

exact_diff = np.cos(x_0)

#Order h, and relative error
diff_Oh = (sin_i_f1-sin_i)/H
rel_Oh = np.abs(diff_Oh-exact_diff)/exact_diff 

#Order h^2, and relative error
diff_Oh2 = (sin_i_f1-sin_i_b1)/(2*H)
rel_Oh2 = np.abs(diff_Oh2-exact_diff)/exact_diff 

#Order h^4, and relative error
diff_Oh4 = (8*(sin_i_f1-sin_i_b1)-(sin_i_f2-sin_i_b2))/(12*H)
rel_Oh4 = np.abs(diff_Oh4-exact_diff)/exact_diff 

#plot now
fig = plt.figure()
fig.suptitle('Error vs Interval Size',fontsize=12,fontweight='bold')
ax = fig.add_subplot(111)
ax.set_xlabel('Log h')
ax.set_ylabel('Log Relative Error')

plt.loglog(H,rel_Oh,label='Order h')
plt.loglog(H,rel_Oh2,label='Order h^2')
plt.loglog(H,rel_Oh4,label='Order h^4')

plt.legend(bbox_to_anchor=(1.,0.),loc=4,borderaxespad=0.)
plt.show()
