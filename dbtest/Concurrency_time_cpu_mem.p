reset
set terminal png truecolor nocrop font arial 8 size 1200,800
set output 'results/Concurrency_time_cpu_mem.png'

set style fill transparent solid 0.5 noborder
set term png truecolor

set key right top

set multiplot layout 3,2 columnsfirst scale 1.0,0.9
set xrange [0:35]

# Plot the datas
set title 'Apache benchmark testing' offset 0,-0.5
set ylabel "total time cost(s)"
set xlabel 'number of concurrency'
plot "sources/Ccread.dat" using 1:2 title 'total time cost(read)' with lines,\
     "sources/Ccwrite.dat" using 1:2 title 'total time cost(write)' with lines

set ylabel "time cost(ms)"
set title 'Min/Median Time cost' offset 0,-0.5
plot "sources/Ccread_time.dat" using 1:2 title 'Minimal time cost with read operation' with lines,\
     "sources/Ccread_time.dat" using 1:3 title 'Median time cost with read operation' with lines,\
     "sources/Ccwrite_time.dat" using 1:2 title 'Minimal time cost with write operation' with lines,\
     "sources/Ccwrite_time.dat" using 1:3 title 'Median time cost with write operation' with lines

set title 'Max Time cost' offset 0,-0.5
plot "sources/Ccread_time.dat" using 1:4 title 'Maximal time cost with read operation' with lines,\
     "sources/Ccwrite_time.dat" using 1:4 title 'Maximal time cost with write operation' with lines

set ylabel "CPU usage"
set title 'CPU usage with read operation' offset 0,-0.5
plot "sources/Ccread_cpu.dat" using 1:2 title 'CPU usage of last 1 min(read)' with lines,\
     "sources/Ccread_cpu.dat" using 1:3 title 'CPU usage of last 5 min(read)' with lines,\
     "sources/Ccread_cpu.dat" using 1:4 title 'CPU usage of last 15 min(read)' with lines

set ylabel "CPU usage "
set title 'CPU usage with write operation' offset 0,-0.5
plot "sources/Ccwrite_cpu.dat" using 1:2 title 'CPU usage of last 1 min(write)' with lines,\
     "sources/Ccwrite_cpu.dat" using 1:3 title 'CPU usage of last 5 min((write)' with lines,\
     "sources/Ccwrite_cpu.dat" using 1:4 title 'CPU usage of last 15 min((write)' with lines

set ylabel "RAM usage(KB)"
set title 'RAM usage' offset 0,-0.5
plot "sources/Ccread_mem.dat" using 1:2 title 'RAM usage(read)' with lines,\
     "sources/Ccwrite_mem.dat" using 1:2 title 'RAM usage(write)' with lines
