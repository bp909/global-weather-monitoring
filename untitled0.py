# -*- coding: utf-8 -*-
"""
Created on Tue Apr 28 22:18:14 2020

@author: brain
"""
#Generates an image for the report

import numpy as np
import numpy.fft as npfft
import matplotlib as mpl
import matplotlib.pyplot as plt
import matplotlib.dates as dates
import matplotlib.ticker as ticker


PosSpr = 100*np.genfromtxt(r"C:\Users\brain\OneDrive - The University of Nottingham\3rd Year Project\recourses\Summary data\PosAndSpre1.csv", delimiter=",")


tt = PosSpr[:,:]

plt.imshow(tt, cmap='Greys')

plt.imsave('line.png', tt, cmap='Greens')
