#!/bin/bash
#
# Created on Wed Jun 19 17:13:31 IST 2019
#
#
printf "Running SCF ...... "
pw.x < SrSnO3.scf.in > SrSnO3.scf.out
printf "Done \n"

printf "Running BANDS NSCF ...... "
pw.x < SrSnO3.bands.nscf.in > SrSnO3.bands.nscf.out
printf "Done \n"

printf "Running BANDS ...... "
bands.x < SrSnO3.bands.in  > SrSnO3.bands.out
printf "Done \n"

#
printf "Running SCF ...... "
pw.x < SrSnO3.scf.in > SrSnO3.scf.out
printf "Done \n"

printf "Running DOS NSCF ...... "
pw.x < SrSnO3.dos.nscf.in > SrSnO3.dos.nscf.out
printf "Done \n"

printf "Running DOS ...... "
dos.x < SrSnO3.dos.in  > SrSnO3.dos.out
printf "Done \n"

#
