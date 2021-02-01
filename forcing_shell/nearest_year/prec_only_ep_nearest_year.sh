cp ../prec_cru/prec_*nc .

cdo -b F64 -settaxis,1968-10-01,12:00,1day -selmon,10/12 prec_CRUNCEP_1969.nc \
    prec_CRUNCEP_1968_tmp.nc
cdo -b F64 -settaxis,1969-01-01,12:00,1day -selmon,1/5 prec_CRUNCEP_1970.nc \
    prec_CRUNCEP_1969_tmp.nc
cdo -b F64 selmon,1/9 prec_CRUNCEP_1968.nc prec_CRUNCEP_1968_tmp1.nc
cdo -b F64 selmon,6/12 prec_CRUNCEP_1969.nc prec_CRUNCEP_1969_tmp1.nc

cdo -b F64 -O mergetime prec_CRUNCEP_1968_tmp1.nc prec_CRUNCEP_1968_tmp.nc \
    prec_CRUNCEP_1968.nc
cdo -b F64 -O mergetime prec_CRUNCEP_1969_tmp1.nc prec_CRUNCEP_1969_tmp.nc \
    prec_CRUNCEP_1969.nc

cdo -b F64 -settaxis,1977-09-01,12:00,1day -selmon,9/12 prec_CRUNCEP_1976.nc \
    prec_CRUNCEP_1977_tmp.nc
cdo -b F64 -settaxis,1978-01-01,12:00,1day -selmon,1 prec_CRUNCEP_1977.nc \
    prec_CRUNCEP_1978_tmp.nc
cdo -b F64 selmon,1/8 prec_CRUNCEP_1977.nc prec_CRUNCEP_1977_tmp1.nc
cdo -b F64 selmon,2/12 prec_CRUNCEP_1978.nc prec_CRUNCEP_1978_tmp1.nc

cdo -b F64 -O mergetime prec_CRUNCEP_1977_tmp1.nc prec_CRUNCEP_1977_tmp.nc \
    prec_CRUNCEP_1977.nc
cdo -b F64 -O mergetime prec_CRUNCEP_1978_tmp1.nc prec_CRUNCEP_1978_tmp.nc \
    prec_CRUNCEP_1978.nc

cdo -b F64 -settaxis,1987-05-01,12:00,1day -selmon,5/12 prec_CRUNCEP_1986.nc \
    prec_CRUNCEP_1987_tmp.nc
cdo -b F64 -settaxis,1988-01-01,12:00,1day -selmon,1,2 prec_CRUNCEP_1987.nc \
    prec_CRUNCEP_1988_tmp.nc
cdo -b F64 selmon,1/4 prec_CRUNCEP_1987.nc prec_CRUNCEP_1987_tmp1.nc
cdo -b F64 selmon,3/12 prec_CRUNCEP_1988.nc prec_CRUNCEP_1988_tmp1.nc

cdo -b F64 -O mergetime prec_CRUNCEP_1987_tmp1.nc prec_CRUNCEP_1987_tmp.nc \
    prec_CRUNCEP_1987.nc
cdo -b F64 -O mergetime prec_CRUNCEP_1988_tmp1.nc prec_CRUNCEP_1988_tmp.nc \
    prec_CRUNCEP_1988.nc

cdo -b F64 -settaxis,1991-05-01,12:00,1day -selmon,5/12 prec_CRUNCEP_1986.nc \
    prec_CRUNCEP_1991_tmp.nc
cdo -b F64 -settaxis,1992-01-01,12:00,1day -selmon,1/6 prec_CRUNCEP_1987.nc \
    prec_CRUNCEP_1992_tmp.nc
cdo -b F64 selmon,1/4 prec_CRUNCEP_1991.nc prec_CRUNCEP_1991_tmp1.nc
cdo -b F64 selmon,7/12 prec_CRUNCEP_1992.nc prec_CRUNCEP_1992_tmp1.nc

cdo -b F64 -O mergetime prec_CRUNCEP_1991_tmp1.nc prec_CRUNCEP_1991_tmp.nc \
    prec_CRUNCEP_1991.nc
cdo -b F64 -O mergetime prec_CRUNCEP_1992_tmp1.nc prec_CRUNCEP_1992_tmp.nc 
    prec_CRUNCEP_1992.nc

