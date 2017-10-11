#!/bin/bash

#Install Ansible & azure
apk update
apk add gcc git libffi-dev musl-dev openssl-dev perl py-pip python python-dev sshpass
pip install --upgrade pip
pip install git+git://github.com/ansible/ansible.git@stable-2.4
pip install ansible[azure]

#Add my git email for dev
git config --global user.email "stjbrown@gmail.com"
