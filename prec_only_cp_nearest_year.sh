cp ../prec_cru/prec_*nc .

cdo -b F64 -settaxis,1969-08-01,00:00,1day -selmon,8/12 prec_CRUNCEP_1968.nc \
    prec_CRUNCEP_1969_tmp.nc
cdo -b F64 -settaxis,1970-01-01,00:00,1day -selmon,1 prec_CRUNCEP_1969.nc \
    prec_CRUNCEP_1970_tmp.nc
cdo -b F64 -selmon,1/7 prec_CRUNCEP_1969.nc prec_CRUNCEP_1969_tmp1.nc
cdo -b F64 -selmon,2/12 prec_CRUNCEP_1970.nc prec_CRUNCEP_1970_tmp1.nc

cdo -b F64 -O mergetime prec_CRUNCEP_1969_tmp1.nc prec_CRUNCEP_1969_tmp.nc \
    prec_CRUNCEP_1969.nc
cdo -b F64 -O mergetime prec_CRUNCEP_1970_tmp1.nc prec_CRUNCEP_1970_tmp.nc \
    prec_CRUNCEP_1970.nc

cdo -b F64 -settaxis,1972-05-01,00:00,1day -selmon,5/12 prec_CRUNCEP_1968.nc \
    prec_CRUNCEP_1972_tmp.nc
cdo -b F64 -settaxis,1973-01-01,00:00,1day -selmon,1/3 prec_CRUNCEP_1969.nc \
    prec_CRUNCEP_1973_tmp.nc
cdo -b F64 -selmon,1/4 prec_CRUNCEP_1972.nc prec_CRUNCEP_1972_tmp1.nc
cdo -b F64 -selmon,4/12 prec_CRUNCEP_1973.nc prec_CRUNCEP_1973_tmp1.nc

cdo -b F64 -O mergetime prec_CRUNCEP_1972_tmp1.nc prec_CRUNCEP_1972_tmp.nc \
    prec_CRUNCEP_1972.nc
cdo -b F64 -O mergetime prec_CRUNCEP_1973_tmp1.nc prec_CRUNCEP_1973_tmp.nc \
    prec_CRUNCEP_1973.nc

cdo -b F64 -settaxis,1976-09-01,00:00,1day -selmon,9/12 prec_CRUNCEP_1977.nc \
    prec_CRUNCEP_1976_tmp.nc
cdo -b F64 -settaxis,1977-01-01,00:00,1day -selmon,1,2 prec_CRUNCEP_1978.nc \
    prec_CRUNCEP_1977_tmp.nc
cdo -b F64 -selmon,1/8 prec_CRUNCEP_1976.nc prec_CRUNCEP_1976_tmp1.nc
cdo -b F64 -selmon,3/12 prec_CRUNCEP_1977.nc prec_CRUNCEP_1977_tmp1.nc

cdo -b F64 -O mergetime prec_CRUNCEP_1976_tmp1.nc prec_CRUNCEP_1976_tmp.nc \
    prec_CRUNCEP_1976.nc
cdo -b F64 -O mergetime prec_CRUNCEP_1977_tmp1.nc prec_CRUNCEP_1977_tmp.nc \
    prec_CRUNCEP_1977.nc

cdo -b F64 -settaxis,1982-04-01,00:00,1day -selmon,4/12 prec_CRUNCEP_1977.nc \
    prec_CRUNCEP_1982_tmp.nc
cdo -b F64 -settaxis,1983-01-01,00:00,1day -selmon,1/6 prec_CRUNCEP_1978.nc \
    prec_CRUNCEP_1983_tmp.nc
cdo -b F64 -selmon,1/3 prec_CRUNCEP_1982.nc prec_CRUNCEP_1982_tmp1.nc
cdo -b F64 -selmon,7/12 prec_CRUNCEP_1983.nc prec_CRUNCEP_1983_tmp1.nc

cdo -b F64 -O mergetime prec_CRUNCEP_1982_tmp1.nc prec_CRUNCEP_1982_tmp.nc \
    prec_CRUNCEP_1982.nc
cdo -b F64 -O mergetime prec_CRUNCEP_1983_tmp1.nc prec_CRUNCEP_1983_tmp.nc \
    prec_CRUNCEP_1983.nc

cdo -b F64 -settaxis,1986-09-01,00:00,1day -selmon,9/12 prec_CRUNCEP_1994.nc \
    prec_CRUNCEP_1986_tmp.nc
cdo -b F64 -settaxis,1987-01-01,00:00,1day -selmon,1/4 prec_CRUNCEP_1995.nc \
    prec_CRUNCEP_1987_tmp.nc
cdo -b F64 -selmon,1/8 prec_CRUNCEP_1986.nc prec_CRUNCEP_1986_tmp1.nc
cdo -b F64 -selmon,5/12 prec_CRUNCEP_1987.nc prec_CRUNCEP_1987_tmp1.nc

