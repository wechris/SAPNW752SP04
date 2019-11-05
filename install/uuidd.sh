#!/bin/bash
echo "start uuidd..."
sudo zypper --non-interactive install uuidd
sudo service uuidd start 
