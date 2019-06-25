#set term png enhanced size 640,480
set terminal postscript eps enhanced color font 'Helvetica,10'
set output "SrSnO3.bands.eps"
G1=0.0000
X1=0.5000
M1=1.0000
G2=1.7071
R1=2.5731
X2=3.2802
R2=3.7802

stats "SrSnO3.bands.dat.gnu" using 1 name "bsx" nooutput
stats "SrSnO3.bands.dat.gnu" using 2 name "bsy" nooutput


set xtics nomirror
set ytics nomirror


set title "Bandstructure of SrSnO3"
#------------------------------------------------------------------
# Bandstructure
#------------------------------------------------------------------
unset key
#
set xrange [bsx_min:bsx_max]
set yrange [bsy_min-9.912-1:bsy_max-9.912+1]

#
set arrow from 0,0 to  bsx_max,0 nohead lt 12 lc rgb "red" lw 0.5
#
set arrow from  G1,bsy_min-9.912-1 to G1,bsy_max-9.912+1 nohead lt 5 lw 1 lc rgb "red"
set arrow from  X1,bsy_min-9.912-1 to X1,bsy_max-9.912+1 nohead lt 5 lw 1 lc rgb "red"
set arrow from  M1,bsy_min-9.912-1 to M1,bsy_max-9.912+1 nohead lt 5 lw 1 lc rgb "red"
set arrow from  G2,bsy_min-9.912-1 to G2,bsy_max-9.912+1 nohead lt 5 lw 1 lc rgb "red"
set arrow from  R1,bsy_min-9.912-1 to R1,bsy_max-9.912+1 nohead lt 5 lw 1 lc rgb "red"
set arrow from  X2,bsy_min-9.912-1 to X2,bsy_max-9.912+1 nohead lt 5 lw 1 lc rgb "red"
set arrow from  R2,bsy_min-9.912-1 to R2,bsy_max-9.912+1 nohead lt 5 lw 1 lc rgb "red"
#
set xtics ( '{/Symbol G}'G1 , 'X'X1 , 'M'M1 , '{/Symbol G}'G2 , 'R'R1 , 'X|M'X2 , 'R'R2 )
#
set ylabel "Energy (eV)"

plot 'SrSnO3.bands.dat.gnu' using 1:($2-9.912) with lines lc rgb "blue"
#plot 'SrSnO3.bands.dat.gnu' using 1:2 with lines

unset xtics
unset xrange;unset yrange
unset arrow
unset ylabel
