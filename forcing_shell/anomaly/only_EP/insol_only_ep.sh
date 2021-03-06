for year in `seq 1901 2015`; do
cp ../insol_cru/insol_CRUNCEP_$year'.'nc .
done

cdo -b F64 -ydaymean -mergetime insol_CRUNCEP_1951.nc \
insol_CRUNCEP_1952.nc insol_CRUNCEP_1953.nc insol_CRUNCEP_1954.nc \
insol_CRUNCEP_1955.nc insol_CRUNCEP_1956.nc insol_CRUNCEP_1957.nc \
insol_CRUNCEP_1958.nc insol_CRUNCEP_1959.nc insol_CRUNCEP_196*.nc \
insol_CRUNCEP_197*.nc insol_CRUNCEP_1980.nc insol_CRUNCEP_1951-1980.nc

cdo -b F64 -ydaymean -mergetime insol_CRUNCEP_1956.nc \
insol_CRUNCEP_1957.nc insol_CRUNCEP_1958.nc insol_CRUNCEP_1959.nc \
insol_CRUNCEP_196*.nc insol_CRUNCEP_197*.nc insol_CRUNCEP_1980.nc \
insol_CRUNCEP_1981.nc insol_CRUNCEP_1982.nc insol_CRUNCEP_1983.nc \
insol_CRUNCEP_1984.nc insol_CRUNCEP_1985.nc insol_CRUNCEP_1956-1985.nc

cdo -b F64 -ydaymean -mergetime insol_CRUNCEP_1961.nc insol_CRUNCEP_1962.nc \
insol_CRUNCEP_1963.nc insol_CRUNCEP_1964.nc insol_CRUNCEP_1965.nc \
insol_CRUNCEP_1966.nc insol_CRUNCEP_1967.nc insol_CRUNCEP_1968.nc \
insol_CRUNCEP_1969.nc insol_CRUNCEP_197*.nc insol_CRUNCEP_198*.nc \
insol_CRUNCEP_1990.nc insol_CRUNCEP_1961-1990.nc

cdo -b F64 -ydaymean -mergetime insol_CRUNCEP_1966.nc insol_CRUNCEP_1967.nc \
insol_CRUNCEP_1968.nc insol_CRUNCEP_1969.nc insol_CRUNCEP_197*.nc \
insol_CRUNCEP_198*.nc insol_CRUNCEP_1990.nc insol_CRUNCEP_1991.nc \
insol_CRUNCEP_1992.nc insol_CRUNCEP_1993.nc insol_CRUNCEP_1994.nc \
insol_CRUNCEP_1995.nc insol_CRUNCEP_1966-1995.nc

cdo -b F64 -ydaymean -mergetime insol_CRUNCEP_1971.nc insol_CRUNCEP_1972.nc \
insol_CRUNCEP_1973.nc insol_CRUNCEP_1974.nc insol_CRUNCEP_1975.nc \
insol_CRUNCEP_1976.nc insol_CRUNCEP_1977.nc insol_CRUNCEP_1978.nc \
insol_CRUNCEP_1979.nc insol_CRUNCEP_198*.nc insol_CRUNCEP_199*.nc \
insol_CRUNCEP_2000.nc insol_CRUNCEP_1971-2000.nc

cdo -b F64 -ydaymean -mergetime insol_CRUNCEP_1976.nc insol_CRUNCEP_1977.nc \
insol_CRUNCEP_1978.nc insol_CRUNCEP_1979.nc insol_CRUNCEP_198*.nc \
insol_CRUNCEP_199*.nc insol_CRUNCEP_2000.nc insol_CRUNCEP_2001.nc \
insol_CRUNCEP_2002.nc insol_CRUNCEP_2003.nc insol_CRUNCEP_2004.nc \
insol_CRUNCEP_2005.nc insol_CRUNCEP_1976-2005.nc

cdo -b F64 -ydaymean -mergetime insol_CRUNCEP_1981.nc insol_CRUNCEP_1982.nc \
insol_CRUNCEP_1983.nc insol_CRUNCEP_1984.nc insol_CRUNCEP_1985.nc \
insol_CRUNCEP_1986.nc insol_CRUNCEP_1987.nc insol_CRUNCEP_1988.nc \
insol_CRUNCEP_1989.nc insol_CRUNCEP_199*.nc insol_CRUNCEP_200*.nc \
insol_CRUNCEP_2010.nc insol_CRUNCEP_1981-2010.nc

