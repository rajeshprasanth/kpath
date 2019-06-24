#!/bin/bash
#------------------------------------------------------------------------
# This file is part of kpath
#
#    kpath is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    any later version.
#
#    kpath is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with Foobar.  If not, see <https://www.gnu.org/licenses/>.
#------------------------------------------------------------------------
# Created on Sun Jun 23 23:00:04 IST 2019			
# Author: Rajesh Prashanth Anandavadivel <rajeshprasanth@rediffmail.com>
#------------------------------------------------------------------------
#
chmod +x ../../kpath.py
chmod +x ../../unifiedqebands
#
cd testfiles
../../../kpath.py CUB 4.1148590000 4.1148590000 4.1148590000 90.000 90.000 90.000 kpath > /dev/null
cd ..
#
cd testfiles
../../../unifiedqebands SrSnO3.bands.dat.gnu SrSnO3.bands.out kpath.gp SrSnO3.dos.dat SrSnO3 > /dev/null
ps2pdf SrSnO3.eps SrSnO3.pdf
convert -density 1500 SrSnO3.eps  SrSnO3.png
convert -density 1500 SrSnO3.eps  SrSnO3.jpeg
#rm -rf *eps *gp kpath.dat *jpeg *png
cd ..
#


