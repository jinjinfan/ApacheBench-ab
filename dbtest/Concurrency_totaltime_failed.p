reset
set terminal png truecolor nocrop font arial 8 size 1200,800 
set output 'results/Concurrency_totaltime_failed.png'

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

set multiplot layout 3,1 columnsfirst scale 1.0,0.9
set xrange [0:35]

# Plot the datas
set title 'Apache benchmark testing' offset 0,-0.5
set ylabel "total time cost(s)"
set xlabel 'number of concurrency'
plot "sources/Ccread.dat" using 1:2 title 'total time cost(read)' with lines,\
     "sources/Ccwrite.dat" using 1:2 title 'total time cost(write)' with lines

set xlabel "number of concurrency"
set ylabel "Error numbers"
set title 'Error map_ReadRequest' offset 0,-0.5
plot "sources/Ccread_connerr.dat" u 1:2 w boxes lc rgb"green" title "HTTP connection error",\
     "sources/Ccread_connerr_obix.dat" u 1:2 w boxes lc rgb"red" title "OBix request error"

set title 'Error map_WriteRequest' offset 0,-0.5
plot "sources/Ccwrite_connerr.dat" u 1:2 w boxes lc rgb"green" title "HTTP connection error",\
     "sources/Ccwrite_connerr_obix.dat" u 1:2 w boxes lc rgb"red" title "OBix request error"