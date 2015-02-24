#!/bin/sh
sed 's/.*ssh-rsa.*/\ \ -\ ssh-rsa\ \[YOUR_KEY_HERE\]/g' ./cloud-config.yaml> ./cloud-config.SAMPLE
git commit -a
git push origin master
