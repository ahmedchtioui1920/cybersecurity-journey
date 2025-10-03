# Nmap Notes - Detailed Tutorial

## What is Nmap?
Nmap (Network Mapper) is a command-line tool for network discovery and security auditing. Use it to discover hosts, open ports, running services, versions, and to drive the early phase of penetration testing.

---

## Common Scan Types (what they do and when to use)

- **Host discovery / Ping sweep**
  - `nmap -sn 10.0.2.0/24`
  - Purpose: find live hosts quickly. Use before deeper scans.

- **TCP Connect scan**
  - `nmap -sT <target>`
  - Purpose: uses full TCP handshake. Works without raw socket privileges.

- **SYN scan (stealth)**
  - `nmap -sS <target>`
  - Purpose: fast, stealthy; preferred for initial port discovery on most labs.

- **UDP scan**
  - `nmap -sU <target>`
  - Purpose: find UDP services (slower and noisier).

- **Version detection**
  - `nmap -sV <target>`
  - Purpose: identify the application and version running on open ports.

- **OS detection**
  - `nmap -O <target>`
  - Purpose: fingerprint the remote OS; helpful for choosing exploits.

- **Aggressive scan**
  - `nmap -A <target>`
  - Purpose: runs -O, -sV, default scripts and traceroute. Good for comprehensive single-host checks (noisy).

- **Full port scan**
  - `nmap -p- <target>`
  - Purpose: check all 65,535 TCP ports (combine with -T4 for speed).

---

## Nmap Options & Flags (practical cheatsheet)

- `-T0..-T5` — timing templates (T4 is a good balance for labs)
- `-p` — ports (e.g., `-p 22,80` or `-p-` for all)
- `-Pn` — skip host discovery (assume host is up)
- `-sS` — SYN scan
- `-sT` — TCP connect scan
- `-sU` — UDP scan
- `-sV` — version detection
- `-sC` — run default NSE scripts (equivalent to `--script=default`)
- `--script` — run specific NSE scripts (e.g., `--script vuln,http-enum`)
- `-oN` / `-oX` / `-oG` — normal / XML / greppable output
- `-v` / `-vv` — verbose
- `-iL targets.txt` — read targets from file

---

## Nmap Scripting Engine (NSE) — practical usage

- Run vulnerability-focused scripts:
  ```bash
  nmap --script vuln <target>
  ```
- Combine specific scripts:
  ```bash
  nmap --script http-enum,smb-enum-shares,ftp-anon <target>
  ```
- NSE categories: `auth`, `broadcast`, `brute`, `default`, `discovery`, `exploit`, `external`, `fuzzer`, `intrusive`, `malware`, `safe`, `version`, `vuln`.

> Tip: check script descriptions: `nmap --script-help http-enum`

---

## Example Recon Workflows (real examples)

### 1) Quick host discovery on local network
```bash
nmap -sn 192.168.56.0/24 -oN hosts_up.txt
```

### 2) Default fast port scan (top 1000 ports) + version detection
```bash
nmap -sS -sV -T4 -oN quick_scan.txt 192.168.56.101
```

### 3) Full TCP scan + aggressive checks
```bash
nmap -sS -p- -T4 -oN full_tcp_scan.txt 192.168.56.101
nmap -A -oN full_info_scan.txt 192.168.56.101
```

### 4) Focused script scan for vulnerabilities
```bash
nmap --script vuln -sV -oN vuln_scan.txt 192.168.56.101
```

---

## Interpreting Nmap Output (what to look for)

- **Open vs Filtered vs Closed**
  - `open` — service listening (attack surface)
  - `filtered` — packet filtered by firewall (need different strategy)
  - `closed` — no service, but port reachable

- **Service & Version**
  - `22/tcp open ssh OpenSSH 7.6p1 Ubuntu`
  - Use version string to search exploit DBs and choose enumeration steps.

- **Script output**
  - NSE results can include credentials, misconfigurations, or generic checks (read carefully).

- **OS and CPE**
  - OS detection and CPEs help map possible vulnerabilities and expected paths.

---

## Safe Practice Notes
- Always scan only systems you own or are authorized to test.
- Use `-T4` in lab environments; avoid aggressive timing on production networks.
