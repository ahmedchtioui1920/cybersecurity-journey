# C2 Frameworks & Enumeration — Day 10 Extension

This document explains **Command & Control (C2) frameworks** and **enumeration** techniques used during Red Team engagements. It is intended as a conceptual and practical primer for study in authorized lab environments.

---

## Part A — Command & Control (C2) Frameworks

### What is C2?
Command & Control (C2) is the mechanism an operator uses to remotely control compromised hosts, issue commands, receive results, and orchestrate actions. C2 channels are designed to be reliable and stealthy.

### Common C2 Frameworks (overview)
- **Cobalt Strike (commercial)**  

- **Sliver (open-source)**  

- **Mythic (open-source)**  

- **Empire (legacy / PowerShell Empire)**  
  - Previously popular for Windows PowerShell-based post-exploitation. Development slowed but concepts remain useful.

- **Metasploit (C2 features via Meterpreter)**  
  - Classic exploitation framework with post-exploit capabilities (Meterpreter provides interactive C2).

### Key C2 Concepts
- **Beaconing / Callback interval:** how often an implant checks in.  
- **Transport:** HTTPS, DNS, TCP, HTTP/2, WebSockets, cloud providers (S3), etc.  
- **OpSec:** jitter/randomization, sleep, domain fronting, encrypted channels.  
- **Evasion:** mimic legitimate traffic, use common ports (443), and blend with normal traffic.

---

## Part B — Enumeration (Host, Network & Active Directory)

Enumeration is the systematic discovery of hosts, services, accounts, shares and configurations. Good enumeration solidifies next steps (privilege escalation, lateral movement).

### Host Enumeration (Linux / Windows)
**Linux basics**
- `uname -a`, `cat /etc/os-release` — OS/version  
- `id`, `whoami`, `groups` — current identity  
- `ps aux` or `ps -ef` — running processes  
- `ss -tuln` / `netstat -tulnp` — open ports & listening services  
- `sudo -l` — sudo permissions  
- `find / -perm -4000 -type f 2>/dev/null` — SUID binaries  
- tools: **LinPEAS**, `pspy`

**Windows basics**
- `whoami /priv` — privileges  
- `net user` / `net localgroup administrators` — users & groups  
- `tasklist` / `Get-Process` (PowerShell) — processes  
- `netstat -ano` — network connections with PIDs  
- `query user`, `qwinsta` — sessions  
- tools: **WinPEAS**, **PowerUp**, **PowerView**

### Network Enumeration
- **Port & service scan:** `nmap -sV -A <target>` (lab)  
- **SMB & shares:** `smbclient -L //<ip>` , `smbmap -H <ip>`  
- **RPC & NetBIOS:** `rpcclient`, `nbtstat -A <ip>`  
- **LDAP:** `ldapsearch -x -h <dc> -b "dc=domain,dc=local"` (read-only queries)  
- Detect exposed management interfaces (RDP, SMB, HTTP admin panels).

### Active Directory (AD) Enumeration (conceptual)
- **Goals:** discover accounts, groups, trusts, ACLs that reveal attack paths to high-privilege accounts.  
- **Tools:** **BloodHound** (Neo4j), `ldapsearch`, `rpcclient`, `crackmapexec`, Impacket (`secretsdump`, `wmiexec`, `smbexec`).  
- **Common enumerations:** domain users, domain controllers, SPNs (service principal names), group memberships, password policy.  
- **Important concepts:** Kerberos vs NTLM flows, SPN/Kerberoasting, delegation, trust paths.

---

## Part C — Practical Notes & Safe Examples (Lab only)
This section shows **non-malicious commands** and benign examples to practice enumeration in labs. **Do not** use against unauthorized targets.

### Examples (Linux host enumeration)
```bash
# Basic identity and kernel info
id
uname -a

# List SUID files (possible privesc)
find / -perm -4000 -type f 2>/dev/null

# Check open listening ports
ss -tuln

# Check sudo rights for current user
sudo -l
```

### Examples (Windows host enumeration - PowerShell)
```powershell
# Current user and groups
whoami /all

# List services
Get-Service | Where-Object {$_.Status -eq 'Running'}

# Network connections
netstat -ano
```

### Examples (Network / SMB)
```bash
# Nmap quick service scan (lab)
nmap -sV -p- --min-rate 500 -T4 <target-ip>

# List SMB shares (requires appropriate access or anonymous)
smbclient -L //<target-ip>

# Enumerate using rpcclient (Samba tools)
rpcclient -U "" <target-ip> -c "enumdomusers"
```

---

## Part D — Detection & Defensive Considerations
For defenders, consider:
- Monitor outbound connection patterns (periodicity, destinations).  
- Implement egress filtering — restrict unnecessary outbound ports.  
- Use EDR to detect anomalous process network activity and credential dumping.  
- Harden Windows logging and centralize Sysmon logs; analyze with SIEM.  
- Use honeytokens and fake credentials to detect lateral movement.

---

## Part E — Notes on Ethics & Lab Safety
- Only run C2 or payloads in isolated, controlled lab environments.  
- Do not upload or commit any real malware or private data to public repos.  
- Map exercises to MITRE ATT&CK IDs when reporting to learn consistent taxonomy.

---

## References & Further Reading
- MITRE ATT&CK: https://attack.mitre.org  
- Sliver (BishopFox): https://github.com/BishopFox/sliver  
- Mythic: https://github.com/its-a-feature/Mythic  
- BloodHound: https://github.com/BloodHoundAD/BloodHound
