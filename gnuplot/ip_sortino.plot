set terminal png
set output '.\gnuplot\investor_timeline_sortino.png'
#set nokey
set key spacing 0.8
set notitle
set nogrid
#set isosample 100,100
#set samples 50
set contour base
set nosurface
set cntrparam levels 20
#set cntrparam levels discrete 0.0
#set key 20, 40
set nocolorbox
#set palette defined (-1 "green",0 "white", 1 "red")
set palette defined ( 0 "black", 1 "red", 2 "orange", 3 "yellow" )
#set palette rgbformulae 21,22,23 #hotspot
set pm3d at s #flush center scansforward
#set style data pm3d
#set ticslevel 0
set size 1, 1
#set xrange [2:20]
#set yrange [1:20]
set xlabel "Memory"
set ylabel ">>> Periods >>>"
set zlabel "Sortino Ratio"
set dgrid3d 150, 150
set hidden3d
set tmargin 0
set view 50
#set xdata time
#set timefmt "%Y-%m-%d"
#set format x "%b %y"
#set arrow 1 from 26,-10,0 to 26,10,0 lw 1 lt 2
set title "Distribution of Historical Risk-adjusted Return (Sortino Ratio)"
splot '.\gnuplot\ip_sortino.data' matrix with lines
