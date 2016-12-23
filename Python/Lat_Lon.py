import csv
from math import floor
file_in = open('woa13_A5B2_t00mn01v2.csv', 'r')
reader = csv.reader(file_in,delimiter=',')
#to skip the two header lines
next(reader, None)
next(reader, None)
#to print the Latiutute and Longitude Data
for row in reader:
        print floor(row[0]) + "," + floor(row[1])
