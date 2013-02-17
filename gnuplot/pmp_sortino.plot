set terminal png
set output '.\gnuplot\pm_hotspot_sortino.png'
#set nokey
set key spacing 0.8
set notitle
set nogrid
#set isosample 10,10
set contour base
set nosurface
set cntrparam levels 15
#set key 20, 40
set nocolorbox
#set palette defined (-1 "green",0 "white", 1 "red")
set palette defined ( 0 "black", 1 "red", 2 "orange", 3 "yellow" )
#set palette rgbformulae 21,22,23 #hotspot
set pm3d at s
set style data pm3d
#set ticslevel 1
set size 1, 1
#set xrange [2:20]
#set yrange [1:20]
set xlabel "Memory"
set ylabel "Confidence"
set zlabel "Sortino Ratio"
set title "Distribution of Risk-adjusted Return (Sortino Ratio)"
set dgrid3d 150,150
set hidden3d
set tmargin 0
set view 50
#set cntrparam levels discrete 0.0
splot '.\gnuplot\pmp_sortino.data' using 1:2:3 with lines

