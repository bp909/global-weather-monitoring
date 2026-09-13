# -*- coding: utf-8 -*-
"""
Created on Sat Apr 25 19:20:32 2020

@author: brain
"""
# This file plots data and calculates specific values for graphs in the report. Certain parts are commented out to change what graphs are outputted
import numpy as np
import matplotlib as mpl
import matplotlib.pyplot as plt
import matplotlib.dates as dates

mpl.rcParams['text.usetex'] = True 
mpl.rcParams['text.latex.preamble'] = [r'\usepackage[cm]{sfmath}']
mpl.rcParams['font.family'] = 'sans-serif'
mpl.rcParams['font.sans-serif'] = 'cm'
mpl.rcParams['font.size'] = 20

VegCov = 100*np.genfromtxt(r"C:\Users\brain\OneDrive - The University of Nottingham\3rd Year Project\recourses\Summary data\VegCov0420.csv", delimiter=",")

MaxPos = 3000*(np.genfromtxt(r"C:\Users\brain\OneDrive - The University of Nottingham\3rd Year Project\recourses\Summary data\MaxLoc1.csv", delimiter=",")-1256)

MaxPosError = 3000*np.genfromtxt(r"C:\Users\brain\OneDrive - The University of Nottingham\3rd Year Project\recourses\Summary data\PosAndSpreError.csv", delimiter=",")

PosSpr = 100*np.genfromtxt(r"C:\Users\brain\OneDrive - The University of Nottingham\3rd Year Project\recourses\Summary data\PosAndSpre1.csv", delimiter=",")

CloCov = np.genfromtxt(r"C:\Users\brain\OneDrive - The University of Nottingham\3rd Year Project\recourses\Summary data\CloudCov2019.csv", delimiter=",")

VegCovMean3 = 100*np.genfromtxt(r"C:\Users\brain\OneDrive - The University of Nottingham\3rd Year Project\recourses\Summary data\VegCov3.csv", delimiter=",")

VegCovMean5 = 100*np.genfromtxt(r"C:\Users\brain\OneDrive - The University of Nottingham\3rd Year Project\recourses\Summary data\VegCov5.csv", delimiter=",")

VegCovErrMean5 = np.genfromtxt(r"C:\Users\brain\OneDrive - The University of Nottingham\3rd Year Project\recourses\Summary data\ProErrVegCovMean.csv", delimiter=",")

CloCovMean7 = np.genfromtxt(r"C:\Users\brain\OneDrive - The University of Nottingham\3rd Year Project\recourses\Summary data\CloudCov7.csv", delimiter=",")

VegCovErr = np.genfromtxt(r"C:\Users\brain\OneDrive - The University of Nottingham\3rd Year Project\recourses\Summary data\ProErrVegCov.csv", delimiter=",")

Dates = np.float64(np.arange(731600, (731600+5922), 1))
Dates14 = Dates[0::14]

x04 = 347 + 731600 + 1
x05 = x04 + 365
x06 = x05 + 365
x07 = x06 + 365
x08 = x07 + 366
x09 = x08 + 365
x10 = x09 + 365
x11 = x10 + 365
x12 = x11 + 366
x13 = x12 + 365
x14 = x13 + 365
x15 = x14 + 365
x16 = x15 + 366
x17 = x16 + 365
x18 = x17 + 365
x19 = x18 + 365

# fig1 = plt.figure()

# rawdata, = plt.plot_date(x=Dates14, y=VegCov, fmt= 'k:', label="Raw Data", linewidth=0.9)



# movmean, = plt.plot_date(x=Dates14, y=VegCovMean5, fmt= 'k-', label="Moving Mean, with Periods of 5", linewidth=0.9)

# uperrmovmean, = plt.plot_date(x=Dates14, y=VegCovMean5 + 2*VegCovErrMean5*VegCovMean5, fmt= 'k--', label="Uncertainty Boundaries (95\%)", linewidth=0.9)
# lowermovmean, = plt.plot_date(x=Dates14, y=VegCovMean5 - 2*VegCovErrMean5*VegCovMean5, fmt= 'k--', label="Uncertainty Boundaries (95\%)", linewidth=0.9)


