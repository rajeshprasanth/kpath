#set term png enhanced size 640,480
set terminal postscript eps enhanced color font 'Helvetica,10'
set output "SrSnO3.dos.eps"

stats "SrSnO3.dos.dat" using 1 name "dsx" nooutput
stats "SrSnO3.dos.dat" using 2 name "dsy" nooutput


set xtics nomirror
set ytics nomirror


set title "Density of States of SrSnO3"
#------------------------------------------------------------------
# DOS
#------------------------------------------------------------------
unset key
#
#set lmargin 26
#set bmargin 2
#set size 0.45,0.95
#
#set ytics ( " " 0)
#set xrange [dsx_min:dsx_max]
#set yrange [dsy_min:dsy_max+1]
set xlabel "Energy (ev)"
set ylabel "DOS (arb. unit)"
#
set arrow from 0,0 to  dsy_max+1,0 nohead lt 3 lc rgb "red" lw 0.5
#
plot 'SrSnO3.dos.dat' using ($1-9.912):2 with lines lc rgb "blue"
#plot 'SrSnO3.dos.dat' using 2:1 with lines

unset xtics
unset xrange;unset yrange
unset arrow

