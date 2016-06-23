reset
set terminal png truecolor nocrop font arial 8 size 1200,800 
set output 'results/Readwrite_order.png'

dx=5.
n=2
total_box_width_relative=0.75
gap_width_relative=0.1
d_width=(gap_width_relative+total_box_width_relative)*dx/2.

set grid
set boxwidth total_box_width_relative/n relative
set style fill transparent solid 0.5 noborder
set term png truecolor

set key right top

set multiplot layout 2,1 columnsfirst scale 1.0,0.9

# Plot the datas
set title 'Apache benchmark testing' offset 0,-0.5
set ylabel "total time (s)"
set xlabel "Score of each order"
plot "sources/CombiOrder.dat" using 2:3 notitle with points

set ylabel "Error numbers"
set title 'Error map' offset 0,-0.5
plot "sources/CombiOrder_connerr.dat" u 2:3 title "HTTP connection error" with points,\
     "sources/CombiOrder_connerr_obix.dat" u 2:3 title "OBix request error" with points
