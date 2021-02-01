#!/bin/bash

pathway=''
for year in `seq 1901 2015`; do
rm temp_CRUNCEP_$year'.'nc
done

ncap2 -O -s "time=float(time)" temp_CRUNCEP_1901-2015_CP1_anomaly.nc \
      temp_test.nc 
ncpdq -F -O -a lat,lon,time temp_test.nc \
      $pathway'/'temp_1901-2015_CRUNCEP_CP1_anomaly.nc