cdo -b F64 -ydaymean -mergetime insol_CRUNCEP_1986.nc insol_CRUNCEP_1987.nc \
insol_CRUNCEP_1988.nc insol_CRUNCEP_1989.nc insol_CRUNCEP_199*.nc \
insol_CRUNCEP_200*.nc insol_CRUNCEP_2010.nc insol_CRUNCEP_2011.nc \
insol_CRUNCEP_2012.nc insol_CRUNCEP_2013.nc insol_CRUNCEP_2014.nc \
insol_CRUNCEP_2015.nc insol_CRUNCEP_1986-2015.nc

for year in `seq 1966 1970`; do
cdo -b F64 sub insol_CRUNCEP_$year'.'nc insol_CRUNCEP_1951-1980.nc \
               anomaly/insol_CRUNCEP_$year'_'anomaly.nc
done
for year in `seq 1971 1975`; do
cdo -b F64 sub insol_CRUNCEP_$year'.'nc insol_CRUNCEP_1956-1985.nc \
               anomaly/insol_CRUNCEP_$year'_'anomaly.nc
done
for year in `seq 1976 1980`; do
cdo -b F64 sub insol_CRUNCEP_$year'.'nc insol_CRUNCEP_1961-1990.nc \
               anomaly/insol_CRUNCEP_$year'_'anomaly.nc
done
for year in `seq 1981 1985`; do
cdo -b F64 sub insol_CRUNCEP_$year'.'nc insol_CRUNCEP_1966-1995.nc \
               anomaly/insol_CRUNCEP_$year'_'anomaly.nc
done
for year in `seq 1986 1990`; do
cdo -b F64 sub insol_CRUNCEP_$year'.'nc insol_CRUNCEP_1971-2000.nc \
               anomaly/insol_CRUNCEP_$year'_'anomaly.nc
done
for year in `seq 1991 1995`; do
cdo -b F64 sub insol_CRUNCEP_$year'.'nc insol_CRUNCEP_1976-2005.nc \
               anomaly/insol_CRUNCEP_$year'_'anomaly.nc
done
for year in `seq 1996 2000`; do
cdo -b F64 sub insol_CRUNCEP_$year'.'nc insol_CRUNCEP_1981-2010.nc \
               anomaly/insol_CRUNCEP_$year'_'anomaly.nc
done
for year in `seq 2001 2005`; do
cdo -b F64 sub insol_CRUNCEP_$year'.'nc insol_CRUNCEP_1986-2015.nc \
               anomaly/insol_CRUNCEP_$year'_'anomaly.nc
done
for year in `seq 2006 2010`; do
cdo -b F64 sub insol_CRUNCEP_$year'.'nc insol_CRUNCEP_1986-2015.nc \
               anomaly/insol_CRUNCEP_$year'_'anomaly.nc
done

cdo -b F64 -settaxis,1968-10-01,12:00,1day -selmon,10/12 \
anomaly/insol_CRUNCEP_1976_anomaly.nc anomaly/insol_CRUNCEP_1968_tmp.nc
cdo -b F64 -settaxis,1969-01-01,12:00,1day -selmon,1/5 \
anomaly/insol_CRUNCEP_1977_anomaly.nc anomaly/insol_CRUNCEP_1969_tmp.nc
cdo -b F64 -selmon,1/9 -settaxis,1968-01-01,12:00,1day -setcalendar,365_day \
anomaly/insol_CRUNCEP_1968_anomaly.nc anomaly/insol_CRUNCEP_1968_tmp1.nc
cdo -b F64 -selmon,6/12 -settaxis,1969-01-01,12:00,1day -setcalendar,365_day \
anomaly/insol_CRUNCEP_1969_anomaly.nc anomaly/insol_CRUNCEP_1969_tmp1.nc

cdo -b F64 -O mergetime anomaly/insol_CRUNCEP_1968_tmp1.nc \
                        anomaly/insol_CRUNCEP_1968_tmp.nc \
                        anomaly/insol_CRUNCEP_1968_anomaly.nc
cdo -b F64 -O mergetime anomaly/insol_CRUNCEP_1969_tmp1.nc \
                        anomaly/insol_CRUNCEP_1969_tmp.nc \
                        anomaly/insol_CRUNCEP_1969_anomaly.nc

