#!/bin/csh

#setenv root `echo $PWD | sed 's/\(cytosim\).*/\1/g'`
#setenv rundir $root/$user
setenv rundir $PWD
setenv root $rundir/cytosim

cd $rundir
if (! -d $rundir/runs/run_aster) then
  echo "project directory does not exist"
  mkdir runs/run_aster;
else
  echo "project directory exists, removing old run results"
  rm -rf runs/run_aster/
  mkdir runs/run_aster;
endif
 
$root/python/run/preconfig.py runs/run_aster/run%04i/config.cym cfg/aster.cym.tpl
$root/python/look/scan.py '../../../cytosim/bin/sim' runs/run_aster/run????
$root/python/look/scan.py '../../../cytosim/bin/play image image_format=ppm frame=10' runs/run_aster/run????
$root/python/look/scan.py '../../../cytosim/bin/report organizer verbose=0 > net.txt' runs/run_aster/run????
$root/python/look/scan.py + 'cat net.txt' runs/run_aster/run???? > runs/run_aster/results.txt

