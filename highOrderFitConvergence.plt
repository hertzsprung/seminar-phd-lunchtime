set term pngcairo size 1600,1200 font "times,28" lw 2
set output "highOrderFitConvergence.png"

set style data linespoints
set logscale

set xrange [300:100]
set xlabel '# of cells in x'
set ylabel 'ℓ₂ error'
set xtics (100, 150, 200, 250)

set key inside bottom right

plot 'convergence.gaussian.dat' using 1:4 lw 2 lc 1 ps 3 title 'highOrderFit', \
     'convergence.gaussian.dat' using 1:5 lw 2 lc 2 ps 3 title 'cubicFit', \
     2e2*x**-2 lc 0 dt 3 lw 1.5 title 'x^2', \
     3e6*x**-4 lc 0 dt 4 lw 1.5 title 'x^4'
