#!/bin/csh

#setenv root `echo $PWD | sed 's/\(cytosim\).*/\1/g'`
#setenv rundir $root/$user
setenv rundir $PWD
setenv root $rundir/cytosim

cd $rundir
if (! -d $rundir/runs/run_aster_force_large_v2) then
  echo "project directory does not exist"
  mkdir runs/run_aster_force_large_v2;
else
  echo "project directory exists, removing old run results"
  rm -rf runs/run_aster_force_large_v2/
  mkdir runs/run_aster_force_large_v2;
endif
 
$root/python/run/preconfig.py runs/run_aster_force_large_v2/run%04i/config.cym cfg/aster_force_large_v2.cym.tpl
$root/python/look/scan.py '../../../cytosim/bin/sim' runs/run_aster_force_large_v2/run????
$root/python/look/scan.py '../../../cytosim/bin/play image image_format=ppm frame=100' runs/run_aster_force_large_v2/run????
$root/python/look/scan.py '../../../cytosim/bin/report fiber:point frame=100 verbose=0 > net.txt' runs/run_aster_force_large_v2/run????
$root/python/look/scan.py 'cat net.txt' runs/run_aster_force_large_v2/run???? > runs/run_aster_force_large_v2/results.txt

$root/python/look/scan.py '../../../cytosim/bin/sim' runs/run_aster_force_large_v2/run????
$root/python/look/scan.py '../../../cytosim/bin/report fiber:point frame=100 verbose=0 > net2.txt' runs/run_aster_force_large_v2/run????
$root/python/look/scan.py 'cat net2.txt' runs/run_aster_force_large_v2/run???? > runs/run_aster_force_large_v2/results2.txt

$root/python/look/scan.py '../../../cytosim/bin/sim' runs/run_aster_force_large_v2/run????
$root/python/look/scan.py '../../../cytosim/bin/report fiber:point frame=100 verbose=0 > net3.txt' runs/run_aster_force_large_v2/run????
$root/python/look/scan.py 'cat net3.txt' runs/run_aster_force_large_v2/run???? > runs/run_aster_force_large_v2/results3.txt

$root/python/look/scan.py '../../../cytosim/bin/sim' runs/run_aster_force_large_v2/run????
$root/python/look/scan.py '../../../cytosim/bin/report fiber:point frame=100 verbose=0 > net4.txt' runs/run_aster_force_large_v2/run????
$root/python/look/scan.py 'cat net4.txt' runs/run_aster_force_large_v2/run???? > runs/run_aster_force_large_v2/results4.txt

$root/python/look/scan.py '../../../cytosim/bin/sim' runs/run_aster_force_large_v2/run????
$root/python/look/scan.py '../../../cytosim/bin/report fiber:point frame=100 verbose=0 > net5.txt' runs/run_aster_force_large_v2/run????
$root/python/look/scan.py 'cat net5.txt' runs/run_aster_force_large_v2/run???? > runs/run_aster_force_large_v2/results5.txt


