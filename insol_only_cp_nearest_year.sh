cp ../insol_cru/insol_*nc .

cdo -b F64 -settaxis,1969-08-01,00:00,1day -selmon,8/12 insol_CRUNCEP_1968.nc \
    insol_CRUNCEP_1969_tmp.nc
cdo -b F64 -settaxis,1970-01-01,00:00,1day -selmon,1 insol_CRUNCEP_1969.nc \
    insol_CRUNCEP_1970_tmp.nc
cdo -b F64 -selmon,1/7 insol_CRUNCEP_1969.nc insol_CRUNCEP_1969_tmp1.nc
cdo -b F64 -selmon,2/12 insol_CRUNCEP_1970.nc insol_CRUNCEP_1970_tmp1.nc

cdo -b F64 -O mergetime insol_CRUNCEP_1969_tmp1.nc insol_CRUNCEP_1969_tmp.nc \
    insol_CRUNCEP_1969.nc
cdo -b F64 -O mergetime insol_CRUNCEP_1970_tmp1.nc insol_CRUNCEP_1970_tmp.nc \
    insol_CRUNCEP_1970.nc

cdo -b F64 -settaxis,1972-05-01,00:00,1day -selmon,5/12 insol_CRUNCEP_1968.nc \
    insol_CRUNCEP_1972_tmp.nc
cdo -b F64 -settaxis,1973-01-01,00:00,1day -selmon,1/3 insol_CRUNCEP_1969.nc \
    insol_CRUNCEP_1973_tmp.nc
cdo -b F64 -selmon,1/4 insol_CRUNCEP_1972.nc insol_CRUNCEP_1972_tmp1.nc
cdo -b F64 -selmon,4/12 insol_CRUNCEP_1973.nc insol_CRUNCEP_1973_tmp1.nc

cdo -b F64 -O mergetime insol_CRUNCEP_1972_tmp1.nc insol_CRUNCEP_1972_tmp.nc \
    insol_CRUNCEP_1972.nc
cdo -b F64 -O mergetime insol_CRUNCEP_1973_tmp1.nc insol_CRUNCEP_1973_tmp.nc \
    insol_CRUNCEP_1973.nc

cdo -b F64 -settaxis,1976-09-01,00:00,1day -selmon,9/12 insol_CRUNCEP_1977.nc \
    insol_CRUNCEP_1976_tmp.nc
cdo -b F64 -settaxis,1977-01-01,00:00,1day -selmon,1,2 insol_CRUNCEP_1978.nc \
    insol_CRUNCEP_1977_tmp.nc
cdo -b F64 -selmon,1/8 insol_CRUNCEP_1976.nc insol_CRUNCEP_1976_tmp1.nc
cdo -b F64 -selmon,3/12 insol_CRUNCEP_1977.nc insol_CRUNCEP_1977_tmp1.nc

cdo -b F64 -O mergetime insol_CRUNCEP_1976_tmp1.nc insol_CRUNCEP_1976_tmp.nc \
    insol_CRUNCEP_1976.nc
cdo -b F64 -O mergetime insol_CRUNCEP_1977_tmp1.nc insol_CRUNCEP_1977_tmp.nc \
    insol_CRUNCEP_1977.nc

cdo -b F64 -settaxis,1982-04-01,00:00,1day -selmon,4/12 insol_CRUNCEP_1977.nc \
    insol_CRUNCEP_1982_tmp.nc
cdo -b F64 -settaxis,1983-01-01,00:00,1day -selmon,1/6 insol_CRUNCEP_1978.nc \
    insol_CRUNCEP_1983_tmp.nc
cdo -b F64 -selmon,1/3 insol_CRUNCEP_1982.nc insol_CRUNCEP_1982_tmp1.nc
cdo -b F64 -selmon,7/12 insol_CRUNCEP_1983.nc insol_CRUNCEP_1983_tmp1.nc

cdo -b F64 -O mergetime insol_CRUNCEP_1982_tmp1.nc insol_CRUNCEP_1982_tmp.nc \
    insol_CRUNCEP_1982.nc
cdo -b F64 -O mergetime insol_CRUNCEP_1983_tmp1.nc insol_CRUNCEP_1983_tmp.nc \
    insol_CRUNCEP_1983.nc

cdo -b F64 -settaxis,1986-09-01,00:00,1day -selmon,9/12 insol_CRUNCEP_1994.nc \
    insol_CRUNCEP_1986_tmp.nc
cdo -b F64 -settaxis,1987-01-01,00:00,1day -selmon,1/4 insol_CRUNCEP_1995.nc \
    insol_CRUNCEP_1987_tmp.nc
cdo -b F64 -selmon,1/8 insol_CRUNCEP_1986.nc insol_CRUNCEP_1986_tmp1.nc
cdo -b F64 -selmon,5/12 insol_CRUNCEP_1987.nc insol_CRUNCEP_1987_tmp1.nc

cdo -b F64 -O mergetime insol_CRUNCEP_1986_tmp1.nc insol_CRUNCEP_1986_tmp.nc \
    insol_CRUNCEP_1986.nc
