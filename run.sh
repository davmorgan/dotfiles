#!/bin/sh

ansible-playbook -i "localhost," -c local dotfiles.yml