cdo -b F64 -settaxis,1977-09-01,12:00,1day -selmon,9/12 \
anomaly/insol_CRUNCEP_1976_anomaly.nc anomaly/insol_CRUNCEP_1977_tmp.nc
cdo -b F64 -settaxis,1978-01-01,12:00,1day -selmon,1 \
anomaly/insol_CRUNCEP_1977_anomaly.nc anomaly/insol_CRUNCEP_1978_tmp.nc
cdo -b F64 -selmon,1/8 -settaxis,1977-01-01,12:00,1day -setcalendar,365_day \
anomaly/insol_CRUNCEP_1977_anomaly.nc anomaly/insol_CRUNCEP_1977_tmp1.nc
cdo -b F64 -selmon,2/12 -settaxis,1978-01-01,12:00,1day -setcalendar,365_day \
anomaly/insol_CRUNCEP_1978_anomaly.nc anomaly/insol_CRUNCEP_1978_tmp1.nc

cdo -b F64 -O mergetime anomaly/insol_CRUNCEP_1977_tmp1.nc \
                        anomaly/insol_CRUNCEP_1977_tmp.nc \
                        anomaly/insol_CRUNCEP_1977_anomaly.nc
cdo -b F64 -O mergetime anomaly/insol_CRUNCEP_1978_tmp1.nc \
                        anomaly/insol_CRUNCEP_1978_tmp.nc \
                        anomaly/insol_CRUNCEP_1978_anomaly.nc

cdo -b F64 -settaxis,1987-05-01,12:00,1day -selmon,5/12 \
anomaly/insol_CRUNCEP_1982_anomaly.nc anomaly/insol_CRUNCEP_1987_tmp.nc
cdo -b F64 -settaxis,1988-01-01,12:00,1day -selmon,1,2 \
anomaly/insol_CRUNCEP_1983_anomaly.nc anomaly/insol_CRUNCEP_1988_tmp.nc
cdo -b F64 -selmon,1/4 -settaxis,1987-01-01,12:00,1day -setcalendar,365_day \
anomaly/insol_CRUNCEP_1987_anomaly.nc anomaly/insol_CRUNCEP_1987_tmp1.nc
cdo -b F64 -selmon,3/12 -settaxis,1988-01-01,12:00,1day -setcalendar,365_day \
anomaly/insol_CRUNCEP_1988_anomaly.nc anomaly/insol_CRUNCEP_1988_tmp1.nc

cdo -b F64 -O mergetime anomaly/insol_CRUNCEP_1987_tmp1.nc \
                        anomaly/insol_CRUNCEP_1987_tmp.nc \
                        anomaly/insol_CRUNCEP_1987_anomaly.nc
cdo -b F64 -O mergetime anomaly/insol_CRUNCEP_1988_tmp1.nc \
                        anomaly/insol_CRUNCEP_1988_tmp.nc \
                        anomaly/insol_CRUNCEP_1988_anomaly.nc

cdo -b F64 -settaxis,1991-05-01,12:00,1day -selmon,5/12 \
anomaly/insol_CRUNCEP_1997_anomaly.nc anomaly/insol_CRUNCEP_1991_tmp.nc
cdo -b F64 -settaxis,1992-01-01,12:00,1day -selmon,1/6 \
anomaly/insol_CRUNCEP_1998_anomaly.nc anomaly/insol_CRUNCEP_1992_tmp.nc
cdo -b F64 -selmon,1/4 -settaxis,1991-01-01,12:00,1day -setcalendar,365_day \
anomaly/insol_CRUNCEP_1991_anomaly.nc anomaly/insol_CRUNCEP_1991_tmp1.nc
cdo -b F64 -selmon,7/12 -settaxis,1992-01-01,12:00,1day -setcalendar,365_day \
anomaly/insol_CRUNCEP_1992_anomaly.nc anomaly/insol_CRUNCEP_1992_tmp1.nc

cdo -b F64 -O mergetime anomaly/insol_CRUNCEP_1991_tmp1.nc \
                        anomaly/insol_CRUNCEP_1991_tmp.nc \
                        anomaly/insol_CRUNCEP_1991_anomaly.nc
cdo -b F64 -O mergetime anomaly/insol_CRUNCEP_1992_tmp1.nc \
                        anomaly/insol_CRUNCEP_1992_tmp.nc \
                        anomaly/insol_CRUNCEP_1992_anomaly.nc

