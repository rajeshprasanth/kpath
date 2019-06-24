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
# Created on Sun Jun 23 23:23:03 IST 2019			
# Author: Rajesh Prashanth Anandavadivel <rajeshprasanth@rediffmail.com>
#------------------------------------------------------------------------
#
for file in $(find . -name "*.sh");
do
chmod +x $file
done
