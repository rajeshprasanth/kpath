#!/bin/bash
#
# Created on Wed Jun 19 17:13:31 IST 2019
# Author: Rajesh Prashanth Anandavadivel <rajeshprasanth@rediffmail.com>
#
#--------------------------------------------#
# Exporting ESPRESSO Variables from ROOT dir #
#--------------------------------------------#
#
. ../../env_var
#--------------------------------------------#
# Generating kpath file with kpath.py        #
#--------------------------------------------#
gen_kpath () {
chmod +x ../../kpath.py
../../kpath.py $($AFLOW_INSTALL_DIR/aflow --edata < SrSnO3.POSCAR|grep "Real space: Bravais Lattice Primitive"|head -n 1|gawk -F= {'print $2'}|xargs) $($AFLOW_INSTALL_DIR/aflow --edata < SrSnO3.POSCAR|grep "Real space a b c alpha beta gamma"|head -n 1|gawk -F: {'print $2'}) kpath > /dev/null
}

gen_poscar() {
cat > SrSnO3.POSCAR << EOF
Sr1 Sn1 O3
1.0
4.114859 0.000000 0.000000
0.000000 4.114859 0.000000
0.000000 0.000000 4.114859
Sr Sn O
1 1 3
direct
0.500000 0.500000 0.500000 Sr
0.000000 0.000000 0.000000 Sn
0.000000 0.000000 0.500000 O
0.500000 0.000000 0.000000 O
0.000000 0.500000 0.000000 O
EOF
}
gen_scf () {
cat > SrSnO3.scf.in << EOF
&CONTROL
                       title = 'SrSnO3'
                 calculation = 'scf'
                restart_mode = 'from_scratch'
                      outdir = './SrSnO3'
                  pseudo_dir = '../../pseudo'
                     tstress = .true.
                     tprnfor = .true.
                   verbosity = 'high'
               etot_conv_thr = 1.0D-6
               forc_conv_thr = 1.0D-5
/

&SYSTEM
                       ibrav = 0
                         nat = 5
                        ntyp = 3
                        nbnd = 32
                     ecutwfc = 60
/

&ELECTRONS
                    conv_thr = 1.0D-8
            diago_cg_maxiter = 5000
            electron_maxstep = 5000
             diagonalization = 'cg'
/

&IONS
                ion_dynamics = 'bfgs'
/

&CELL
                       press = 0.0D0
              press_conv_thr = 0.1D0
/

ATOMIC_SPECIES
Sr 	87.62 	Sr.pbe-spn-rrkjus_psl.1.0.0.UPF
Sn 	118.71 	Sn.pbe-dn-rrkjus_psl.1.0.0.UPF
O 	15.9994 	O.pbe-n-rrkjus_psl.1.0.0.UPF

ATOMIC_POSITIONS (crystal)
  Sr      0.50000000000000   0.50000000000000   0.50000000000000  ! // Sr 
  Sn      0.00000000000000   0.00000000000000   0.00000000000000  ! // Sn 
  O       0.00000000000000   0.00000000000000   0.50000000000000  ! // O 
  O       0.50000000000000   0.00000000000000   0.00000000000000  ! // O 
  O       0.00000000000000   0.50000000000000   0.00000000000000  ! // O 

CELL_PARAMETERS (angstrom)
   4.11485900000000   0.00000000000000   0.00000000000000
   0.00000000000000   4.11485900000000   0.00000000000000
   0.00000000000000   0.00000000000000   4.11485900000000

K_POINTS {automatic}
 6 6 6 0 0 0
EOF
}

gen_bands_nscf () {
cat > SrSnO3.bands.nscf.in << EOF
&CONTROL
                       title = 'SrSnO3'
                 calculation = 'bands'
                restart_mode = 'from_scratch'
                      outdir = './SrSnO3'
                  pseudo_dir = '../../pseudo'
                     tstress = .true.
                     tprnfor = .true.
                   verbosity = 'high'
               etot_conv_thr = 1.0D-6
               forc_conv_thr = 1.0D-5
/

&SYSTEM
                       ibrav = 0
                         nat = 5
                        ntyp = 3
                        nbnd = 32
                     ecutwfc = 60
/

&ELECTRONS
                    conv_thr = 1.0D-8
            diago_cg_maxiter = 5000
            electron_maxstep = 5000
             diagonalization = 'cg'
/

&IONS
                ion_dynamics = 'bfgs'
/

&CELL
                       press = 0.0D0
              press_conv_thr = 0.1D0
/

ATOMIC_SPECIES
Sr 	87.62 	Sr.pbe-spn-rrkjus_psl.1.0.0.UPF
Sn 	118.71 	Sn.pbe-dn-rrkjus_psl.1.0.0.UPF
O 	15.9994 	O.pbe-n-rrkjus_psl.1.0.0.UPF

ATOMIC_POSITIONS (crystal)
  Sr      0.50000000000000   0.50000000000000   0.50000000000000  ! // Sr 
  Sn      0.00000000000000   0.00000000000000   0.00000000000000  ! // Sn 
  O       0.00000000000000   0.00000000000000   0.50000000000000  ! // O 
  O       0.50000000000000   0.00000000000000   0.00000000000000  ! // O 
  O       0.00000000000000   0.50000000000000   0.00000000000000  ! // O 

CELL_PARAMETERS (angstrom)
   4.11485900000000   0.00000000000000   0.00000000000000
   0.00000000000000   4.11485900000000   0.00000000000000
   0.00000000000000   0.00000000000000   4.11485900000000

$(cat kpath.dat)
EOF
}