cdo -b F64 -settaxis,1994-09-01,12:00,1day -selmon,9/12 \
anomaly/insol_CRUNCEP_1976_anomaly.nc anomaly/insol_CRUNCEP_1994_tmp.nc
cdo -b F64 -settaxis,1995-01-01,12:00,1day -selmon,1/3 \
anomaly/insol_CRUNCEP_1977_anomaly.nc anomaly/insol_CRUNCEP_1995_tmp.nc
cdo -b F64 -selmon,1/8 -settaxis,1994-01-01,12:00,1day -setcalendar,365_day \
anomaly/insol_CRUNCEP_1994_anomaly.nc anomaly/insol_CRUNCEP_1994_tmp1.nc
cdo -b F64 -selmon,4/12 -settaxis,1995-01-01,12:00,1day -setcalendar,365_day \
anomaly/insol_CRUNCEP_1995_anomaly.nc anomaly/insol_CRUNCEP_1995_tmp1.nc

cdo -b F64 -O mergetime anomaly/insol_CRUNCEP_1994_tmp1.nc \
                        anomaly/insol_CRUNCEP_1994_tmp.nc \
                        anomaly/insol_CRUNCEP_1994_anomaly.nc
cdo -b F64 -O mergetime anomaly/insol_CRUNCEP_1995_tmp1.nc \
                        anomaly/insol_CRUNCEP_1995_tmp.nc \
                        anomaly/insol_CRUNCEP_1995_anomaly.nc

cdo -b F64 -settaxis,2002-06-01,12:00,1day -selmon,6/12 \
anomaly/insol_CRUNCEP_2006_anomaly.nc anomaly/insol_CRUNCEP_2002_tmp.nc
cdo -b F64 -settaxis,2003-01-01,12:00,1day -selmon,1,2 \
anomaly/insol_CRUNCEP_2007_anomaly.nc anomaly/insol_CRUNCEP_2003_tmp.nc
cdo -b F64 -selmon,1/5 -settaxis,2002-01-01,12:00,1day -setcalendar,365_day \
anomaly/insol_CRUNCEP_2002_anomaly.nc anomaly/insol_CRUNCEP_2002_tmp1.nc
cdo -b F64 -selmon,3/12 -settaxis,2003-01-01,12:00,1day -setcalendar,365_day \
anomaly/insol_CRUNCEP_2003_anomaly.nc anomaly/insol_CRUNCEP_2003_tmp1.nc

cdo -b F64 -O mergetime anomaly/insol_CRUNCEP_2002_tmp1.nc \
                        anomaly/insol_CRUNCEP_2002_tmp.nc \
                        anomaly/insol_CRUNCEP_2002_anomaly.nc
cdo -b F64 -O mergetime anomaly/insol_CRUNCEP_2003_tmp1.nc \
                        anomaly/insol_CRUNCEP_2003_tmp.nc \
                        anomaly/insol_CRUNCEP_2003_anomaly.nc

cdo -b F64 -settaxis,2004-07-01,12:00,1day -selmon,7/12 \
anomaly/insol_CRUNCEP_1976_anomaly.nc anomaly/insol_CRUNCEP_2004_tmp.nc
cdo -b F64 -settaxis,2005-01-01,12:00,1day -selmon,1,2 \
anomaly/insol_CRUNCEP_1976_anomaly.nc anomaly/insol_CRUNCEP_2005_tmp.nc
cdo -b F64 -selmon,1/6 -settaxis,2004-01-01,12:00,1day -setcalendar,365_day \
anomaly/insol_CRUNCEP_2004_anomaly.nc anomaly/insol_CRUNCEP_2004_tmp1.nc
cdo -b F64 -selmon,3/12 -settaxis,2005-01-01,12:00,1day -setcalendar,365_day \
anomaly/insol_CRUNCEP_2005_anomaly.nc anomaly/insol_CRUNCEP_2005_tmp1.nc

cdo -b F64 -O mergetime anomaly/insol_CRUNCEP_2004_tmp1.nc \
                        anomaly/insol_CRUNCEP_2004_tmp.nc \
                        anomaly/insol_CRUNCEP_2004_anomaly.nc
cdo -b F64 -O mergetime anomaly/insol_CRUNCEP_2005_tmp1.nc \
                        anomaly/insol_CRUNCEP_2005_tmp.nc \
                        anomaly/insol_CRUNCEP_2005_anomaly.nc

