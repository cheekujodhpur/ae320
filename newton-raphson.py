#!/usr/bin/env python

# We will try to implement a program to compute sqrt(c)

#fungus
EPSILON = 1e-15

def sqrt_0(c):
    #trial solution
    if c>=2.0:
        res = c/2.0 #square root is smaller than half the number
    else:
        res = c

    #limit number of iterations too
    numiter = 0

    while abs(res**2-c) > c*EPSILON and numiter<20:
        print res,abs(res**2-c)
        res = res/2.0 + c/(2.0*res) #newton raphson update
        numiter = numiter + 1
    return res, numiter

print sqrt_0(12566443)