# line1 = plt.axvline(x=x04, linestyle = '-.', label='Year Markers', color = 'k', linewidth=0.8)
# plt.axvline(x=x05, linestyle = '-.', label='2006', color = 'k', linewidth=0.8)
# plt.axvline(x=x06, linestyle = '-.', label='2007', color = 'k', linewidth=0.8)
# plt.axvline(x=x07, linestyle = '-.', label='2008', color = 'k', linewidth=0.8)
# plt.axvline(x=x08, linestyle = '-.', label='2009', color = 'k', linewidth=0.8)
# plt.axvline(x=x09, linestyle = '-.', label='2010', color = 'k', linewidth=0.8)
# plt.axvline(x=x10, linestyle = '-.', label='2011', color = 'k', linewidth=0.8)
# plt.axvline(x=x11, linestyle = '-.', label='2012', color = 'k', linewidth=0.8)
# plt.axvline(x=x12, linestyle = '-.', label='2013', color = 'k', linewidth=0.8)
# plt.axvline(x=x13, linestyle = '-.', label='2014', color = 'k', linewidth=0.8)
# plt.axvline(x=x14, linestyle = '-.', label='2015', color = 'k', linewidth=0.8)
# plt.axvline(x=x15, linestyle = '-.', label='2016', color = 'k', linewidth=0.8)
# plt.axvline(x=x16, linestyle = '-.', label='2017', color = 'k', linewidth=0.8)
# plt.axvline(x=x17, linestyle = '-.', label='2018', color = 'k', linewidth=0.8)
# plt.axvline(x=x18, linestyle = '-.', label='2019', color = 'k', linewidth=0.8)
# plt.axvline(x=x19, linestyle = '-.', label='2020', color = 'k', linewidth=0.8)

# fig1.set_size_inches(25, 7)
# plt.xlabel('Date Measured (Year)')
# plt.ylabel('Vegetation Coverage (\%)')
# plt.legend(handles= [rawdata,movmean,uperrmovmean,line1], loc='lower right')
# plt.show()


fig2 = plt.figure()
# ax1 = plt.subplot(111)

x = Dates14
y = np.arange(-1256*3000,3000*(2451-1256), 3000)

X, Y = np.meshgrid(x, y)
Z = PosSpr

plt.contourf(X, Y, Z, 20, cmap='Greens')

cbar = plt.colorbar();

cbar.set_label('Vegetation Intensity (\%)')

maxpos, = plt.plot_date(x=Dates14, y=MaxPos, label = 'Maximum Intensity Position',fmt= 'k-', linewidth=0.8)

maxposuer, = plt.plot_date(x=Dates14, y=(MaxPos + 2*MaxPosError), label = 'Uncertainty Boundaries (95\%)',fmt= 'k--', linewidth=0.8)
maxposler = plt.plot_date(x=Dates14, y=(MaxPos - 2*MaxPosError),fmt= 'k--', linewidth=0.8)



plt.ylim(-1256*3000,3000*(2451-1256))

fig2.set_size_inches(25, 7)

