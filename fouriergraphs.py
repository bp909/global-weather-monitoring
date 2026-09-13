# -*- coding: utf-8 -*-
"""
Created on Mon Apr 27 00:37:31 2020

@author: brain
"""
# This script loads in the values from the data and fourier transforms it and plots it. This allows us to find the frequency to find what affects the vegetation movement
import numpy as np
import numpy.fft as npfft
import matplotlib as mpl
import matplotlib.pyplot as plt
import matplotlib.dates as dates
import matplotlib.ticker as ticker

mpl.rcParams['text.usetex'] = True 
mpl.rcParams['text.latex.preamble'] = [r'\usepackage[cm]{sfmath}']
mpl.rcParams['font.family'] = 'sans-serif'
mpl.rcParams['font.sans-serif'] = 'cm'
mpl.rcParams['font.size'] = 20

VegCov = 100*np.genfromtxt(r"C:\Users\brain\OneDrive - The University of Nottingham\3rd Year Project\recourses\Summary data\VegCov0420.csv", delimiter=",")

VegCovMean5 = 100*np.genfromtxt(r"C:\Users\brain\OneDrive - The University of Nottingham\3rd Year Project\recourses\Summary data\VegCov5.csv", delimiter=",")

VegCovErr = np.genfromtxt(r"C:\Users\brain\OneDrive - The University of Nottingham\3rd Year Project\recourses\Summary data\ProErrVegCov.csv", delimiter=",")

MaxPos = 3000*np.genfromtxt(r"C:\Users\brain\OneDrive - The University of Nottingham\3rd Year Project\recourses\Summary data\MaxLoc1.csv", delimiter=",")-1

CloCov = np.genfromtxt(r"C:\Users\brain\OneDrive - The University of Nottingham\3rd Year Project\recourses\Summary data\CloudCov2019.csv", delimiter=",")

CloCovMean7 = np.genfromtxt(r"C:\Users\brain\OneDrive - The University of Nottingham\3rd Year Project\recourses\Summary data\CloudCov7.csv", delimiter=",")

VegCovUnc = np.genfromtxt(r"C:\Users\brain\OneDrive - The University of Nottingham\3rd Year Project\recourses\Summary data\ProErrVegCov.csv", delimiter=",")

MaxPosError = 3000*np.genfromtxt(r"C:\Users\brain\OneDrive - The University of Nottingham\3rd Year Project\recourses\Summary data\PosAndSpreError.csv", delimiter=",")


Fs423 = 365.25/14
Fs365 = 365
L423 = 423
L365 = 365



## TotVegCov
ffig1 = plt.figure()

# Raw Data
tvcfftrd = npfft.fft(VegCov)

P2rd = np.abs(tvcfftrd/L423)
P1rd = P2rd[1:np.int(L423/2+1.5)]
P1rd[2:-2] = 2*P1rd[2:-2]

li = np.arange(0,(L423/2))
la = np.arange(0,(L365/2))

# Moving Mean
tvcfftmm = npfft.fft(VegCovMean5)
ax = plt.subplot(111)

P2mm = np.abs(tvcfftmm/L423)
P1mm = P2mm[1:np.int(L423/2+1.5)]
P1mm[2:-2] = 2*P1mm[2:-2]


f423 = Fs423*li/L423

rdtvcfft, = ax.plot(f423, P1rd, color= 'k', linestyle= ':', label="Fourier Transform of the Raw Data", linewidth=0.9)
mmtvcfft, = ax.plot(f423, P1mm, color= 'k', linestyle= '-', label="Fourier Transform of the Moving Mean, with Periods of 5", linewidth=0.9)
plt.xlabel('Frequency (per year)')
plt.ylabel('Power (of the Fourier Transform \n of the Vegetation Coverage Percentage)')

ymax = np.amax(P1rd)
xpos = np.argmax(P1rd)
xmax = f423[xpos]

ax.annotate(str(np.around(xmax, decimals=2)), xy=(xmax+0.05, ymax-0.02), xytext=(xmax+0.5, ymax-0.1), arrowprops=dict(facecolor='black', arrowstyle='-|>'),)

tick_spacing = 1

ax.xaxis.set_major_locator(ticker.MultipleLocator(tick_spacing))

plt.legend(handles= [rdtvcfft,mmtvcfft], loc='upper right')
ffig1.set_size_inches(25, 7)


## MaxIntPos
ffig2 = plt.figure()

mpfft = npfft.fft(MaxPos)
ax2 = plt.subplot(111)

P2mp = np.abs(mpfft/L423)
P1mp = P2mp[1:np.int(L423/2+1.5)]
P1mp[2:-2] = 2*P1mp[2:-2]

fftmp, = ax2.plot(f423, P1mp, color= 'k', linestyle= '-', label="Fourier Transform of the Raw Data", linewidth=0.9)
plt.xlabel('Frequency (per year)')
plt.ylabel('Power (of the Fourier Transform \n of the Maximum Intensity Position)')

ymax2 = np.amax(P1mp)
xpos2 = np.argmax(P1mp)
xmax2 = f423[xpos2]

ax2.annotate(str(np.around(xmax2, decimals=3)), xy=(xmax2, ymax2), xytext=(xmax2+0.7, ymax2-0.1e6), arrowprops=dict(facecolor='black', arrowstyle='-|>'),)


ffig2.set_size_inches(25, 7)

