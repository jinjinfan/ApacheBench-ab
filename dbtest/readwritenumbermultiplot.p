reset
set terminal png truecolor nocrop font arial 8 size 1200,1000 
set output 'results/Readwrite_number.png'

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
set xrange [0:100]
set yrange [0:100]
set zrange [0:50]
#set dgrid3d 30 30
#set hidden3d
set ticslevel 0
# Plot the datas
set title 'Apache benchmark testing' offset 0,-0.5
set xlabel 'number of read request'
set ylabel "number of write request"
set zlabel "total time (s)"
splot "sources/CombiNumber_read.dat" using 1:2:3 title 'total time(read-write order)' with points,\
      "sources/CombiNumber_write.dat" using 1:2:3 title 'total time(write-read order)' with points

unset dgrid3d
unset hidden3d
set zrange [0:50]
set xlabel 'number of read request'
set ylabel "number of write request"
set zlabel "error numbers"
set title 'Error map(read-write order)' offset 0,-0.5
splot "sources/CombiNumber_read_connerr.dat" u 1:2:3 w boxes lc rgb"green" title "HTTP connection error",\
     "sources/CombiNumber_read_connerr_obix.dat" u 1:2:3 w boxes lc rgb"red" title "OBix request error"

set title 'Error map(write-read order)' offset 0,-0.5
splot "sources/CombiNumber_write_connerr.dat" u 1:2:3 w boxes lc rgb"green" title "HTTP connection error",\
     "sources/CombiNumber_write_connerr_obix.dat" u 1:2:3 w boxes lc rgb"red" title "OBix request error"
