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


def CUB (a,b,c,alpha,beta,gamma):
    
    gp_kpath_x = ['G1','X1','M1','G2','R1','X2','R2']
    gp_kpath_y = ['{/Symbol G}','X','M','{/Symbol G}','R','X|M','R']

    G = [0.0, 0.0, 0.0]
    M = [0.5, 0.5, 0.0]
    R = [0.5, 0.5, 0.5]
    X = [0.0, 0.5, 0.0]
    	
    kpath_hsp = [G,X,M,G,R,X,M,R]
    kpath_incr = [incr,incr,incr,incr,incr,1,incr,1]
    kpath_label = ['{/Symbol G}','X','M','{/Symbol G}','R','X','M','R']
		
    write_to_file(gp_kpath_x,gp_kpath_y,kpath_hsp,kpath_incr,kpath_label)
    
def FCC (a,b,c,alpha,beta,gamma):
    gp_kpath_x = ['G1','X1','W1','K1','G2','L1','U1','W2','L2','K2','X2']
    gp_kpath_y = ['{/Symbol G}','X','W','K','{/Symbol G}','L','U','W','L','K|U','X']

    G = [0.000, 0.000, 0.000]
    K = [3./8., 3./8., 3./4.]
    L = [1./2., 1./2., 1./2.]
    U = [5./8., 1./4., 5./8.]
    W = [1./2., 1./4., 3./4.]
    X = [1./2., 0.000, 1./2.]
    
    kpath_hsp = [G,X,W,K,G,L,U,W,L,K,U,X]
    kpath_incr = [incr,incr,incr,incr,incr,incr,incr,incr,incr,1,incr,1]
    kpath_label = ['{/Symbol G}','X','W','K','{/Symbol G}','L','U','W','L','K','U','X']
    
    write_to_file(gp_kpath_x,gp_kpath_y,kpath_hsp,kpath_incr,kpath_label)

def BCC (a,b,c,alpha,beta,gamma):
    gp_kpath_x = ['G1','H1','N1','G1','P1','H2','N2']
    gp_kpath_y = ['{/Symbol G}','H','N','{/Symbol G}','P','H|P','N']

    G = [0.0, 0.0, 0.0]
    H = [0.5, -0.5, 0.5]
    P = [0.25, 0.25, 0.25]
    N = [0.0, 0.0, 0.5]
    
    kpath_hsp = [G,H,N,G,P,H,P,N]
    kpath_incr = [incr,incr,incr,incr,incr,1,incr,1]
    kpath_label = ['{/Symbol G}','H','N','{/Symbol G}','P','H','P','N']
    
    write_to_file(gp_kpath_x,gp_kpath_y,kpath_hsp,kpath_incr,kpath_label)
    
    
    
def TET (a,b,c,alpha,beta,gamma):
    gp_kpath_x = ['G1','X1','M1','G2','Z1','R1','A1','Z2','R2','A2']
    gp_kpath_y = ['{/Symbol G}','X','M','{/Symbol G}','Z','R','A','Z|X','R|M','A']
    
    G = [0.0, 0.0, 0.0]
    A = [0.5, 0.5, 0.5]
    M = [0.5, 0.5, 0.0]
    R = [0.0, 0.5, 0.5]
    X = [0.0, 0.5, 0.0]
    Z = [0.0, 0.0, 0.5]
    
    kpath_hsp = [G,X,M,G,Z,R,A,Z,X,R,M,A]
    kpath_incr = [incr,incr,incr,incr,incr,incr,incr,1,incr,1,incr,1]
    kpath_label = ['{/Symbol G}','X','M','{/Symbol G}','Z','R','A','Z','X','R','M','A']
    
    write_to_file(gp_kpath_x,gp_kpath_y,kpath_hsp,kpath_incr,kpath_label)
    
    	
def write_to_file(gp_kpath_x,gp_kpath_y,kpath_hsp,kpath_incr,kpath_label):
	
	#----------------------------------------------------------------------------------
	#for i in range(len(gp_kpath_x)):
	#	print gp_kpath_x[i], "'"+gp_kpath_y[i]+"'"
	#----------------------------------------------------------------------------------
	try:
		with open(sys.argv[8]+".gp", 'w') as f:
			for i in range(len(gp_kpath_x)):
				f.write (gp_kpath_x[i]+" = '"+gp_kpath_y[i]+"'\n")
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
	
	
if sys.argv[1] == "CUB":
    CUB(sys.argv[2],sys.argv[3],sys.argv[4],sys.argv[5],sys.argv[6],sys.argv[7])
if sys.argv[1] == "FCC":
    FCC(sys.argv[2],sys.argv[3],sys.argv[4],sys.argv[5],sys.argv[6],sys.argv[7])
if sys.argv[1] == "BCC":
    BCC(sys.argv[2],sys.argv[3],sys.argv[4],sys.argv[5],sys.argv[6],sys.argv[7])
if sys.argv[1] == "TET":
    TET(sys.argv[2],sys.argv[3],sys.argv[4],sys.argv[5],sys.argv[6],sys.argv[7])

print "I'm Done !"