cdo -b F64 -O mergetime prec_CRUNCEP_1986_tmp1.nc prec_CRUNCEP_1986_tmp.nc \
    prec_CRUNCEP_1986.nc
cdo -b F64 -O mergetime prec_CRUNCEP_1987_tmp1.nc prec_CRUNCEP_1987_tmp.nc \
    prec_CRUNCEP_1987.nc

cdo -b F64 -settaxis,1987-05-01,00:00,1day -selmon,5/12 prec_CRUNCEP_1994.nc \
    prec_CRUNCEP_1987_tmp.nc
cdo -b F64 -settaxis,1988-01-01,00:00,1day -selmon,1,2 prec_CRUNCEP_1995.nc \
    prec_CRUNCEP_1988_tmp.nc
cdo -b F64 -selmon,1/4 prec_CRUNCEP_1987.nc prec_CRUNCEP_1987_tmp1.nc
cdo -b F64 -selmon,3/12 prec_CRUNCEP_1988.nc prec_CRUNCEP_1988_tmp1.nc

cdo -b F64 -O mergetime prec_CRUNCEP_1987_tmp1.nc prec_CRUNCEP_1987_tmp.nc \
    prec_CRUNCEP_1987.nc
cdo -b F64 -O mergetime prec_CRUNCEP_1988_tmp1.nc prec_CRUNCEP_1988_tmp.nc \
    prec_CRUNCEP_1988.nc

cdo -b F64 -settaxis,1991-05-01,00:00,1day -selmon,5/12 prec_CRUNCEP_1994.nc \
    prec_CRUNCEP_1991_tmp.nc
cdo -b F64 -settaxis,1992-01-01,00:00,1day -selmon,1/6 prec_CRUNCEP_1995.nc \
    prec_CRUNCEP_1992_tmp.nc
cdo -b F64 -selmon,1/4 prec_CRUNCEP_1991.nc prec_CRUNCEP_1991_tmp1.nc
cdo -b F64 -selmon,7/12 prec_CRUNCEP_1992.nc prec_CRUNCEP_1992_tmp1.nc

cdo -b F64 -O mergetime prec_CRUNCEP_1991_tmp1.nc prec_CRUNCEP_1991_tmp.nc \
    prec_CRUNCEP_1991.nc
cdo -b F64 -O mergetime prec_CRUNCEP_1992_tmp1.nc prec_CRUNCEP_1992_tmp.nc \
    prec_CRUNCEP_1992.nc

cdo -b F64 -settaxis,1997-05-01,00:00,1day -selmon,5/12 prec_CRUNCEP_1994.nc \
    prec_CRUNCEP_1997_tmp.nc
cdo -b F64 -settaxis,1998-01-01,00:00,1day -selmon,1/5 prec_CRUNCEP_1995.nc \
    prec_CRUNCEP_1998_tmp.nc
cdo -b F64 -selmon,1/4 prec_CRUNCEP_1997.nc prec_CRUNCEP_1997_tmp1.nc
cdo -b F64 -selmon,6/12 prec_CRUNCEP_1998.nc prec_CRUNCEP_1998_tmp1.nc

cdo -b F64 -O mergetime prec_CRUNCEP_1997_tmp1.nc prec_CRUNCEP_1997_tmp.nc \
    prec_CRUNCEP_1997.nc
cdo -b F64 -O mergetime prec_CRUNCEP_1998_tmp1.nc prec_CRUNCEP_1998_tmp.nc \
    prec_CRUNCEP_1998.nc

cdo -b F64 -settaxis,2006-09-01,00:00,1day -selmon,9/12 prec_CRUNCEP_2004.nc \
    prec_CRUNCEP_2006_tmp.nc
cdo -b F64 -settaxis,2007-01-01,00:00,1day -selmon,1 prec_CRUNCEP_2005.nc \
    prec_CRUNCEP_2007_tmp.nc
cdo -b F64 -selmon,1/8 prec_CRUNCEP_2006.nc prec_CRUNCEP_2006_tmp1.nc
cdo -b F64 -selmon,2/12 prec_CRUNCEP_2007.nc prec_CRUNCEP_2007_tmp1.nc

cdo -b F64 -O mergetime prec_CRUNCEP_2006_tmp1.nc prec_CRUNCEP_2006_tmp.nc \
    prec_CRUNCEP_2006.nc
cdo -b F64 -O mergetime prec_CRUNCEP_2007_tmp1.nc prec_CRUNCEP_2007_tmp.nc \
    prec_CRUNCEP_2007.nc

rm *tmp*nc

cdo -b F64 mergetime prec_CRUNCEP_*nc prec_CRUNCEP_1901-2015_CP.nc

for year in `seq 1901 2015`; do
rm prec_CRUNCEP_$year'.'nc
done

qsub run.sh
