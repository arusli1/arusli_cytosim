#!/bin/csh

#setenv root `echo $PWD | sed 's/\(cytosim\).*/\1/g'`
#setenv rundir $root/$user
setenv rundir $PWD
setenv root $rundir/cytosim

cd $rundir
if (! -d $rundir/runs/run_aster_force_sweep_long) then
  echo "project directory does not exist"
  mkdir runs/run_aster_force_sweep_long;
else
  echo "project directory exists, removing old run results"
  rm -rf runs/run_aster_force_sweep_long/
  mkdir runs/run_aster_force_sweep_long;
endif
 
$root/python/run/preconfig.py runs/run_aster_force_sweep_long/run%04i/config.cym cfg/aster_force_sweep_long.cym.tpl
$root/python/look/scan.py '../../../cytosim/bin/sim' runs/run_aster_force_sweep_long/run????
$root/python/look/scan.py '../../../cytosim/bin/play image image_format=ppm frame=10' runs/run_aster_force_sweep_long/run????
$root/python/look/scan.py '../../../cytosim/bin/report fiber:point frame=10 verbose=0 > net.txt' runs/run_aster_force_sweep_long/run????
$root/python/look/scan.py 'cat net.txt' runs/run_aster_force_sweep_long/run???? > runs/run_aster_force_sweep_long/results.txt