cdo -b F64 -settaxis,1994-09-01,12:00,1day -selmon,9/12 prec_CRUNCEP_1997.nc \
    prec_CRUNCEP_1994_tmp.nc
cdo -b F64 -settaxis,1995-01-01,12:00,1day -selmon,1/3 prec_CRUNCEP_1998.nc \
    prec_CRUNCEP_1995_tmp.nc
cdo -b F64 selmon,1/8 prec_CRUNCEP_1994.nc prec_CRUNCEP_1994_tmp1.nc
cdo -b F64 selmon,4/12 prec_CRUNCEP_1995.nc prec_CRUNCEP_1995_tmp1.nc

cdo -b F64 -O mergetime prec_CRUNCEP_1994_tmp1.nc prec_CRUNCEP_1994_tmp.nc \
    prec_CRUNCEP_1994.nc
cdo -b F64 -O mergetime prec_CRUNCEP_1995_tmp1.nc prec_CRUNCEP_1995_tmp.nc \
    prec_CRUNCEP_1995.nc

cdo -b F64 -settaxis,2002-06-01,12:00,1day -selmon,6/12 prec_CRUNCEP_2006.nc \
    prec_CRUNCEP_2002_tmp.nc
cdo -b F64 -settaxis,2003-01-01,12:00,1day -selmon,1,2 prec_CRUNCEP_2007.nc \
    prec_CRUNCEP_2003_tmp.nc
cdo -b F64 selmon,1/5 prec_CRUNCEP_2002.nc prec_CRUNCEP_2002_tmp1.nc
cdo -b F64 selmon,3/12 prec_CRUNCEP_2003.nc prec_CRUNCEP_2003_tmp1.nc

cdo -b F64 -O mergetime prec_CRUNCEP_2002_tmp1.nc prec_CRUNCEP_2002_tmp.nc \
    prec_CRUNCEP_2002.nc
cdo -b F64 -O mergetime prec_CRUNCEP_2003_tmp1.nc prec_CRUNCEP_2003_tmp.nc \
    prec_CRUNCEP_2003.nc

cdo -b F64 -settaxis,2004-07-01,12:00,1day -selmon,7/12 prec_CRUNCEP_2006.nc \
    prec_CRUNCEP_2004_tmp.nc
cdo -b F64 -settaxis,2005-01-01,12:00,1day -selmon,1,2 prec_CRUNCEP_2007.nc \
    prec_CRUNCEP_2005_tmp.nc
cdo -b F64 selmon,1/6 prec_CRUNCEP_2004.nc prec_CRUNCEP_2004_tmp1.nc
cdo -b F64 selmon,3/12 prec_CRUNCEP_2005.nc prec_CRUNCEP_2005_tmp1.nc

cdo -b F64 -O mergetime prec_CRUNCEP_2004_tmp1.nc prec_CRUNCEP_2004_tmp.nc \
    prec_CRUNCEP_2004.nc
cdo -b F64 -O mergetime prec_CRUNCEP_2005_tmp1.nc prec_CRUNCEP_2005_tmp.nc \
    prec_CRUNCEP_2005.nc

cdo -b F64 -settaxis,2009-07-01,12:00,1day -selmon,7/12 prec_CRUNCEP_2006.nc \
    prec_CRUNCEP_2009_tmp.nc
cdo -b F64 -settaxis,2010-01-01,12:00,1day -selmon,1/3 prec_CRUNCEP_2007.nc \
    prec_CRUNCEP_2010_tmp.nc
cdo -b F64 selmon,1/6 prec_CRUNCEP_2009.nc prec_CRUNCEP_2009_tmp1.nc
cdo -b F64 selmon,4/12 prec_CRUNCEP_2010.nc prec_CRUNCEP_2010_tmp1.nc

cdo -b F64 -O mergetime prec_CRUNCEP_2009_tmp1.nc prec_CRUNCEP_2009_tmp.nc \
    prec_CRUNCEP_2009.nc
cdo -b F64 -O mergetime prec_CRUNCEP_2010_tmp1.nc prec_CRUNCEP_2010_tmp.nc \
    prec_CRUNCEP_2010.nc

rm *tmp*nc

cdo -b F64 mergetime prec_CRUNCEP_*nc prec_CRUNCEP_1901-2015_EP.nc

qsub run.sh
