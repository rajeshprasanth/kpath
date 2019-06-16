# kpath

Python script for generating points of high symmetry in band structure calculation. Currently this code supports Quantum Espresso 

### Prerequisites

Prerequisites for kpath are listed below. 

```
Python 2.7 and above 
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

This project is licensed under the GNU GPL -v3 - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* [aflow] (http://materials.duke.edu/awrapper.html)
* [Quantum Espresso] (www.quantum-espresso.org)
