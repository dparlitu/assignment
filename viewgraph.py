#!/usr/bin/python3

# this script will generate a scatter plot and draw a simple linear regression using data from a csv file

import numpy as np
import matplotlib.pyplot as plt
import csv

# open csv file and use data from row0 and row2 to convert to float
with open("./downloads/graphdata.csv", "r") as f:
    data = [row for row in csv.reader(f)]
    xd = [float(row[0]) for row in data]
    yd = [float(row[2]) for row in data]

# make the scatter plot
plt.scatter(xd, yd, s=30, alpha=0.15, marker='o')

# determine best fit line
par = np.polyfit(xd, yd, 1, full=True)

slope=par[0][0]
intercept=par[0][1]
xl = [min(xd), max(xd)]
yl = [slope*xx + intercept for xx in xl]

# coefficient of determination, plot text
variance = np.var(yd)
residuals = np.var([(slope*xx + intercept - yy)  for xx,yy in zip(xd,yd)])
Rsqr = np.round(1-residuals/variance, decimals=2)
plt.text(.9*max(xd)+.1*min(xd),.9*max(yd)+.1*min(yd),'$R^2 = %0.2f$'% Rsqr, fontsize=20)

plt.xlabel("DAYS OF PAST MONTH")
plt.ylabel("NEW DISCOVERED MALWARE WEBSITES")

# error bounds, not necessary but nice to have
yerr = [abs(slope*xx + intercept - yy)  for xx,yy in zip(xd,yd)]
par = np.polyfit(xd, yerr, 2, full=True)

yerrUpper = [(xx*slope+intercept)+(par[0][0]*xx**2 + par[0][1]*xx + par[0][2]) for xx,yy in zip(xd,yd)]
yerrLower = [(xx*slope+intercept)-(par[0][0]*xx**2 + par[0][1]*xx + par[0][2]) for xx,yy in zip(xd,yd)]

plt.title("Best Fit Straight Line Trajectory of Data")
plt.plot(xl, yl, '-r')
plt.plot(xd, yerrLower, '--r')
plt.plot(xd, yerrUpper, '--r')
plt.show()