line2 = plt.axvline(x=x04, linestyle = '-.', label='Year Markers', color = 'k', linewidth=0.8)
plt.axvline(x=x05, linestyle = '-.', label='2006', color = 'k', linewidth=0.8)
plt.axvline(x=x06, linestyle = '-.', label='2007', color = 'k', linewidth=0.8)
plt.axvline(x=x07, linestyle = '-.', label='2008', color = 'k', linewidth=0.8)
plt.axvline(x=x08, linestyle = '-.', label='2009', color = 'k', linewidth=0.8)
plt.axvline(x=x09, linestyle = '-.', label='2010', color = 'k', linewidth=0.8)
plt.axvline(x=x10, linestyle = '-.', label='2011', color = 'k', linewidth=0.8)
plt.axvline(x=x11, linestyle = '-.', label='2012', color = 'k', linewidth=0.8)
plt.axvline(x=x12, linestyle = '-.', label='2013', color = 'k', linewidth=0.8)
plt.axvline(x=x13, linestyle = '-.', label='2014', color = 'k', linewidth=0.8)
plt.axvline(x=x14, linestyle = '-.', label='2015', color = 'k', linewidth=0.8)
plt.axvline(x=x15, linestyle = '-.', label='2016', color = 'k', linewidth=0.8)
plt.axvline(x=x16, linestyle = '-.', label='2017', color = 'k', linewidth=0.8)
plt.axvline(x=x17, linestyle = '-.', label='2018', color = 'k', linewidth=0.8)
plt.axvline(x=x18, linestyle = '-.', label='2019', color = 'k', linewidth=0.8)
plt.axvline(x=x19, linestyle = '-.', label='2020', color = 'k', linewidth=0.8)
plt.axhline(y=0, linestyle = '--', label='Approximate Equator', color = 'k', linewidth=0.8)
plt.axhline(y=775*3000, linestyle = ':', label='Approximate Tropic of Cancer', color = 'k', linewidth=0.8)
plt.axhline(y=-775*3000, linestyle = ':', label='Approximate Tropic of Capricorn', color = 'k', linewidth=0.8)
# plt.text(731600, 0, '\emph{Approximate Equator}')
plt.text(731600, 775*3000, '\emph{Approximate Tropic of Cancer}')
plt.text(731600, -775*3000, '\emph{Approximate Tropic of Capricorn}')

plt.xlabel('Date Measured (Year)')
plt.ylabel('Approximate Vegetation Position \n (Along the North-South Axis) (m)')
plt.legend(handles = [maxpos,maxposuer,line2], loc='lower right')



# fig3 = plt.figure()

# residuals = VegCov - VegCovMean5
# ax = plt.subplot(111)
# resi = ax.bar(Dates14, residuals, label = 'Residual', width = 10, color = 'r')

# line3 = plt.axvline(x=x04, linestyle = '-.', label='Year Markers', color = 'k', linewidth=0.8)
# plt.axvline(x=x05, linestyle = '-.', label='2006', color = 'k', linewidth=0.8)
# plt.axvline(x=x06, linestyle = '-.', label='2007', color = 'k', linewidth=0.8)
# plt.axvline(x=x07, linestyle = '-.', label='2008', color = 'k', linewidth=0.8)
# plt.axvline(x=x08, linestyle = '-.', label='2009', color = 'k', linewidth=0.8)
# plt.axvline(x=x09, linestyle = '-.', label='2010', color = 'k', linewidth=0.8)
# plt.axvline(x=x10, linestyle = '-.', label='2011', color = 'k', linewidth=0.8)
# plt.axvline(x=x11, linestyle = '-.', label='2012', color = 'k', linewidth=0.8)
# plt.axvline(x=x12, linestyle = '-.', label='2013', color = 'k', linewidth=0.8)
# plt.axvline(x=x13, linestyle = '-.', label='2014', color = 'k', linewidth=0.8)
# plt.axvline(x=x14, linestyle = '-.', label='2015', color = 'k', linewidth=0.8)
# plt.axvline(x=x15, linestyle = '-.', label='2016', color = 'k', linewidth=0.8)
# plt.axvline(x=x16, linestyle = '-.', label='2017', color = 'k', linewidth=0.8)
# plt.axvline(x=x17, linestyle = '-.', label='2018', color = 'k', linewidth=0.8)
# plt.axvline(x=x18, linestyle = '-.', label='2019', color = 'k', linewidth=0.8)
# plt.axvline(x=x19, linestyle = '-.', label='2020', color = 'k', linewidth=0.8)

# ax.xaxis_date()
# fig3.set_size_inches(25, 7)
# plt.xlabel('Date Measured (Year)')
# plt.ylabel('Vegetation Cover Residual Difference from a \n Moving Mean, with Periods of 5 (\%)')
# plt.legend(handles = [line3], loc='upper left')
# plt.ylim(-7, 7)


# fig4, ax1 = plt.subplots()

# x19i = np.int32(np.floor((x19-731600)/14))
# x18i = np.int32(np.ceil((x18-731600)/14))

