#!/bin/bash

# Ensure required collections (community.general) are installed
ansible-galaxy collection install -r requirements.yml

sudo ansible-pull -U https://github.com/muehmar/ubuntu-ansible-pull.git
