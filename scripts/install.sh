#!/bin/bash


#install azure cli
cd ~
#pip install --upgrade --user azure-cli
pip install ansible[azure]
export PATH=~/.local/bin:$PATH

