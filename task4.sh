#!/bin/bash
#write the script to the ~/.dotfile
echo "PS1=\"[ \`date +%R:%S\` ] \w > \"" > ~/.dotfile
#store the script in .bashrc
cat ~/.dotfile >> ~/.bashrc
#execute ~/.bashrc
. ~/.bashrc
echo "Now restart your terminal to see the results"
