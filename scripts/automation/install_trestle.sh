#!/bin/bash

python3 -m pip install --upgrade pip setuptools
#python3 -m pip install compliance-trestle==1.2.0
python3 -m pip install git+https://github.com/IBM/compliance-trestle@develop
python3 -m pip install python-semantic-release==7.31.4