# Recon Automation Scripts

This file documents common Bash scripts to automate recon tasks.

---

## Script 1: Basic Nmap + Grep
```bash
#!/bin/bash
echo "Enter IP:"
read ip
nmap -sV $ip | grep open > open_ports.txt
echo "Open ports saved to open_ports.txt"
```

---

## Script 2: Scan Multiple Targets
```bash
#!/bin/bash
for ip in $(cat targets.txt); do
  echo "Scanning $ip"
  nmap -sS -T4 $ip | grep open >> results.txt
done
```

---

## Script 3: Save Timestamped Output
```bash
#!/bin/bash
now=$(date +"%Y%m%d_%H%M%S")
nmap -sV $1 > "nmap_scan_$now.txt"
echo "Scan saved to nmap_scan_$now.txt"
```