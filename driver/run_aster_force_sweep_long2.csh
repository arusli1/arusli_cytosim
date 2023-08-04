#!/bin/csh

#setenv root `echo $PWD | sed 's/\(cytosim\).*/\1/g'`
#setenv rundir $root/$user
setenv rundir $PWD
setenv root $rundir/cytosim

cd $rundir
if (! -d $rundir/runs/run_aster_force_sweep_long2) then
  echo "project directory does not exist"
  mkdir runs/run_aster_force_sweep_long2;
else
  echo "project directory exists, removing old run results"
  rm -rf runs/run_aster_force_sweep_long2/
  mkdir runs/run_aster_force_sweep_long2;
endif
 
$root/python/run/preconfig.py runs/run_aster_force_sweep_long2/run%04i/config.cym cfg/aster_force_sweep_long.cym.tpl
$root/python/look/scan.py '../../../cytosim/bin/sim' runs/run_aster_force_sweep_long2/run????
$root/python/look/scan.py '../../../cytosim/bin/report fiber:point frame=10 verbose=0 > net.txt' runs/run_aster_force_sweep_long2/run????
$root/python/look/scan.py 'cat net.txt' runs/run_aster_force_sweep_long2/run???? > runs/run_aster_force_sweep_long2/results.txt


