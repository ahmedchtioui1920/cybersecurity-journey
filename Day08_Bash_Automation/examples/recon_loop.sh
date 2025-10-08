#!/bin/bash
# Script to scan multiple IPs from a file

for ip in $(cat targets.txt); do
  echo "[*] Scanning $ip"
  nmap -Pn -T4 $ip | grep open >> multi_results.txt
done
echo "[+] Results saved to multi_results.txt"