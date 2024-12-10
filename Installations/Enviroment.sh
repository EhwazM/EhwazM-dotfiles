#!/bin/bash

mkdir -p VirtualEnvs 
virtualenv -p /usr/bin/python3 ~/VirtualEnvs/Python
source ~/VirtualEnvs/Python/bin/activate
pip install --upgrade pip
pip install numpy matplotlib notebook
python -m notebook

