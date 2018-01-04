set term pngcairo size 1600,1200 font "times,36" lw 2
set output 'maxdt.png'

set style data linespoints
set logscale x

#set lmargin 6
#set bmargin 1.5

unset key

set xrange [100:10000]
set yrange [0.1:1000]

set xtics out
set format x "%h"
set logscale y
set label at 180,7 rotate by 18 "Basic terrain following"
set label at 190,1.1 rotate by 15 "Slanted cells"
set label at 190,0.16 "Cut cells"

set xlabel "Δx (m)" offset 0,0.5
set ylabel "Δt (s)" offset 2

plot "`echo $atmostests_builddir`/mountainAdvect-maxdt-btf-6000m-cubicFit-collated/dt.txt" using 1:2 lw 2 ps 4 pt 4, \
     "`echo $atmostests_builddir`/mountainAdvect-maxdt-cutCell-6000m-cubicFit-collated/dt.txt" using 1:2 lw 2 ps 4 pt 6, \
     "`echo $atmostests_builddir`/mountainAdvect-maxdt-slantedCell-6000m-cubicFit-collated/dt.txt" using 1:2 lw 2 ps 4 pt 8
