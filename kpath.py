#!/usr/bin/env python
#
# Created on Mon Jun  3 03:47:52 IST 2019
#
#
import math
import sys

incr = 20 # Default
#
#print "This is the name of the script: ", sys.argv[0]
#print "Number of arguments: ", len(sys.argv)
#print "The arguments are: " , str(sys.argv)

		
def usage():
	print "Usage :: kpath.py [Bravias_Lattice] [a] [b] [c] [alpha] [beta] [gamma] [kpath_fileout]"
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
	exit()

if len(sys.argv) != 9 :
	usage()


def CUB(a,b,c,alpha,beta,gamma):
	
	gp_kpath_x = ['G1','X1','M1','G2','R1','X2','R2']
	gp_kpath_y = ['{/symbol G}','X','M','{/symbol G}','R','X|M','R']
			
    	G = [0.0, 0.0, 0.0]
    	M = [0.5, 0.5, 0.5]
    	R = [0.5, 0.5, 0.5]
    	X = [0.0, 0.5, 0.0]
    	
    	kpath_hsp = [G,X,M,G,R,X,M,R]
    	kpath_incr = [incr,incr,incr,incr,incr,1,incr,1]
	kpath_label = ['{/symbol G}','X','M','{/symbol G}','R','X','M','R']
		
    	write_to_file(gp_kpath_x,gp_kpath_y,kpath_hsp,kpath_incr,kpath_label)
		
def write_to_file(gp_kpath_x,gp_kpath_y,kpath_hsp,kpath_incr,kpath_label):
	
	#----------------------------------------------------------------------------------
	#for i in range(len(gp_kpath_x)):
	#	print gp_kpath_x[i], "'"+gp_kpath_y[i]+"'"
	#----------------------------------------------------------------------------------
	try:
		with open(sys.argv[8]+".gp", 'w') as f:
			for i in range(len(gp_kpath_x)):
				f.write (gp_kpath_x[i]+"  '"+gp_kpath_y[i]+"'\n")
	except IOError:
		print "Could not write file ::", sys.argv[8]+".gp"

	#-------------------------------------------------------------------------------------------------------------------------------------
	#print "K_POINTS {crystal_b}"
	#print len(kpath_hsp)
	#for i in range(len(kpath_hsp)):
    	#	print ("%8.8f\t%8.8f\t%8.8f\t%d\t! %s " %(kpath_hsp[i][0],kpath_hsp[i][1],kpath_hsp[i][2],kpath_incr[i],kpath_label[i]))	
    	#-------------------------------------------------------------------------------------------------------------------------------------
	
	try:
		with open(sys.argv[8]+".dat", 'w') as f:
			f.write ("K_POINTS {crystal_b}\n")
			f.write ("%d\n" % (len(kpath_hsp)))
			for i in range(len(kpath_hsp)):
    				f.write ("%8.8f\t%8.8f\t%8.8f\t%d\t! %s\n" %(kpath_hsp[i][0],kpath_hsp[i][1],kpath_hsp[i][2],kpath_incr[i],kpath_label[i]))
				
	except IOError:
		print "Could not write file ::", sys.argv[8]+".dat"
	
	
CUB (1,1,1,90,90,90)
print "I'm Done !"
