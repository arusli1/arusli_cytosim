#!/bin/csh

#setenv root `echo $PWD | sed 's/\(cytosim\).*/\1/g'`
#setenv rundir $root/$user
setenv rundir $PWD
setenv root $rundir/cytosim

cd $rundir
rm -rf runs/*
$root/python/run/preconfig.py runs/run%04i/config.cym cfg/config.cym.tpl
$root/python/look/scan.py '../../cytosim/bin/sim' runs/run????
$root/python/look/scan.py '../../cytosim/bin/play image image_format=ppm frame=10' runs/run????
$root/python/look/scan.py '../../cytosim/bin/report network:size frame=10 > net.txt' runs/run????
$root/python/look/scan.py + 'cat net.txt' runs/run???? > runs/results.txt

