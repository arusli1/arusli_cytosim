#!/bin/csh

#setenv root `echo $PWD | sed 's/\(cytosim\).*/\1/g'`
#setenv rundir $root/$user
setenv rundir $PWD
setenv root $rundir/cytosim

cd $rundir
if (! -d $rundir/runs/run_aster_force_large) then
  echo "project directory does not exist"
  mkdir runs/run_aster_force_large;
else
  echo "project directory exists, removing old run results"
  rm -rf runs/run_aster_force_large/
  mkdir runs/run_aster_force_large;
endif
 
$root/python/run/preconfig.py runs/run_aster_force_large/run%04i/config.cym cfg/aster_force_large.cym.tpl
$root/python/look/scan.py '../../../cytosim/bin/sim' runs/run_aster_force_large/run????
$root/python/look/scan.py '../../../cytosim/bin/play image image_format=ppm frame=100' runs/run_aster_force_large/run????
$root/python/look/scan.py '../../../cytosim/bin/report fiber:point frame=100 verbose=0 > net.txt' runs/run_aster_force_large/run????
$root/python/look/scan.py 'cat net.txt' runs/run_aster_force_large/run???? > runs/run_aster_force_large/results.txt

$root/python/look/scan.py '../../../cytosim/bin/sim' runs/run_aster_force_large/run????
$root/python/look/scan.py '../../../cytosim/bin/report fiber:point frame=100 verbose=0 > net2.txt' runs/run_aster_force_large/run????
$root/python/look/scan.py 'cat net2.txt' runs/run_aster_force_large/run???? > runs/run_aster_force_large/results2.txt

$root/python/look/scan.py '../../../cytosim/bin/sim' runs/run_aster_force_large/run????
$root/python/look/scan.py '../../../cytosim/bin/report fiber:point frame=100 verbose=0 > net3.txt' runs/run_aster_force_large/run????
$root/python/look/scan.py 'cat net3.txt' runs/run_aster_force_large/run???? > runs/run_aster_force_large/results3.txt

$root/python/look/scan.py '../../../cytosim/bin/sim' runs/run_aster_force_large/run????
$root/python/look/scan.py '../../../cytosim/bin/report fiber:point frame=100 verbose=0 > net4.txt' runs/run_aster_force_large/run????
$root/python/look/scan.py 'cat net4.txt' runs/run_aster_force_large/run???? > runs/run_aster_force_large/results4.txt

$root/python/look/scan.py '../../../cytosim/bin/sim' runs/run_aster_force_large/run????
$root/python/look/scan.py '../../../cytosim/bin/report fiber:point frame=100 verbose=0 > net5.txt' runs/run_aster_force_large/run????
$root/python/look/scan.py 'cat net5.txt' runs/run_aster_force_large/run???? > runs/run_aster_force_large/results5.txt


