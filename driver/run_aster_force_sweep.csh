#!/bin/csh

#setenv root `echo $PWD | sed 's/\(cytosim\).*/\1/g'`
#setenv rundir $root/$user
setenv rundir $PWD
setenv root $rundir/cytosim

cd $rundir
if (! -d $rundir/runs/run_aster_force_sweep) then
  echo "project directory does not exist"
  mkdir runs/run_aster_force_sweep;
else
  echo "project directory exists, removing old run results"
  rm -rf runs/run_aster_force_sweep/
  mkdir runs/run_aster_force_sweep;
endif
 
$root/python/run/preconfig.py runs/run_aster_force_sweep/run%04i/config.cym cfg/aster_force_sweep.cym.tpl
$root/python/look/scan.py '../../../cytosim/bin/sim' runs/run_aster_force_sweep/run????
$root/python/look/scan.py '../../../cytosim/bin/play image image_format=ppm frame=100' runs/run_aster_force_sweep/run????
$root/python/look/scan.py '../../../cytosim/bin/report fiber:point frame=100 verbose=0 > net.txt' runs/run_aster_force_sweep/run????
$root/python/look/scan.py 'cat net.txt' runs/run_aster_force_sweep/run???? > runs/run_aster_force_sweep/results.txt