# vecv, = ax1.plot_date(x=Dates14[(x18i-1):(x19i+1)], y=VegCovMean5[(x18i-1):(x19i+1)], label = 'Vegetation Cover',fmt= 'k-', linewidth=0.8)
# vecvuper, = ax1.plot_date(x=Dates14[(x18i-1):(x19i+1)], y=VegCovMean5[(x18i-1):(x19i+1)] + 2*VegCovErrMean5[(x18i-1):(x19i+1)]*VegCovMean5[(x18i-1):(x19i+1)], label = 'Vegetation Cover Uncertainty Boundaries (95\%)',fmt= 'k--', linewidth=0.8)
# vecvloer, = ax1.plot_date(x=Dates14[(x18i-1):(x19i+1)], y=VegCovMean5[(x18i-1):(x19i+1)] - 2*VegCovErrMean5[(x18i-1):(x19i+1)]*VegCovMean5[(x18i-1):(x19i+1)], label = 'Uncertainty',fmt= 'k--', linewidth=0.8)
# rave, = ax1.plot_date(x=Dates14[(x18i-1):(x19i+1)], y=VegCov[(x18i-1):(x19i+1)], label = 'Raw Data',fmt= 'k:', linewidth=0.8)


# ax2 = ax1.twinx()
# clcv, = ax2.plot_date(x=Dates[(x18-731600):(x19-731600)], y=CloCovMean7, label = 'Cloud Cover',fmt= 'r-', linewidth=0.8)
# clupercv, = ax2.plot_date(x=Dates[(x18-731600):(x19-731600)], y=CloCovMean7+0.026*CloCovMean7, label = 'Cloud Cover Uncertainty Boundaries (95\%)',fmt= 'r--', linewidth=0.8)
# clloercv, = ax2.plot_date(x=Dates[(x18-731600):(x19-731600)], y=CloCovMean7-0.026*CloCovMean7, label = 'Cloud Cover Uncertainty',fmt= 'r--', linewidth=0.8)
# rawcl, = ax2.plot_date(x=Dates[(x18-731600):(x19-731600)], y=CloCov, label = 'Raw Data',fmt= 'r:', linewidth=0.8)


# ax1.set_xlabel('Date Measured (YYYY-MM)')
# ax1.set_ylabel('Moving Mean, with Periods \n of 5, of Vegetation Coverage (\%)')
# ax1.tick_params(axis='y', rotation=0, labelcolor='black' )
# ax2.set_ylabel('Moving Mean, with Periods \n of 7, of Cloud Coverage (\%)', color = 'red')
# ax2.tick_params(axis='y', labelcolor='red')
# ax1.legend(handles = [vecvuper, rave, clupercv, rawcl],loc='upper left')
# ax1.set_ylim((20, 31))
# ax2.set_ylim((18, 85))

# fig4.set_size_inches(14, 7)


# fig5 = plt.figure()

# residualscl = CloCov - CloCovMean7
# ax = plt.subplot(111)
# resicl = ax.bar(Dates[(x18-731600):(x19-731600)], residualscl, label = 'Residual', width = 0.7, color = 'r')

# ax.xaxis_date()
# fig5.set_size_inches(14, 7)
# plt.xlabel('Date Measured (YYYY-MM)')
# plt.ylabel('Cloud Cover Residual Difference from a \n Moving Mean, with Periods of 7 (\%)')
# # plt.legend(handles = [line3], loc='upper left')
# plt.ylim(-7, 7)

# fig6 = plt.figure()


# ax = plt.subplot(111)
# resi = ax.bar(Dates14, 2*VegCovErr*VegCovMean5, label = 'Uncertainty in Vegetation Coverage (95\%)', width = 10, color = 'r')

