#!/usr/bin/env bash

# This script installs all of the dependencies necessary to run the software on
# Ubuntu 12.04, Precise Pangolin.

apt-get update
# installation
apt-get install -y python-setuptools python-pip
# main dependencies
apt-get install -y python-numpy python-scipy python-matplotlib python-tables python-yaml octave
pip install oct2py==1.2.0
pip install pandas==0.12.0
pip install DynamicistToolKit==0.4.0
# testing
apt-get install -y python-nose python-coverage
# documentation
apt-get install -y python-sphinx
pip install numpydoc
# other
apt-get install -y ipython

# Test and install current branch stored on local machine with the VM
cd /vagrant
nosetests -v --with-coverage --cover-package=gaitanalysis
python setup.py install
cd docs
make html

# Test and install HEAD of master branch pulled from Github
apt-get install -y git
cd $HOME
git clone https://github.com/csu-hmc/GaitAnalysisToolKit.git
cd GaitAnalysisToolKit
nosetests -v --with-coverage --cover-package=gaitanalysis
python setup.py install
cd docs
make html
