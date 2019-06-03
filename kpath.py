#!/usr/bin/env python
#
# Created on Mon Jun  3 03:47:52 IST 2019
#
#
import math
import sys
#
#print "This is the name of the script: ", sys.argv[0]
#print "Number of arguments: ", len(sys.argv)
#print "The arguments are: " , str(sys.argv)

def usage():
	print "Usage :: kpath.py [Bravias_Lattice] [a] [b] [c] [alpha] [beta] [gamma] [kpath_dataout]"
	print "**********************************************************************"
	print "*                      Supported Bravias Lattice                     *"
	print "**********************************************************************"
	print "*  1. CUBIC (CUB,cP)                                                 *"
	print "*  2. FACE-CENTERED CUBIC (FCC,cF)                                   *"
	print "*  3. BODY-CENTERED CUBIC (BCC,cI)                                   *"
	print "*  4. TETRAGONAL (TET,tP)                                            *"
	print "*  5. BODY-CENTERED TETRAGONAL (BCT,tI)                              *"
	print "*  6. ORTHORHOMBIC (ORC,oP)                                          *"
	print "*  7. FACE-CENTERED ORTHORHOMBIC (ORCF,oF)                           *"
	print "*  8. BODY-CENTERED ORTHORHOMBIC (ORCI,oI)                           *"
	print "*  9. C-CENTERED ORTHORHOMBIC (ORCC,oS)                              *"
	print "* 10. HEXAGONAL (HEX,hP)                                             *"
	print "* 11. RHOMBOHEDRAL (RHL,hR)                                          *"
	print "* 12. MONOCLINIC (MCL,mP)                                            *"
	print "* 13. C-CENTERED MONOCLINIC (MCLC,mS)                                *"
	print "* 14. TRICLINIC (TRI,aP)                                             *"
	print "**********************************************************************"
	cub(1,1,1,90,90,90)
	exit()

if len(sys.argv) != 9 :
	usage()


def cub(a,b,c,alpha,beta,gamma):
	print "Found kpath: G-X-M-G-R-X|M-R"
	
	try:
    		with open(sys.argv[8], 'w') as f:
	     	   	f.write ("K_POINTS {crystal_b}'")
	     	   	f.write (" 8")
			f.write (" {:10.8f} {:15.8f} {:15.8f} {:5d} {:5s}'.format(0.000,0.000,0.000,10,"! Gamma")")
			f.write (" {:10.8f} {:15.8f} {:15.8f} {:5d} {:5s}'.format(0.000,0.500,0.000,10,"! X")")
			f.write (" {:10.8f} {:15.8f} {:15.8f} {:5d} {:5s}'.format(0.500,0.500,0.000,10,"! M")")
			f.write (" {:10.8f} {:15.8f} {:15.8f} {:5d} {:5s}'.format(0.000,0.000,0.000,10,"! Gamma")")
			f.write (" {:10.8f} {:15.8f} {:15.8f} {:5d} {:5s}'.format(0.500,0.500,0.500,10,"! R")")
			f.write (" {:10.8f} {:15.8f} {:15.8f} {:5d} {:5s}'.format(0.000,0.500,0.000,1,"! X")")
			f.write (" {:10.8f} {:15.8f} {:15.8f} {:5d} {:5s}'.format(0.500,0.500,0.000,10,"! M")")
			f.write (" {:10.8f} {:15.8f} {:15.8f} {:5d} {:5s}'.format(0.500,0.500,0.500,1,"! R")")
			
			
			
	except IOError:
    		print "Could not write file ::", "kpath.dat"
    		
    		
    		
cub (1,1,1,90,90,90)
