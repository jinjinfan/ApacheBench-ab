reset
set terminal png truecolor nocrop font arial 8 size 1200,800 
set output 'results/Request_totaltime_failed_con.png'

dx=5.
n=2
total_box_width_relative=0.75
gap_width_relative=0.1
d_width=(gap_width_relative+total_box_width_relative)*dx/2.

set grid
set boxwidth total_box_width_relative/n relative
set style fill transparent solid 0.5 noborder
set term png truecolor

set key left top

set multiplot layout 3,2 columnsfirst scale 1.0,0.9
set xrange [0:35000]

# Plot the data
set title 'Apache benchmark testing(concurrency=1)' offset 0,-0.5
set ylabel "total time (s)"
set xlabel 'number of requests'
plot "sources/Reqread.dat" using 1:2 title 'total time(read)' with lines,\
     "sources/Reqwrite.dat" using 1:2 title 'total time(write)' with lines

set xlabel "number of requests"
set ylabel "Error numbers"
set title 'Error map_ReadRequest(concurrency = 1)' offset 0,-0.5
plot "sources/Reqread_connerr.dat" u 1:2 w boxes lc rgb"green" title "HTTP connection error",\
     "sources/Reqread_connerr_obix.dat" u 1:2 w boxes lc rgb"red" title "OBix request error"

set title 'Error map_WriteRequest(concurrency = 1)' offset 0,-0.5
plot "sources/Reqwrite_connerr.dat" u 1:2 w boxes lc rgb"green" title "HTTP connection error",\
     "sources/Reqwrite_connerr_obix.dat" u 1:2 w boxes lc rgb"red" title "OBix request error"

set title 'Apache benchmark testing(concurrency=10)' offset 0,-0.5
set ylabel "total time (s)"
set xlabel 'number of requests'
plot "sources/Reqread10.dat" using 1:2 title 'total time(read)' with lines,\
     "sources/Reqwrite10.dat" using 1:2 title 'total time(write)' with lines

set xlabel "number of requests"
set ylabel "Error numbers"
set title 'Error map_ReadRequest(concurrency = 10)' offset 0,-0.5
plot "sources/Reqread10_connerr.dat" u 1:2 w boxes lc rgb"green" title "HTTP connection error",\
     "sources/Reqread10_connerr_obix.dat" u 1:2 w boxes lc rgb"red" title "OBix request error"

set title 'Error map_WriteRequest(concurrency = 10)' offset 0,-0.5
plot "sources/Reqwrite10_connerr.dat" u 1:2 w boxes lc rgb"green" title "HTTP connection error",\
     "sources/Reqwrite10_connerr_obix.dat" u 1:2 w boxes lc rgb"red" title "OBix request error"