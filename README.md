# kpath

[![License: GPL v2](https://img.shields.io/github/license/rajeshprasanth/kpath.svg?color=blue)](https://www.gnu.org/licenses/gpl-3.0.en.html)

[![Build status](https://img.shields.io/gitlab/pipeline/rajeshprasanth/kpath.svg?color=yellow)](https://gitlab.com/rajeshprasanth/kpath/pipelines)



Python script for generating points of high symmetry in band structure calculation. Currently this code supports Quantum Espresso 

### Prerequisites

Prerequisites for kpath are listed below. 

```
Python 2.7 or above 
Gnuplot
```
kpath is written with simple python syntax. So, porting the code across the platforms should not be an issue. However, if you face practicalities in using this script, please feel free to report the issue. We will get that sorted out.

### Installing

Installing kpath is much simpler as like an usual package

Clone this git reposistory with the below command line

```
git clone https://github.com/rajeshprasanth/kpath.git
cd kpath
```

## Usage

Usage :: kpath.py [Bravias_Lattice] [a] [b] [c] [alpha] [beta] [gamma] [kpath_fileout]

```
kpath.py CUB 3.4 3.4 3.4 90. 90. 90. kpath
```

## Versioning

Current stable version is 0.0.1

## Authors

* **Rajesh Prashanth Anandavadivel** - *Initial work* - [Rajesh Prashanth Anandavadivel](mailto://rajeshprasanth@rediffmail.com)

## License

This project is licensed under the GNU GPL -v3 - see the [LICENSE](LICENSE) file for details

## Acknowledgments

* [aflow] (http://materials.duke.edu/awrapper.html)
* [Quantum Espresso] (www.quantum-espresso.org)
