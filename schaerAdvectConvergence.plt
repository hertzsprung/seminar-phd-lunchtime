set term pngcairo size 1600,900 font 'times,24' lw 1.5
set output 'schaerAdvectConvergence.png'

set style data linespoints
set logscale
set format x "10^{%L}"
set format y "10^{%L}"

set key tmargin

set xrange [10000:100]
set yrange [1e-4:1]

set multiplot layout 1,2 margins 0.1, 0.95, 0.15, 0.75 spacing 0.15,0.12

### l2

set xlabel "Δx (m)" offset 0,0.5
set ylabel "ℓ₂ error"
plot "`echo $atmostests_builddir`/schaerAdvect-btf-linearUpwind-collated/10000/l2errorT.txt" using 1:2 lc 1 dt 2 lw 2 pt 4 ps 3 title 'BTF, linearUpwind', \
     "`echo $atmostests_builddir`/schaerAdvect-btf-cubicFit-collated/10000/l2errorT.txt" using 1:2 lc 1 lw 2 pt 5 ps 3 title 'BTF, cubicFit', \
     "`echo $atmostests_builddir`/schaerAdvect-cutCell-linearUpwind-collated/10000/l2errorT.txt" using 1:2 lc 2 dt 2 lw 2 pt 6 ps 3 title 'Cut cells, linearUpwind', \
     "`echo $atmostests_builddir`/schaerAdvect-cutCell-cubicFit-collated/10000/l2errorT.txt" using 1:2 lc 2 lw 2 pt 7 ps 3 title 'Cut cells, cubicFit', \
     x * 5e-4 lc rgbcolor "black" dt 1 lw 1.5 notitle, \
     x**2 * 2e-7 lc rgbcolor "black" dt 2 lw 2 notitle,\
     x**2 * 1e-8 lc rgbcolor "black" dt 2 lw 2 notitle

### linf

set ylabel "ℓ_∞ error"
plot "`echo $atmostests_builddir`/schaerAdvect-btf-linearUpwind-collated/10000/linferrorT.txt" using 1:2 lc 1 lw 2 dt 2 pt 4 ps 3 notitle, \
     "`echo $atmostests_builddir`/schaerAdvect-btf-cubicFit-collated/10000/linferrorT.txt" using 1:2 lc 1 lw 2 pt 5 ps 3 notitle, \
     "`echo $atmostests_builddir`/schaerAdvect-cutCell-linearUpwind-collated/10000/linferrorT.txt" using 1:2 lc 2 lw 2 dt 2 pt 6 ps 3 notitle, \
     "`echo $atmostests_builddir`/schaerAdvect-cutCell-cubicFit-collated/10000/linferrorT.txt" using 1:2 lc 2 lw 2 pt 7 ps 3 notitle, \
     x * 5e-4 lc rgbcolor "black" dt 1 lw 1.5 title '1st order', \
     x**2 * 2e-7 lc rgbcolor "black" dt 2 lw 2 title '2nd order', \
     x**2 * 1e-8 lc rgbcolor "black" dt 2 lw 2 notitle