cdo -b F64 -settaxis,2009-07-01,12:00,1day -selmon,7/12 \
anomaly/insol_CRUNCEP_1972_anomaly.nc anomaly/insol_CRUNCEP_2009_tmp.nc
cdo -b F64 -settaxis,2010-01-01,12:00,1day -selmon,1/3 \
anomaly/insol_CRUNCEP_1973_anomaly.nc anomaly/insol_CRUNCEP_2010_tmp.nc
cdo -b F64 -selmon,1/6 -settaxis,2009-01-01,12:00,1day \
-setcalendar,365_day anomaly/insol_CRUNCEP_2009_anomaly.nc anomaly/insol_CRUNCEP_2009_tmp1.nc
cdo -b F64 -selmon,4/12 -settaxis,2010-01-01,12:00,1day \
-setcalendar,365_day anomaly/insol_CRUNCEP_2010_anomaly.nc anomaly/insol_CRUNCEP_2010_tmp1.nc

cdo -b F64 -O mergetime anomaly/insol_CRUNCEP_2009_tmp1.nc \
                        anomaly/insol_CRUNCEP_2009_tmp.nc \
                        anomaly/insol_CRUNCEP_2009_anomaly.nc
cdo -b F64 -O mergetime anomaly/insol_CRUNCEP_2010_tmp1.nc \
                        anomaly/insol_CRUNCEP_2010_tmp.nc \
                        anomaly/insol_CRUNCEP_2010_anomaly.nc

for year in `seq 1966 1970`; do
cdo -b F64 add anomaly/insol_CRUNCEP_$year'_'anomaly.nc \
                       insol_CRUNCEP_1951-1980.nc \
                       insol_CRUNCEP_$year'.'nc
done
for year in `seq 1971 1975`; do
cdo -b F64 add anomaly/insol_CRUNCEP_$year'_'anomaly.nc \
                       insol_CRUNCEP_1956-1985.nc \
                       insol_CRUNCEP_$year'.'nc
done
for year in `seq 1976 1980`; do
cdo -b F64 add anomaly/insol_CRUNCEP_$year'_'anomaly.nc \
                       insol_CRUNCEP_1961-1990.nc \
                       insol_CRUNCEP_$year'.'nc
done
for year in `seq 1981 1985`; do
cdo -b F64 add anomaly/insol_CRUNCEP_$year'_'anomaly.nc \
                       insol_CRUNCEP_1966-1995.nc \
                       insol_CRUNCEP_$year'.'nc
done
for year in `seq 1986 1990`; do
cdo -b F64 add anomaly/insol_CRUNCEP_$year'_'anomaly.nc \
                       insol_CRUNCEP_1971-2000.nc \
                       insol_CRUNCEP_$year'.'nc
done
for year in `seq 1991 1995`; do
cdo -b F64 add anomaly/insol_CRUNCEP_$year'_'anomaly.nc \
                       insol_CRUNCEP_1976-2005.nc \
                       insol_CRUNCEP_$year'.'nc
done
for year in `seq 1996 2000`; do
cdo -b F64 add anomaly/insol_CRUNCEP_$year'_'anomaly.nc \
                       insol_CRUNCEP_1981-2010.nc \
                       insol_CRUNCEP_$year'.'nc
done
for year in `seq 2001 2005`; do
cdo -b F64 add anomaly/insol_CRUNCEP_$year'_'anomaly.nc \
                       insol_CRUNCEP_1986-2015.nc \
                       insol_CRUNCEP_$year'.'nc
done
for year in `seq 2006 2010`; do
cdo -b F64 add anomaly/insol_CRUNCEP_$year'_'anomaly.nc \
                       insol_CRUNCEP_1986-2015.nc \
                       insol_CRUNCEP_$year'.'nc
done

rm insol_CRUNCEP_1951-1980.nc
rm insol_CRUNCEP_1956-1985.nc
rm insol_CRUNCEP_1961-1990.nc
rm insol_CRUNCEP_1966-1995.nc
rm insol_CRUNCEP_1971-2000.nc
rm insol_CRUNCEP_1976-2005.nc
rm insol_CRUNCEP_1981-2010.nc
rm insol_CRUNCEP_1986-2015.nc

cdo -b F64 mergetime insol*nc insol_CRUNCEP_1901-2015_EP1_anomaly.nc

qsub run_arrange.sh
