#!/usr/bin/env bash

ansible-playbook -i "localhost," -c local dotfiles.yml
