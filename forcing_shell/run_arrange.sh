#!/bin/bash
#PBS -P w35
#PBS -q normal
#PBS -l ncpus=16
#PBS -l walltime=0:40:00,mem=190GB
#PBS -l storage=gdata/w35
#PBS -M ****** mail adress
#PBS -m abe
#PBS -l wd

NPROCESS=16
WALLTIME=0:40:00,mem=190GB
QUEUE=normal
PROJECT=w35
EMAIL=****** mail adress

module load nco
module load cdo
sh arrange.sh
