#!/bin/bash
# Simple Nmap automation script
nmap -sC -sV -oN scan_output.txt $1