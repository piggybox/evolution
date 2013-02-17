set terminal png
set output '.\gnuplot\pm_hotspot_sortino.png'
set key spacing 0.8
set notitle
#set grid layerdefault
#set isosample 10,10
#set samples 101
set contour base
set view map
set colorbox
set nosurface
set cntrparam levels 0
set key off
#set palette defined (-1 "black",0 "red", 1 "yellow")
#set palette defined (-1 "black",0 "red", 1 "yellow")
set palette defined ( 0 "green", 1 "blue", 2 "red", 3 "orange" )
set palette gamma 0.5
#set palette rgbformulae 21,22,23 #hotspot
set pm3d map
#set style data pm3d
#set style function pm3d
#set ticslevel 0
set size 1, 1
#set xrange [2:20]
#set yrange [1:20]
set xlabel "Memory" 0, 2
set ylabel "Confidence" -10, 11

set zlabel "Sortino Ratio"
set title "Distribution of Risk-adjusted Return (Sortino Ratio)"
set dgrid3d 150,150
set hidden3d
set view 0,0
splot '.\gnuplot\pmp_sortino.data' using 1:2:3 with lines

