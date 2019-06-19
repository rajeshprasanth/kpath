#set term png enhanced size 640,480
set terminal postscript eps enhanced color font 'Helvetica,10'
set output "test.eps"
G1=0.0000
X1=0.7071
W1=1.0607
K1=1.3107
G2=2.0607
L1=2.6730
U2=3.1060
W2=3.3560
L2=3.8560
K2=4.2891
X2=4.5391

stats "Li12Sb4.pw.vdw.vcrelax.qe.std_prim.bands.in.dat.gnu" using 1 name "bsx" nooutput
stats "Li12Sb4.pw.vdw.vcrelax.qe.std_prim.bands.in.dat.gnu" using 2 name "bsy" nooutput
stats "Li12Sb4.pw.vdw.vcrelax.qe.std_prim.dat" using 1 name "dsx" nooutput
stats "Li12Sb4.pw.vdw.vcrelax.qe.std_prim.dat" using 2 name "dsy" nooutput


set xtics nomirror
set ytics nomirror


set multiplot layout 1,2 title "Bandstructure and DOS--test"
#------------------------------------------------------------------
# Bandstructure
#------------------------------------------------------------------
unset key
#
set rmargin 0
set size 0.7,0.95
#
set xrange [bsx_min:bsx_max]
set yrange [bsy_min-4.152-1:bsy_max-4.152+1]

#
set arrow from 0,0 to  bsx_max,0 nohead lt 12 lc rgb "red" lw 0.5
#
set arrow from  G1,bsy_min-4.152-1 to G1,bsy_max-4.152+1 nohead lt 5 lw 1 lc rgb "red"
set arrow from  X1,bsy_min-4.152-1 to X1,bsy_max-4.152+1 nohead lt 5 lw 1 lc rgb "red"
set arrow from  W1,bsy_min-4.152-1 to W1,bsy_max-4.152+1 nohead lt 5 lw 1 lc rgb "red"
set arrow from  K1,bsy_min-4.152-1 to K1,bsy_max-4.152+1 nohead lt 5 lw 1 lc rgb "red"
set arrow from  G2,bsy_min-4.152-1 to G2,bsy_max-4.152+1 nohead lt 5 lw 1 lc rgb "red"
set arrow from  L1,bsy_min-4.152-1 to L1,bsy_max-4.152+1 nohead lt 5 lw 1 lc rgb "red"
set arrow from  U2,bsy_min-4.152-1 to U2,bsy_max-4.152+1 nohead lt 5 lw 1 lc rgb "red"
set arrow from  W2,bsy_min-4.152-1 to W2,bsy_max-4.152+1 nohead lt 5 lw 1 lc rgb "red"
set arrow from  L2,bsy_min-4.152-1 to L2,bsy_max-4.152+1 nohead lt 5 lw 1 lc rgb "red"
set arrow from  K2,bsy_min-4.152-1 to K2,bsy_max-4.152+1 nohead lt 5 lw 1 lc rgb "red"
set arrow from  X2,bsy_min-4.152-1 to X2,bsy_max-4.152+1 nohead lt 5 lw 1 lc rgb "red"
#
set xtics ( '{/Symbol G}' G1 , 'X' X1 , 'W' W1 , 'K' K1 , '{/Symbol G}' G2 , 'L' L1 , 'U' U2 , 'W' W2 , 'L' L2 , 'K|U' K2 , 'X' X2 )
#
set ylabel "Energy (eV)"

plot 'Li12Sb4.pw.vdw.vcrelax.qe.std_prim.bands.in.dat.gnu' using 1:($2-4.152) with lines lc rgb "blue"
#plot 'Li12Sb4.pw.vdw.vcrelax.qe.std_prim.bands.in.dat.gnu' using 1:2 with lines

unset xtics
unset xrange;unset yrange
unset arrow
unset ylabel
#------------------------------------------------------------------
# DOS
#------------------------------------------------------------------
unset key
#
set lmargin 26
set bmargin 2
set size 0.45,0.95
#
set ytics ( " " 0)
set yrange [bsy_min-4.152-1:bsy_max-4.152+1]
set xrange [dsy_min:dsy_max+1]
set xlabel "DOS"
#
set arrow from 0,0 to  dsy_max+1,0 nohead lt 3 lc rgb "red" lw 0.5
#
plot 'Li12Sb4.pw.vdw.vcrelax.qe.std_prim.dat' using 2:($1-4.152) with lines lc rgb "blue"
#plot 'Li12Sb4.pw.vdw.vcrelax.qe.std_prim.dat' using 2:1 with lines

unset xtics
unset xrange;unset yrange
unset arrow

