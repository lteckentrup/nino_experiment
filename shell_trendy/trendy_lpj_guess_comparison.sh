pathwayTRENDY=''

for model in CLM4.5 JSBACH JULES LPX VEGAS VISIT; do
  cdo -L -setreftime,1860-01-01,12:00,1day -settaxis,1860-01-01,12:00,1month \
      -mulc,86400 -muldpm $pathwayTRENDY'/'gpp/$model'_'S2_gpp.nc \
      TRENDY/gpp/$model'_'S2_gpp.nc
done

for model in ORCHIDEE; do

  cdo -L -setreftime,1901-01-01,12:00,1day -settaxis,1901-01-01,12:00,1month \
      -mulc,86400 -muldpm $pathwayTRENDY'/'gpp/$model'_'S2_gpp.nc \
      TRENDY/gpp/$model'_'S2_gpp.nc
done

for model in CLM4.5 JSBACH JULES LPX ORCHIDEE VEGAS VISIT; do
  cdo -L -chname,ra,ter -add $pathwayTRENDY'/ra/'$model'_'S2_ra.nc \
      $pathwayTRENDY'/rh/'$model'_'S2_rh.nc \
      TRENDY/ter/$model'_'S2_ter_original.nc
done

for model in CLM4.5 JSBACH JULES LPX VEGAS VISIT; do
  cdo -L -setreftime,1860-01-01,12:00,1day -settaxis,1860-01-01,12:00,1month \
      -mulc,86400 -muldpm TRENDY/ter/$model'_'S2_ter_original.nc \
      TRENDY/ter/$model'_'S2_ter.nc
  rm TRENDY/ter/$model'_'S2_ter_original.nc
done

for model in ORCHIDEE; do

  cdo -L -setreftime,1901-01-01,12:00,1day -settaxis,1901-01-01,12:00,1month \
      -mulc,86400 -muldpm TRENDY/ter/$model'_'S2_ter_original.nc \
      TRENDY/ter/$model'_'S2_ter.nc
  rm TRENDY/ter/$model'_'S2_ter_original.nc
done

