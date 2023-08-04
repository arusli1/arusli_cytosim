#!/bin/csh

#setenv root `echo $PWD | sed 's/\(cytosim\).*/\1/g'`
#setenv rundir $root/$user
setenv rundir $PWD
setenv root $rundir/cytosim

cd $rundir
if (! -d $rundir/runs/project1) then
  echo "project directory does not exist"
  mkdir runs/project1;
else
  echo "project directory exists, removing old run results"
  rm -rf runs/project1/
endif
 
$root/python/run/preconfig.py runs/project1/run%04i/config.cym cfg/config.cym.tpl
$root/python/look/scan.py '../../../cytosim/bin/sim' runs/project1/run????
$root/python/look/scan.py '../../../cytosim/bin/play image image_format=ppm frame=10' runs/project1/run????
$root/python/look/scan.py '../../../cytosim/bin/report network:size frame=10 verbose=0 > net.txt' runs/project1/run????
$root/python/look/scan.py + 'cat net.txt' runs/project1/run???? > runs/project1/results.txt