gen_bands_bands() {
cat > SrSnO3.bands.in << EOF
&bands
     filband = 'SrSnO3.bands.dat'
      outdir = './SrSnO3'
  no_overlap = .true.
/
EOF
}

gen_dos_nscf() {
cat > SrSnO3.dos.nscf.in << EOF
&CONTROL
                       title = 'SrSnO3'
                 calculation = 'nscf'
                restart_mode = 'from_scratch'
                      outdir = './SrSnO3'
                  pseudo_dir = '../../pseudo'
                     tstress = .true.
                     tprnfor = .true.
                   verbosity = 'high'
               etot_conv_thr = 1.0D-6
               forc_conv_thr = 1.0D-5
/

&SYSTEM
                       ibrav = 0
                         nat = 5
                        ntyp = 3
                        nbnd = 32
                     ecutwfc = 60
                 occupations = 'tetrahedra'

/

&ELECTRONS
                    conv_thr = 1.0D-8
            diago_cg_maxiter = 5000
            electron_maxstep = 5000
             diagonalization = 'cg'
/

&IONS
                ion_dynamics = 'bfgs'
/

&CELL
                       press = 0.0D0
              press_conv_thr = 0.1D0
/

ATOMIC_SPECIES
Sr 	87.62 	Sr.pbe-spn-rrkjus_psl.1.0.0.UPF
Sn 	118.71 	Sn.pbe-dn-rrkjus_psl.1.0.0.UPF
O 	15.9994 	O.pbe-n-rrkjus_psl.1.0.0.UPF

ATOMIC_POSITIONS (crystal)
  Sr      0.50000000000000   0.50000000000000   0.50000000000000  ! // Sr 
  Sn      0.00000000000000   0.00000000000000   0.00000000000000  ! // Sn 
  O       0.00000000000000   0.00000000000000   0.50000000000000  ! // O 
  O       0.50000000000000   0.00000000000000   0.00000000000000  ! // O 
  O       0.00000000000000   0.50000000000000   0.00000000000000  ! // O 

CELL_PARAMETERS (angstrom)
   4.11485900000000   0.00000000000000   0.00000000000000
   0.00000000000000   4.11485900000000   0.00000000000000
   0.00000000000000   0.00000000000000   4.11485900000000

K_POINTS {automatic}
 6 6 6 0 0 0
EOF
}

gen_dos_dos() {
cat > SrSnO3.dos.in << EOF
&DOS
    outdir = './SrSnO3'
    fildos = 'SrSnO3.dos.dat'
      Emin = -50.0,
      Emax = 50.0,
    DeltaE = 0.1
/
EOF
}
#################################################
#################################################
#########				#########
#########				#########
######### MAIN EXECUTION STARTS HERE !! #########
######### 				#########
#########				#########
#########				#########
#################################################
#################################################
#
printf "Generating POSCAR...... "
gen_poscar
printf "Done \n"
#
printf "Running kpath.py ...... "
gen_kpath
printf "Done \n"
#
#
printf "Running SCF ...... "
gen_scf
$QE_INSTALL_DIR/pw.x < SrSnO3.scf.in > SrSnO3.scf.out
printf "Done \n"
#
#
printf "Running BANDS NSCF ...... "
gen_bands_nscf
$QE_INSTALL_DIR/pw.x < SrSnO3.bands.nscf.in > SrSnO3.bands.nscf.out
printf "Done \n"
#
#
printf "Running BANDS ...... "
gen_bands_bands
$QE_INSTALL_DIR/bands.x < SrSnO3.bands.in  > SrSnO3.bands.out
printf "Done \n"
#
#
printf "Running Cleanup ...... "
rm -rf ./SrSnO3
printf "Done \n"
#
#
printf "Running SCF ...... "
gen_scf
$QE_INSTALL_DIR/pw.x < SrSnO3.scf.in > SrSnO3.scf.out
printf "Done \n"
#
#
printf "Running DOS NSCF ...... "
gen_dos_nscf
$QE_INSTALL_DIR/pw.x < SrSnO3.dos.nscf.in > SrSnO3.dos.nscf.out
printf "Done \n"
#
#
printf "Running DOS ...... "
gen_dos_dos
$QE_INSTALL_DIR/dos.x < SrSnO3.dos.in  > SrSnO3.dos.out
printf "Done \n"
#
#
printf "Running Cleanup ...... "
rm -rf ./SrSnO3
printf "Done \n"
#
#
printf "Plotting Bands and Dos ...... "
chmod +x ../../unifiedqebands
../../unifiedqebands SrSnO3.bands.dat.gnu SrSnO3.bands.out kpath.gp SrSnO3.dos.dat SrSnO3
ps2pdf SrSnO3.eps SrSnO3.pdf
convert -density 1500 SrSnO3.eps SrSnO3.png
convert -density 1500 SrSnO3.eps SrSnO3.jpeg
printf "Done \n"
#
#
printf "Archiving the files ...... "
rm -rf *.gz
tar zcvf $(date +"%m%d%y_%H%M%S").tar.gz *
printf "Done \n"
#
mkdir bk
mv * bk
mv bk/*gz bk/*sh .
rm -rf bk