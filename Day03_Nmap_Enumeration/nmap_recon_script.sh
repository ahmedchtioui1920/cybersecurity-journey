#!/bin/bash
# nmap_recon_script.sh
# Simple automated Nmap reconnaissance script
# Usage: ./nmap_recon_script.sh <target-ip-or-hostname>
# Make executable: chmod +x nmap_recon_script.sh

if [ -z "$1" ]; then
  echo "Usage: $0 <target-ip-or-hostname>"
  exit 1
fi

TARGET="$1"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
OUTDIR="nmap_results_${TARGET}_${TIMESTAMP}"
mkdir -p "$OUTDIR"

echo "[*] Starting Nmap reconnaissance on $TARGET"
echo "[*] Output directory: $OUTDIR"

# 1) Ping sweep / host discovery (useful if given a subnet)
echo "[*] Host discovery (ping scan) — -sn"
nmap -sn "$TARGET" -oN "$OUTDIR/host_discovery.txt"

# 2) Quick default scan (top ports) with version detection and default scripts
echo "[*] Quick service scan -sS -sV -sC"
nmap -sS -sV -sC -T4 -oN "$OUTDIR/quick_scan.txt" "$TARGET"

# 3) Full TCP port scan (all ports)
echo "[*] Full TCP port scan -p-"
nmap -sS -p- -T4 -oN "$OUTDIR/full_tcp_scan.txt" "$TARGET"

# 4) Targeted vulnerability script scan
echo "[*] NSE vuln script scan"
nmap --script vuln -sV -T4 -oN "$OUTDIR/vuln_scan.txt" "$TARGET"

# 5) Aggressive scan (OS detection + version + scripts + traceroute)
echo "[*] Aggressive scan -A"
nmap -A -T4 -oN "$OUTDIR/aggressive_scan.txt" "$TARGET"

echo "[+] Nmap reconnaissance completed. Results saved in $OUTDIR"
