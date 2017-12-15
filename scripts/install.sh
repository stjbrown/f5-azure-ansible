#!/bin/bash

#Install Ansible & azure
apk update
apk add gcc git libffi-dev musl-dev openssl-dev perl py-pip python python-dev sshpass
pip install --upgrade pip
pip install git+git://github.com/ansible/ansible.git@stable-2.4
pip install ansible[azure] bigsuds f5-sdk netaddr deepdiff ansible-lint ansible-review

#Add dev module bigip_node.py
cd ~
git clone https://github.com/F5Networks/f5-ansible -b devel
mv /usr/lib/python2.7/site-packages/ansible/modules/network/f5/bigip_node.py bigip_node.py.old
cp ~/f5-ansible/library/bigip_node.py /usr/lib/python2.7/site-packages/ansible/modules/network/f5/bigip_node.py

mv /usr/lib/python2.7/site-packages/ansible/modules/network/f5/bigip_virtual_server.py bigip_virtual_server.py.old
cp ~/f5-ansible/library/bigip_virtual_server.py /usr/lib/python2.7/site-packages/ansible/modules/network/f5/bigip_virtual_server.py

#Add my git email for dev
git config --global user.email "stjbrown@gmail.com"