for var in gpp ter; do

  module unload cdo
  module load cdo/1.6.1

  for model in CLM4.5 JSBACH JULES LPX; do
    mv TRENDY/$var'/'$model'_'S2_$var'.'nc \
       TRENDY/$var'/'$model'_'S2_$var'_'original.nc
    cdo -L -setgrid,halfdegree.txt -remapcon,halfdegree.txt \
        TRENDY/$var'/'$model'_'S2_$var'_'original.nc \
        TRENDY/$var'/'$model'_'S2_$var'.'nc
  done

  module unload cdo
  module load cdo

  mv TRENDY/$var'/'VEGAS_S2_$var'.'nc TRENDY/$var'/'VEGAS_S2_$var'_'original.nc
    cdo -L -setgrid,halfdegree.txt -invertlat -sellonlatbox,-180,180,-90,90 \
        TRENDY/$var'/'VEGAS_S2_$var'_'original.nc \
        TRENDY/$var'/'VEGAS_S2_$var'.'nc

  mv TRENDY/$var'/'VISIT_S2_$var'.'nc TRENDY/$var'/'VISIT_S2_$var'_'original.nc
    cdo -L -setgrid,halfdegree.txt TRENDY/$var'/'VISIT_S2_$var'_'original.nc \
        TRENDY/$var'/'VISIT_S2_$var'.'nc

  for model in CLM4.5 JSBACH JULES LPX ORCHIDEE VEGAS VISIT; do
    cdo selyear,1960/2013 TRENDY/$var'/'$model'_'S2_$var'.'nc \
        TRENDY/$var'/'$model'_'S2_$var'_'1960-2013.nc

    cdo ymonmean TRENDY/$var'/'$model'_'S2_$var'_'1960-2013.nc \
        TRENDY/$var'/'$model'_'S2_$var'_'clim.nc

    cdo sub TRENDY/$var'/'$model'_'S2_$var'_'1960-2013.nc \
        TRENDY/$var'/'$model'_'S2_$var'_'clim.nc \
        TRENDY/$var'/'$model'_'S2_$var'_'anomaly.nc

    cdo -L -setgrid,halfdegree.txt -detrend \
        TRENDY/$var'/'$model'_'S2_$var'_'anomaly.nc \
        TRENDY/$var'/'$model'_'S2_$var'_'anomaly_detrend_nomask.nc

    cdo mul mask.nc TRENDY/$var'/'$model'_'S2_$var'_'anomaly_detrend_nomask.nc \
            TRENDY/$var'/'$model'_'S2_$var'_'anomaly_detrend.nc

    cdo selyear,1969,1970 TRENDY/$var'/'$model'_'S2_$var'_'anomaly_detrend.nc \
        TRENDY/$var'/'$model'_'S2_$var'_'anomaly'_'1969-1970_EP.nc
    cdo selyear,1972,1973 TRENDY/$var'/'$model'_'S2_$var'_'anomaly_detrend.nc \
        TRENDY/$var'/'$model'_'S2_$var'_'anomaly'_'1972-1973_EP.nc
    cdo selyear,1976,1977 TRENDY/$var'/'$model'_'S2_$var'_'anomaly_detrend.nc \
        TRENDY/$var'/'$model'_'S2_$var'_'anomaly'_'1976-1977_EP.nc
    cdo selyear,1982,1983 TRENDY/$var'/'$model'_'S2_$var'_'anomaly_detrend.nc \
        TRENDY/$var'/'$model'_'S2_$var'_'anomaly'_'1982-1983_EP.nc
    cdo selyear,1986,1987 TRENDY/$var'/'$model'_'S2_$var'_'anomaly_detrend.nc \
        TRENDY/$var'/'$model'_'S2_$var'_'anomaly'_'1986-1987_EP.nc
    cdo selyear,1997,1998 TRENDY/$var'/'$model'_'S2_$var'_'anomaly_detrend.nc \
        TRENDY/$var'/'$model'_'S2_$var'_'anomaly'_'1997-1998_EP.nc
    cdo selyear,2006,2007 TRENDY/$var'/'$model'_'S2_$var'_'anomaly_detrend.nc \
        TRENDY/$var'/'$model'_'S2_$var'_'anomaly'_'2006-2007_EP.nc

    cdo selyear,1968,1969 TRENDY/$var'/'$model'_'S2_$var'_'anomaly_detrend.nc \
        TRENDY/$var'/'$model'_'S2_$var'_'anomaly'_'1968-1969_CP.nc
    cdo selyear,1977,1978 TRENDY/$var'/'$model'_'S2_$var'_'anomaly_detrend.nc \
        TRENDY/$var'/'$model'_'S2_$var'_'anomaly'_'1977-1978_CP.nc
    cdo selyear,1994,1995 TRENDY/$var'/'$model'_'S2_$var'_'anomaly_detrend.nc \
        TRENDY/$var'/'$model'_'S2_$var'_'anomaly'_'1994-1995_CP.nc
    cdo selyear,2002,2003 TRENDY/$var'/'$model'_'S2_$var'_'anomaly_detrend.nc \
        TRENDY/$var'/'$model'_'S2_$var'_'anomaly'_'2002-2003_CP.nc
    cdo selyear,2004,2005 TRENDY/$var'/'$model'_'S2_$var'_'anomaly_detrend.nc \
        TRENDY/$var'/'$model'_'S2_$var'_'anomaly'_'2004-2005_CP.nc
    cdo selyear,2009,2010 TRENDY/$var'/'$model'_'S2_$var'_'anomaly_detrend.nc \
        TRENDY/$var'/'$model'_'S2_$var'_'anomaly'_'2009-2010_CP.nc

    cdo ensmean TRENDY/$var'/'$model'_'*$var*anomaly*CP.nc \
        TRENDY/$var'/'$model'_'ensmean_$var'_'CP_anomaly.nc
    cdo ensmean TRENDY/$var'/'$model'_'*$var*anomaly**EP.nc \
        TRENDY/$var'/'$model'_'ensmean_$var'_'EP_anomaly.nc

    cdo -L -divc,1e+12 -fldsum -mul \
        TRENDY/$var'/'$model'_'ensmean_$var'_'CP_anomaly.nc \
        -gridarea TRENDY/$var'/'$model'_'ensmean_$var'_'CP_anomaly.nc \
        TRENDY/$var'/'$model'_'ensmean_$var'_'CP_anomaly_global.nc
    cdo -L -divc,1e+12 -fldsum -sellonlatbox,-180,180,-23,23 -mul \
        TRENDY/$var'/'$model'_'ensmean_$var'_'CP_anomaly.nc -gridarea \
        TRENDY/$var'/'$model'_'ensmean_$var'_'CP_anomaly.nc \
        TRENDY/$var'/'$model'_'ensmean_$var'_'CP_anomaly_tropical.nc
    cdo -L -divc,1e+12 -fldsum -sellonlatbox,112.25,153.75,-43.75,-10.75 -mul \
        TRENDY/$var'/'$model'_'ensmean_$var'_'CP_anomaly.nc -gridarea \
        TRENDY/$var'/'$model'_'ensmean_$var'_'CP_anomaly.nc \
        TRENDY/$var'/'$model'_'ensmean_$var'_'CP_anomaly_australia.nc

    cdo -L -divc,1e+12 -fldsum -mul \
        TRENDY/$var'/'$model'_'ensmean_$var'_'EP_anomaly.nc \
        -gridarea TRENDY/$var'/'$model'_'ensmean_$var'_'EP_anomaly.nc \
        TRENDY/$var'/'$model'_'ensmean_$var'_'EP_anomaly_global.nc
    cdo -L -divc,1e+12 -fldsum -sellonlatbox,-180,180,-23,23 -mul \
        TRENDY/$var'/'$model'_'ensmean_$var'_'EP_anomaly.nc -gridarea \
        TRENDY/$var'/'$model'_'ensmean_$var'_'EP_anomaly.nc \
        TRENDY/$var'/'$model'_'ensmean_$var'_'EP_anomaly_tropical.nc
    cdo -L -divc,1e+12 -fldsum -sellonlatbox,112.25,153.75,-43.75,-10.75 -mul \
        TRENDY/$var'/'$model'_'ensmean_$var'_'EP_anomaly.nc -gridarea \
        TRENDY/$var'/'$model'_'ensmean_$var'_'EP_anomaly.nc \
        TRENDY/$var'/'$model'_'ensmean_$var'_'EP_anomaly_australia.nc
  done

  cdo ensmean TRENDY/$var'/'*$var*anomaly*CP.nc \
  TRENDY/$var'/'ensmean_$var'_'CP.nc
  cdo ensmean TRENDY/$var'/'*$var*anomaly*EP.nc \
  TRENDY/$var'/'ensmean_$var'_'EP.nc

  cdo -L -divc,1e+12 -fldsum -mul TRENDY/$var'/'ensmean_$var'_'CP.nc \
      -gridarea TRENDY/$var'/'ensmean_$var'_'CP.nc \
      TRENDY/$var'/'ensmean_$var'_'CP_anomaly_global.nc
  cdo -L -divc,1e+12 -fldsum -sellonlatbox,-180,180,-23,23 -mul \
      TRENDY/$var'/'ensmean_$var'_'CP.nc -gridarea \
      TRENDY/$var'/'ensmean_$var'_'CP.nc \
      TRENDY/$var'/'ensmean_$var'_'CP_anomaly_tropical.nc
  cdo -L -divc,1e+12 -fldsum -sellonlatbox,112.25,153.75,-43.75,-10.75 -mul \
      TRENDY/$var'/'ensmean_$var'_'CP.nc -gridarea \
      TRENDY/$var'/'ensmean_$var'_'CP.nc \
      TRENDY/$var'/'ensmean_$var'_'CP_anomaly_australia.nc

  cdo -L -divc,1e+12 -fldsum -mul TRENDY/$var'/'ensmean_$var'_'EP.nc \
      -gridarea TRENDY/$var'/'ensmean_$var'_'EP.nc \
      TRENDY/$var'/'ensmean_$var'_'EP_anomaly_global.nc
  cdo -L -divc,1e+12 -fldsum -sellonlatbox,-180,180,-23,23 -mul \
      TRENDY/$var'/'ensmean_$var'_'EP.nc -gridarea \
      TRENDY/$var'/'ensmean_$var'_'EP.nc \
      TRENDY/$var'/'ensmean_$var'_'EP_anomaly_tropical.nc
  cdo -L -divc,1e+12 -fldsum -sellonlatbox,112.25,153.75,-43.75,-10.75 -mul \
      TRENDY/$var'/'ensmean_$var'_'EP.nc -gridarea \
      TRENDY/$var'/'ensmean_$var'_'EP.nc \
      TRENDY/$var'/'ensmean_$var'_'EP_anomaly_australia.nc

  for model in CLM4.5 JSBACH JULES LPX ORCHIDEE VEGAS VISIT; do
    rm TRENDY/$var'/'$model'_'S2_$var'_'anomaly_detrend_nomask.nc
    rm TRENDY/$var'/'$model'_'S2_$var'_'anomaly'_'1969-1970_EP.nc
    rm TRENDY/$var'/'$model'_'S2_$var'_'anomaly'_'1972-1973_EP.nc
    rm TRENDY/$var'/'$model'_'S2_$var'_'anomaly'_'1976-1977_EP.nc 
    rm TRENDY/$var'/'$model'_'S2_$var'_'anomaly'_'1982-1983_EP.nc
    rm TRENDY/$var'/'$model'_'S2_$var'_'anomaly'_'1986-1987_EP.nc
    rm TRENDY/$var'/'$model'_'S2_$var'_'anomaly'_'1997-1998_EP.nc
    rm TRENDY/$var'/'$model'_'S2_$var'_'anomaly'_'2006-2007_EP.nc

    rm TRENDY/$var'/'$model'_'S2_$var'_'anomaly'_'1968-1969_CP.nc
    rm TRENDY/$var'/'$model'_'S2_$var'_'anomaly'_'1977-1978_CP.nc
    rm TRENDY/$var'/'$model'_'S2_$var'_'anomaly'_'1994-1995_CP.nc
    rm TRENDY/$var'/'$model'_'S2_$var'_'anomaly'_'2002-2003_CP.nc
    rm TRENDY/$var'/'$model'_'S2_$var'_'anomaly'_'2004-2005_CP.nc
    rm TRENDY/$var'/'$model'_'S2_$var'_'anomaly'_'2009-2010_CP.nc
  done