# line3 = plt.axvline(x=x04, linestyle = '-.', label='Year Markers', color = 'k', linewidth=0.8)
# plt.axvline(x=x05, linestyle = '-.', label='2006', color = 'k', linewidth=0.8)
# plt.axvline(x=x06, linestyle = '-.', label='2007', color = 'k', linewidth=0.8)
# plt.axvline(x=x07, linestyle = '-.', label='2008', color = 'k', linewidth=0.8)
# plt.axvline(x=x08, linestyle = '-.', label='2009', color = 'k', linewidth=0.8)
# plt.axvline(x=x09, linestyle = '-.', label='2010', color = 'k', linewidth=0.8)
# plt.axvline(x=x10, linestyle = '-.', label='2011', color = 'k', linewidth=0.8)
# plt.axvline(x=x11, linestyle = '-.', label='2012', color = 'k', linewidth=0.8)
# plt.axvline(x=x12, linestyle = '-.', label='2013', color = 'k', linewidth=0.8)
# plt.axvline(x=x13, linestyle = '-.', label='2014', color = 'k', linewidth=0.8)
# plt.axvline(x=x14, linestyle = '-.', label='2015', color = 'k', linewidth=0.8)
# plt.axvline(x=x15, linestyle = '-.', label='2016', color = 'k', linewidth=0.8)
# plt.axvline(x=x16, linestyle = '-.', label='2017', color = 'k', linewidth=0.8)
# plt.axvline(x=x17, linestyle = '-.', label='2018', color = 'k', linewidth=0.8)
# plt.axvline(x=x18, linestyle = '-.', label='2019', color = 'k', linewidth=0.8)
# plt.axvline(x=x19, linestyle = '-.', label='2020', color = 'k', linewidth=0.8)

# ax.xaxis_date()
# fig6.set_size_inches(25, 7)
# plt.xlabel('Date Measured (Year)')
# plt.ylabel('Vegetation Cover Percentage \n Uncertainty Boundaries (95\%)')
# plt.legend(handles = [line3], loc='upper left')


# fig7 = plt.figure()


# ax = plt.subplot(111)
# resi = ax.bar(Dates14, 2*MaxPosError, label = 'Uncertainty in Vegetation Coverage (95\%)', width = 10, color = 'r')

# line3 = plt.axvline(x=x04, linestyle = '-.', label='Year Markers', color = 'k', linewidth=0.8)
# plt.axvline(x=x05, linestyle = '-.', label='2006', color = 'k', linewidth=0.8)
# plt.axvline(x=x06, linestyle = '-.', label='2007', color = 'k', linewidth=0.8)
# plt.axvline(x=x07, linestyle = '-.', label='2008', color = 'k', linewidth=0.8)
# plt.axvline(x=x08, linestyle = '-.', label='2009', color = 'k', linewidth=0.8)
# plt.axvline(x=x09, linestyle = '-.', label='2010', color = 'k', linewidth=0.8)
# plt.axvline(x=x10, linestyle = '-.', label='2011', color = 'k', linewidth=0.8)
# plt.axvline(x=x11, linestyle = '-.', label='2012', color = 'k', linewidth=0.8)
# plt.axvline(x=x12, linestyle = '-.', label='2013', color = 'k', linewidth=0.8)
# plt.axvline(x=x13, linestyle = '-.', label='2014', color = 'k', linewidth=0.8)
# plt.axvline(x=x14, linestyle = '-.', label='2015', color = 'k', linewidth=0.8)
# plt.axvline(x=x15, linestyle = '-.', label='2016', color = 'k', linewidth=0.8)
# plt.axvline(x=x16, linestyle = '-.', label='2017', color = 'k', linewidth=0.8)
# plt.axvline(x=x17, linestyle = '-.', label='2018', color = 'k', linewidth=0.8)
# plt.axvline(x=x18, linestyle = '-.', label='2019', color = 'k', linewidth=0.8)
# plt.axvline(x=x19, linestyle = '-.', label='2020', color = 'k', linewidth=0.8)

# ax.xaxis_date()
# ax.ticklabel_format(axis='y', style='sci', scilimits=(0,0))
# fig7.set_size_inches(25, 7)
# plt.xlabel('Date Measured (Year)')
# plt.ylabel('Maximum Vegetation Intensity \n Position Uncertainty (m) (95\% Boundaries)')
# plt.legend(handles = [line3], loc='upper left')









