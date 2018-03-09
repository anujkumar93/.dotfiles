#!/bin/bash


if $(which apt-get); then

  sudo apt-get install libssl-dev           # Install Secure Sockets Layer toolkit
  sudo apt install make                     # install make 
  sudo apt-get install libcurl4-openssl-dev # Install curl 
  sudo apt-get install libxml2-dev          # Instal xml
  
  sudo apt install silversearcher-ag         # Install ag
fi