done
    
pathwayLPJGUESS=''

cdo -L -chname,mra,ter -add $pathwayLPJGUESS'/'mra_LPJ-GUESS_1901-2015.nc \
    $pathwayLPJGUESS'/'mrh_LPJ-GUESS_1901-2015.nc \
    LPJ-GUESS'/'ter/ter_LPJ-GUESS_1901-2015.nc
cdo chname,mgpp,gpp $pathwayLPJGUESS'/'mgpp_LPJ-GUESS_1901-2015.nc \
    LPJ-GUESS'/'gpp/gpp_LPJ-GUESS_1901-2015.nc

for var in gpp ter; do

  cdo selyear,1960/2013 LPJ-GUESS'/'$var'/'$var'_'LPJ-GUESS_1901-2015.nc \
      LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'1960-2013.nc

  cdo ymonmean LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'1960-2013.nc \
      LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'clim.nc

  cdo sub LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'1960-2013.nc \
      LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'clim.nc \
      LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly.nc

  cdo detrend LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly.nc \
      LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly_detrend.nc
    
  cdo selyear,1969,1970 LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly_detrend.nc \
      LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly'_'1969-1970_EP.nc
  cdo selyear,1972,1973 LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly_detrend.nc \
      LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly'_'1972-1973_EP.nc
  cdo selyear,1976,1977 LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly_detrend.nc \
      LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly'_'1976-1977_EP.nc
  cdo selyear,1982,1983 LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly_detrend.nc \
      LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly'_'1982-1983_EP.nc
  cdo selyear,1986,1987 LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly_detrend.nc \
      LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly'_'1986-1987_EP.nc
  cdo selyear,1997,1998 LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly_detrend.nc \
      LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly'_'1997-1998_EP.nc
  cdo selyear,2006,2007 LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly_detrend.nc \
      LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly'_'2006-2007_EP.nc

  cdo selyear,1968,1969 LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly_detrend.nc \
      LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly'_'1968-1969_CP.nc
  cdo selyear,1977,1978 LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly_detrend.nc \
      LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly'_'1977-1978_CP.nc
  cdo selyear,1994,1995 LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly_detrend.nc \
      LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly'_'1994-1995_CP.nc
  cdo selyear,2002,2003 LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly_detrend.nc \
      LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly'_'2002-2003_CP.nc
  cdo selyear,2004,2005 LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly_detrend.nc \
      LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly'_'2004-2005_CP.nc
  cdo selyear,2009,2010 LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly_detrend.nc \
      LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly'_'2009-2010_CP.nc

  cdo ensmean LPJ-GUESS/$var'/'$var*anomaly*CP.nc \
      LPJ-GUESS/$var'/'$var'_'CP_anomaly.nc
  cdo ensmean LPJ-GUESS/$var'/'$var*anomaly*EP.nc \
      LPJ-GUESS/$var'/'$var'_'EP_anomaly.nc

  cdo -L -divc,1e+12 -fldsum -mul \
      LPJ-GUESS/$var'/'$var'_'CP_anomaly.nc \
      -gridarea LPJ-GUESS/$var'/'$var'_'CP_anomaly.nc \
      LPJ-GUESS/$var'/'ensmean_$var'_'CP_anomaly_global.nc
  cdo -L -divc,1e+12 -fldsum -sellonlatbox,-180,180,-23,23 -mul \
      LPJ-GUESS/$var'/'$var'_'CP_anomaly.nc -gridarea \
      LPJ-GUESS/$var'/'$var'_'CP_anomaly.nc \
      LPJ-GUESS/$var'/'ensmean_$var'_'CP_anomaly_tropical.nc
  cdo -L -divc,1e+12 -fldsum -sellonlatbox,112.25,153.75,-43.75,-10.75 -mul \
      LPJ-GUESS/$var'/'$var'_'CP_anomaly.nc -gridarea \
      LPJ-GUESS/$var'/'$var'_'CP_anomaly.nc \
      LPJ-GUESS/$var'/'ensmean_$var'_'CP_anomaly_australia.nc

  cdo -L -divc,1e+12 -fldsum -mul \
      LPJ-GUESS/$var'/'$var'_'EP_anomaly.nc \
      -gridarea LPJ-GUESS/$var'/'$var'_'EP_anomaly.nc \
      LPJ-GUESS/$var'/'ensmean_$var'_'EP_anomaly_global.nc
  cdo -L -divc,1e+12 -fldsum -sellonlatbox,-180,180,-23,23 -mul \
      LPJ-GUESS/$var'/'$var'_'EP_anomaly.nc -gridarea \
      LPJ-GUESS/$var'/'$var'_'EP_anomaly.nc \
      LPJ-GUESS/$var'/'ensmean_$var'_'EP_anomaly_tropical.nc
  cdo -L -divc,1e+12 -fldsum -sellonlatbox,112.25,153.75,-43.75,-10.75 -mul \
      LPJ-GUESS/$var'/'$var'_'EP_anomaly.nc -gridarea \
      LPJ-GUESS/$var'/'$var'_'EP_anomaly.nc \
      LPJ-GUESS/$var'/'ensmean_$var'_'EP_anomaly_australia.nc

  rm LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly'_'1969-1970_EP.nc
  rm LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly'_'1972-1973_EP.nc
  rm LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly'_'1976-1977_EP.nc
  rm LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly'_'1982-1983_EP.nc
  rm LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly'_'1986-1987_EP.nc
  rm LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly'_'1997-1998_EP.nc
  rm LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly'_'2006-2007_EP.nc

  rm LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly'_'1968-1969_CP.nc
  rm LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly'_'1977-1978_CP.nc
  rm LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly'_'1994-1995_CP.nc
  rm LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly'_'2002-2003_CP.nc
  rm LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly'_'2004-2005_CP.nc
  rm LPJ-GUESS/$var'/'$var'_'LPJ-GUESS'_'anomaly'_'2009-2010_CP.nc
done
