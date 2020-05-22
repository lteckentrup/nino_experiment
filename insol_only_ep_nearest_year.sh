cp ../insol_cru/insol_*nc .

cdo -b F64 -settaxis,1968-10-01,12:00,1day -selmon,10/12 insol_CRUNCEP_1969.nc \
    insol_CRUNCEP_1968_tmp.nc
cdo -b F64 -settaxis,1969-01-01,12:00,1day -selmon,1/5 insol_CRUNCEP_1970.nc \
    insol_CRUNCEP_1969_tmp.nc
cdo -b F64 selmon,1/9 insol_CRUNCEP_1968.nc insol_CRUNCEP_1968_tmp1.nc
cdo -b F64 selmon,6/12 insol_CRUNCEP_1969.nc insol_CRUNCEP_1969_tmp1.nc

cdo -b F64 -O mergetime insol_CRUNCEP_1968_tmp1.nc insol_CRUNCEP_1968_tmp.nc \
    insol_CRUNCEP_1968.nc
cdo -b F64 -O mergetime insol_CRUNCEP_1969_tmp1.nc insol_CRUNCEP_1969_tmp.nc \
    insol_CRUNCEP_1969.nc

cdo -b F64 -settaxis,1977-09-01,12:00,1day -selmon,9/12 insol_CRUNCEP_1976.nc \
    insol_CRUNCEP_1977_tmp.nc
cdo -b F64 -settaxis,1978-01-01,12:00,1day -selmon,1 insol_CRUNCEP_1977.nc \
    insol_CRUNCEP_1978_tmp.nc
cdo -b F64 selmon,1/8 insol_CRUNCEP_1977.nc insol_CRUNCEP_1977_tmp1.nc
cdo -b F64 selmon,2/12 insol_CRUNCEP_1978.nc insol_CRUNCEP_1978_tmp1.nc

cdo -b F64 -O mergetime insol_CRUNCEP_1977_tmp1.nc insol_CRUNCEP_1977_tmp.nc \
    insol_CRUNCEP_1977.nc
cdo -b F64 -O mergetime insol_CRUNCEP_1978_tmp1.nc insol_CRUNCEP_1978_tmp.nc \
    insol_CRUNCEP_1978.nc

cdo -b F64 -settaxis,1987-05-01,12:00,1day -selmon,5/12 insol_CRUNCEP_1986.nc \
    insol_CRUNCEP_1987_tmp.nc
cdo -b F64 -settaxis,1988-01-01,12:00,1day -selmon,1,2 insol_CRUNCEP_1987.nc \
    insol_CRUNCEP_1988_tmp.nc
cdo -b F64 selmon,1/4 insol_CRUNCEP_1987.nc insol_CRUNCEP_1987_tmp1.nc
cdo -b F64 selmon,3/12 insol_CRUNCEP_1988.nc insol_CRUNCEP_1988_tmp1.nc

cdo -b F64 -O mergetime insol_CRUNCEP_1987_tmp1.nc insol_CRUNCEP_1987_tmp.nc \
    insol_CRUNCEP_1987.nc
cdo -b F64 -O mergetime insol_CRUNCEP_1988_tmp1.nc insol_CRUNCEP_1988_tmp.nc \
    insol_CRUNCEP_1988.nc

cdo -b F64 -settaxis,1991-05-01,12:00,1day -selmon,5/12 insol_CRUNCEP_1986.nc \
    insol_CRUNCEP_1991_tmp.nc
cdo -b F64 -settaxis,1992-01-01,12:00,1day -selmon,1/6 insol_CRUNCEP_1987.nc \
    insol_CRUNCEP_1992_tmp.nc
cdo -b F64 selmon,1/4 insol_CRUNCEP_1991.nc insol_CRUNCEP_1991_tmp1.nc
cdo -b F64 selmon,7/12 insol_CRUNCEP_1992.nc insol_CRUNCEP_1992_tmp1.nc

cdo -b F64 -O mergetime insol_CRUNCEP_1991_tmp1.nc insol_CRUNCEP_1991_tmp.nc \
    insol_CRUNCEP_1991.nc
cdo -b F64 -O mergetime insol_CRUNCEP_1992_tmp1.nc insol_CRUNCEP_1992_tmp.nc \
    insol_CRUNCEP_1992.nc