cdo -b F64 -O mergetime insol_CRUNCEP_1987_tmp1.nc insol_CRUNCEP_1987_tmp.nc \
    insol_CRUNCEP_1987.nc

cdo -b F64 -settaxis,1987-05-01,00:00,1day -selmon,5/12 insol_CRUNCEP_1994.nc \
    insol_CRUNCEP_1987_tmp.nc
cdo -b F64 -settaxis,1988-01-01,00:00,1day -selmon,1,2 insol_CRUNCEP_1995.nc \
    insol_CRUNCEP_1988_tmp.nc
cdo -b F64 -selmon,1/4 insol_CRUNCEP_1987.nc insol_CRUNCEP_1987_tmp1.nc
cdo -b F64 -selmon,3/12 insol_CRUNCEP_1988.nc insol_CRUNCEP_1988_tmp1.nc

cdo -b F64 -O mergetime insol_CRUNCEP_1987_tmp1.nc insol_CRUNCEP_1987_tmp.nc \
    insol_CRUNCEP_1987.nc
cdo -b F64 -O mergetime insol_CRUNCEP_1988_tmp1.nc insol_CRUNCEP_1988_tmp.nc \
    insol_CRUNCEP_1988.nc

cdo -b F64 -settaxis,1991-05-01,00:00,1day -selmon,5/12 insol_CRUNCEP_1994.nc \
    insol_CRUNCEP_1991_tmp.nc
cdo -b F64 -settaxis,1992-01-01,00:00,1day -selmon,1/6 insol_CRUNCEP_1995.nc \
    insol_CRUNCEP_1992_tmp.nc
cdo -b F64 -selmon,1/4 insol_CRUNCEP_1991.nc insol_CRUNCEP_1991_tmp1.nc
cdo -b F64 -selmon,7/12 insol_CRUNCEP_1992.nc insol_CRUNCEP_1992_tmp1.nc

cdo -b F64 -O mergetime insol_CRUNCEP_1991_tmp1.nc insol_CRUNCEP_1991_tmp.nc \
    insol_CRUNCEP_1991.nc
cdo -b F64 -O mergetime insol_CRUNCEP_1992_tmp1.nc insol_CRUNCEP_1992_tmp.nc \
    insol_CRUNCEP_1992.nc
cdo -b F64 -selmon,1/4 insol_CRUNCEP_1991.nc insol_CRUNCEP_1991_tmp1.nc
cdo -b F64 -selmon,7/12 insol_CRUNCEP_1992.nc insol_CRUNCEP_1992_tmp1.nc

cdo -b F64 -O mergetime insol_CRUNCEP_1991_tmp1.nc insol_CRUNCEP_1991_tmp.nc \
    insol_CRUNCEP_1991.nc
cdo -b F64 -O mergetime insol_CRUNCEP_1992_tmp1.nc insol_CRUNCEP_1992_tmp.nc \ 
    insol_CRUNCEP_1992.nc

cdo -b F64 -settaxis,1997-05-01,00:00,1day -selmon,5/12 insol_CRUNCEP_1994.nc \
    insol_CRUNCEP_1997_tmp.nc
cdo -b F64 -settaxis,1998-01-01,00:00,1day -selmon,1/5 insol_CRUNCEP_1995.nc \
    insol_CRUNCEP_1998_tmp.nc
cdo -b F64 -selmon,1/4 insol_CRUNCEP_1997.nc insol_CRUNCEP_1997_tmp1.nc
cdo -b F64 -selmon,6/12 insol_CRUNCEP_1998.nc insol_CRUNCEP_1998_tmp1.nc

cdo -b F64 -O mergetime insol_CRUNCEP_1997_tmp1.nc insol_CRUNCEP_1997_tmp.nc \
    insol_CRUNCEP_1997.nc
cdo -b F64 -O mergetime insol_CRUNCEP_1998_tmp1.nc insol_CRUNCEP_1998_tmp.nc \
    insol_CRUNCEP_1998.nc

cdo -b F64 -settaxis,2006-09-01,00:00,1day -selmon,9/12 insol_CRUNCEP_2004.nc \
    insol_CRUNCEP_2006_tmp.nc
cdo -b F64 -settaxis,2007-01-01,00:00,1day -selmon,1 insol_CRUNCEP_2005.nc \
    insol_CRUNCEP_2007_tmp.nc
cdo -b F64 -selmon,1/8 insol_CRUNCEP_2006.nc insol_CRUNCEP_2006_tmp1.nc
cdo -b F64 -selmon,2/12 insol_CRUNCEP_2007.nc insol_CRUNCEP_2007_tmp1.nc

cdo -b F64 -O mergetime insol_CRUNCEP_2006_tmp1.nc insol_CRUNCEP_2006_tmp.nc \
    insol_CRUNCEP_2006.nc
cdo -b F64 -O mergetime insol_CRUNCEP_2007_tmp1.nc insol_CRUNCEP_2007_tmp.nc \
    insol_CRUNCEP_2007.nc

rm *tmp*nc
cdo -b F64 mergetime insol_CRUNCEP_*nc insol_CRUNCEP_1901-2015_CP.nc

for year in `seq 1901 2015`; do
rm insol_CRUNCEP_$year'.'nc
done

qsub arrange.sh
