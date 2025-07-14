#!/bin/bash

dnf install ansible -y
ansible-pull -U https://github.com/mohammadsyed397/ansible-roboshop-roles-tf.git -e component=$1 -e env=$2 playbook.yaml