cdo -b F64 -settaxis,1994-09-01,12:00,1day -selmon,9/12 insol_CRUNCEP_1997.nc \
    insol_CRUNCEP_1994_tmp.nc
cdo -b F64 -settaxis,1995-01-01,12:00,1day -selmon,1/3 insol_CRUNCEP_1998.nc \
    insol_CRUNCEP_1995_tmp.nc
cdo -b F64 selmon,1/8 insol_CRUNCEP_1994.nc insol_CRUNCEP_1994_tmp1.nc
cdo -b F64 selmon,4/12 insol_CRUNCEP_1995.nc insol_CRUNCEP_1995_tmp1.nc

cdo -b F64 -O mergetime insol_CRUNCEP_1994_tmp1.nc insol_CRUNCEP_1994_tmp.nc \
    insol_CRUNCEP_1994.nc
cdo -b F64 -O mergetime insol_CRUNCEP_1995_tmp1.nc insol_CRUNCEP_1995_tmp.nc \
    insol_CRUNCEP_1995.nc

cdo -b F64 -settaxis,2002-06-01,12:00,1day -selmon,6/12 insol_CRUNCEP_2006.nc \
    insol_CRUNCEP_2002_tmp.nc
cdo -b F64 -settaxis,2003-01-01,12:00,1day -selmon,1,2 insol_CRUNCEP_2007.nc \
    insol_CRUNCEP_2003_tmp.nc
cdo -b F64 selmon,1/5 insol_CRUNCEP_2002.nc insol_CRUNCEP_2002_tmp1.nc
cdo -b F64 selmon,3/12 insol_CRUNCEP_2003.nc insol_CRUNCEP_2003_tmp1.nc

cdo -b F64 -O mergetime insol_CRUNCEP_2002_tmp1.nc insol_CRUNCEP_2002_tmp.nc \
    insol_CRUNCEP_2002.nc
cdo -b F64 -O mergetime insol_CRUNCEP_2003_tmp1.nc insol_CRUNCEP_2003_tmp.nc \
    insol_CRUNCEP_2003.nc

cdo -b F64 -settaxis,2004-07-01,12:00,1day -selmon,7/12 insol_CRUNCEP_2006.nc \
    insol_CRUNCEP_2004_tmp.nc
cdo -b F64 -settaxis,2005-01-01,12:00,1day -selmon,1,2 insol_CRUNCEP_2007.nc \
    insol_CRUNCEP_2005_tmp.nc
cdo -b F64 selmon,1/6 insol_CRUNCEP_2004.nc insol_CRUNCEP_2004_tmp1.nc
cdo -b F64 selmon,3/12 insol_CRUNCEP_2005.nc insol_CRUNCEP_2005_tmp1.nc

cdo -b F64 -O mergetime insol_CRUNCEP_2004_tmp1.nc insol_CRUNCEP_2004_tmp.nc \
    insol_CRUNCEP_2004.nc
cdo -b F64 -O mergetime insol_CRUNCEP_2005_tmp1.nc insol_CRUNCEP_2005_tmp.nc \
    insol_CRUNCEP_2005.nc

cdo -b F64 -settaxis,2009-07-01,12:00,1day -selmon,7/12 insol_CRUNCEP_2006.nc \
    insol_CRUNCEP_2009_tmp.nc
cdo -b F64 -settaxis,2010-01-01,12:00,1day -selmon,1/3 insol_CRUNCEP_2007.nc \
    insol_CRUNCEP_2010_tmp.nc
cdo -b F64 selmon,1/6 insol_CRUNCEP_2009.nc insol_CRUNCEP_2009_tmp1.nc
cdo -b F64 selmon,4/12 insol_CRUNCEP_2010.nc insol_CRUNCEP_2010_tmp1.nc

cdo -b F64 -O mergetime insol_CRUNCEP_2009_tmp1.nc insol_CRUNCEP_2009_tmp.nc \
    insol_CRUNCEP_2009.nc
cdo -b F64 -O mergetime insol_CRUNCEP_2010_tmp1.nc insol_CRUNCEP_2010_tmp.nc \
    insol_CRUNCEP_2010.nc

rm *tmp*nc

cdo -b F64 mergetime insol_CRUNCEP_*nc insol_CRUNCEP_1901-2015_EP.nc

qsub run.sh
