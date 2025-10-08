#!/bin/bash
# Script that accepts targets and scans ports with timestamped results

now=$(date +"%Y%m%d_%H%M%S")
read -p "Enter IP range or domain list file: " list

for ip in $(cat $list); do
  echo "[*] Scanning $ip"
  nmap -sS -T4 $ip > "scan_$ip_$now.txt"
done

echo "[+] Scans completed."