ax2.xaxis.set_major_locator(ticker.MultipleLocator(tick_spacing))

## CloCov

f365 = Fs365*la/L365


ffig3 = plt.figure()

ccfft = npfft.fft(CloCov)
ax3 = plt.subplot(111)

P2cc = np.abs(ccfft/L365)
P1cc = P2cc[1:np.int(L365/2+1.5)]
P1cc[2:-2] = 2*P1cc[2:-2]

fftcc, = ax3.plot(f365, P1cc, color= 'k', linestyle= '-', label="Fourier Transform of the Raw Data", linewidth=0.9)


plt.xlabel('Frequency (per year)')
plt.ylabel('Power (of the Fourier Transform \n of the Cloud Coverage Percentage)')

ymax3 = np.amax(P1cc)
xpos3 = np.argmax(P1cc)
xmax3 = f365[xpos3]


ax3.annotate(str(np.around(xmax3, decimals=3)), xy=(xmax3, ymax3), xytext=(xmax3+20, ymax3-1), arrowprops=dict(facecolor='black', arrowstyle='-|>'),)

ffig3.set_size_inches(14, 7)

## VegCovRes

VegCovRes = VegCov - VegCovMean5


vcefft = npfft.fft(VegCovRes)
P2vce = np.abs(vcefft/L423)
P1vce = P2vce[1:np.int(L423/2+1.5)]
P1vce[2:-2] = 2*P1vce[2:-2]

VegCov1 = np.nan_to_num(VegCov)
VegCovUnc1 = np.nan_to_num(VegCovErr)
ffff = VegCovUnc1*2*VegCov1
vcufft = npfft.fft(ffff)
P2vcu = np.abs(vcufft/L423)
P1vcu = P2vcu[1:np.int(L423/2+1.5)]
P1vcu[2:-2] = 2*P1vcu[2:-2]

## VegCovResUnc

fig, ax1 = plt.subplots()

color = 'k'
ax1.set_xlabel('Frequency (per year)')
ax1.set_ylabel('Power (of the Fourier Transform of the \n Vegetation Coverage Residual Difference)', color=color)
ax1.plot(f423, P1vce, color= 'k', linestyle= '-', label="Fourier Transform of the Residual Difference", linewidth=0.9)

ax1.tick_params(axis='y', labelcolor=color)
ax1.ticklabel_format(axis='y', style='sci', scilimits=(0,0))
ax2 = ax1.twinx()  # instantiate a second axes that shares the same x-axis

color = 'r'
ax2.set_ylabel('Power (of the Fourier Transform of the \n Vegetation Coverage Uncertainty (95\% Boundaries))', color=color)  # we already handled the x-label with ax1
ax2.plot(f423, P1vcu, color= 'r', linestyle= '-', label="Fourier Transform of the Uncertainty", linewidth=0.9)

ax2.tick_params(axis='y', labelcolor=color)
ax2.ticklabel_format(axis='y', style='sci', scilimits=(0,0))

fig.set_size_inches(25, 7)  # otherwise the right y-label is slightly clipped
plt.show()
ax1.xaxis.set_major_locator(ticker.MultipleLocator(tick_spacing))

## CloCovRes

CloCovRes = CloCov - CloCovMean7

ffig3 = plt.figure()

ccfft = npfft.fft(CloCovRes)
ax3 = plt.subplot(111)

P2cc = np.abs(ccfft/L365)
P1cc = P2cc[1:np.int(L365/2+1.5)]
P1cc[2:-2] = 2*P1cc[2:-2]

fftcc, = ax3.plot(f365, P1cc, color= 'k', linestyle= '-', label="Fourier Transform of the Raw Data", linewidth=0.9)


plt.xlabel('Frequency (per year)')
plt.ylabel('Power (of the Fourier Transform of the \n Cloud Coverage Residual Difference)')

ymax3 = np.amax(P1cc)
xpos3 = np.argmax(P1cc)
xmax3 = f365[xpos3]


ax3.annotate(str(np.around(xmax3, decimals=3)), xy=(xmax3, ymax3), xytext=(xmax3+20, ymax3-0.4), arrowprops=dict(facecolor='black', arrowstyle='-|>'),)

ffig3.set_size_inches(14, 7)

## MaxPosUnc

ffig2 = plt.figure()

mpfft = npfft.fft(MaxPosError)
ax2 = plt.subplot(111)

P2mp = np.abs(mpfft/L423)
P1mp = P2mp[1:np.int(L423/2+1.5)]
P1mp[2:-2] = 2*P1mp[2:-2]

fftmp, = ax2.plot(f423, P1mp, color= 'k', linestyle= '-', label="Fourier Transform of the Raw Data", linewidth=0.9)
plt.xlabel('Frequency (per year)')
plt.ylabel('Power (of the Fourier Transform of the \n Maximum Intensity Position Uncertainty (95\% Boundaries))')

ymax2 = np.amax(P1mp)
xpos2 = np.argmax(P1mp)
xmax2 = f423[xpos2]

ax2.annotate(str(np.around(xmax2, decimals=3)), xy=(xmax2, ymax2), xytext=(xmax2+0.7, ymax2-0.4e3), arrowprops=dict(facecolor='black', arrowstyle='-|>'),)

ax2.ticklabel_format(axis='y', style='sci', scilimits=(0,0))

ffig2.set_size_inches(25, 7)

ax2.xaxis.set_major_locator(ticker.MultipleLocator(tick_spacing))







