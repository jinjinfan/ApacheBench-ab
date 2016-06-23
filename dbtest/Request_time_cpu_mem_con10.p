reset
set terminal png truecolor nocrop font arial 8 size 1200,800 
set output 'results/Request_time_cpu_mem_con10.png'
set style fill transparent solid 0.5 noborder
set term png truecolor

set key left top

set multiplot layout 3,2 columnsfirst scale 1.0,0.9
set xrange [0:35000]

# Plot the data
set title 'Apache benchmark testing with concurrency=10' offset 0,-0.5
set ylabel "total time cost(s)"
set xlabel 'number of request'
plot "sources/Reqread10.dat" using 1:2 title 'total time cost(read)' with lines,\
     "sources/Reqwrite10.dat" using 1:2 title 'total time cost(write)' with lines

set ylabel "time cost(ms)"
set title 'Min/Median Time cost' offset 0,-0.5
plot "sources/Reqread10_time.dat" using 1:2 title 'Minimal time cost with read operation' with lines,\
     "sources/Reqread10_time.dat" using 1:3 title 'Mean time cost with read operation' with lines,\
     "sources/Reqwrite10_time.dat" using 1:2 title 'Minimal time cost with write operation' with lines,\
     "sources/Reqwrite10_time.dat" using 1:3 title 'Mean time cost with write operation' with lines

set title 'Max Time cost with write operation' offset 0,-0.5
plot "sources/Reqread10_time.dat" using 1:4 title 'Maximal time cost with read operation' with lines,\
     "sources/Reqwrite10_time.dat" using 1:4 title 'Maximal time cost with write operation' with lines

set ylabel "CPU usage"
set title 'CPU usage with read operation' offset 0,-0.5
plot "sources/Reqread10_cpu.dat" using 1:2 title 'CPU usage of last 1 min(read)' with lines,\
     "sources/Reqread10_cpu.dat" using 1:3 title 'CPU usage of last 5 min(read)' with lines,\
     "sources/Reqread10_cpu.dat" using 1:4 title 'CPU usage of last 15 min(read)' with lines

set ylabel "CPU usage "
set title 'CPU usage with write operation' offset 0,-0.5
plot "sources/Reqwrite10_cpu.dat" using 1:2 title 'CPU usage of last 1 min(write)' with lines,\
     "sources/Reqwrite10_cpu.dat" using 1:3 title 'CPU usage of last 5 min((write)' with lines,\
     "sources/Reqwrite10_cpu.dat" using 1:4 title 'CPU usage of last 15 min((write)' with lines

set ylabel "RAM usage(KB)"
set title 'RAM usage' offset 0,-0.5
plot "sources/Reqread10_mem.dat" using 1:2 title 'RAM usage(read)' with lines,\
     "sources/Reqwrite10_mem.dat" using 1:2 title 'RAM usage(write)' with lines