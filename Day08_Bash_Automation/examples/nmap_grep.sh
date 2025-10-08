#!/bin/bash
# Script to scan an IP and save open ports

read -p "Enter target IP: " ip
nmap -sV $ip | grep open > open_ports.txt
echo "[+] Open ports saved to open_ports.txt"