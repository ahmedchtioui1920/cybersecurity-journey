# Day 12 — Windows Fundamentals & Active Directory (AD)

This document provides a concise, study-ready primer covering Windows internals relevant to red teaming and penetration testing, plus Active Directory (AD) fundamentals. It focuses on concepts, common commands, privilege escalation vectors, and AD enumeration — intended for authorized lab practice only.

---

## 1. Windows Fundamentals (High-level)

### Windows Architecture Overview
- **User mode vs Kernel mode:** User applications run in user mode; critical OS components (drivers, kernel) run in kernel mode with higher privileges.
- **Processes & Threads:** Process = running program; thread = execution path within a process. `tasklist` / Task Manager show processes.
- **Registry:** Central hierarchical database storing configuration (`HKLM`, `HKCU`, etc.). Many persistence points and configuration settings are stored here.
- **Services:** Windows services run in background (often as SYSTEM). Managed via `sc`, `services.msc`, `Get-Service` in PowerShell.
- **Filesystem permissions:** NTFS ACLs control access. Familiarize with `icacls` and file permissions basics.

### Important Accounts & Tokens
- **SYSTEM:** Highest local account on Windows machines.
- **Administrators:** Local admin group members have broad control.
- **Service accounts:** Often used by services; may be misconfigured or reuse weak credentials.
- **Tokens:** Windows uses access tokens for security contexts; token impersonation can be abused.

---

## 2. Common Windows Commands for Enumeration

### Basic reconnaissance
- `whoami /all` — current user and group memberships + privileges  
- `systeminfo` — OS, patches, uptime  
- `hostname` — machine name  
- `set` — environment variables  
- `qwinsta` / `query user` — logged on sessions (useful for lateral movement)

### Network & services
- `netstat -ano` — active connections with PIDs  
- `tasklist /svc` — processes and their services  
- `sc query` — list services  
- `Get-Service` (PowerShell) — list services

### Users & Groups
- `net user` — local user accounts  
- `net user <username>` — details for a user  
- `net localgroup administrators` — members of local admins

### Scheduled Tasks & Persistence
- `schtasks /Query /FO LIST /V` — list scheduled tasks  
- `reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Run` — autorun keys  
- `wmic service get name,displayname,pathname,started` — service info

---

## 3. Privilege Escalation Vectors (Windows)

Common categories where privilege escalation occurs:
- **Misconfigured services** (weak service binary paths, writable service executables)  
- **Weak or reused credentials** (local accounts with weak passwords)  
- **Unquoted service paths** (allows exec of malicious binary)  
- **Insecure file/folder permissions** (writable files executed by SYSTEM)  
- **Token impersonation / token theft** (NT AUTHORITY\SYSTEM tokens)  
- **Scheduled tasks** with insecure configurations  
- **DLL hijacking** and malicious DLL placement  
- **Kernel exploits** (less common on patched systems)

### Tools to find privesc vectors
- **WinPEAS** — comprehensive Windows enumeration script for privilege escalation  
- **PowerUp** — part of PowerSploit for privesc checks  
- **Seatbelt** — situational awareness for Windows

---

## 4. Active Directory (AD) Fundamentals

### What is AD?
Active Directory is Microsoft’s directory service for Windows domain networks. It stores users, computers, groups, policies, and more. AD commonly used in enterprises; compromising AD can lead to full domain compromise.

### Key AD Concepts
- **Domain Controller (DC):** Server that responds to authentication and directory queries (runs Active Directory Domain Services).  
- **Domain vs Local accounts:** Domain accounts are centrally managed; local accounts are machine-specific.  
- **Organizational Units (OUs):** Containers for organizing objects and applying group policies.  
- **Group Policy Objects (GPOs):** Centralized configuration and policy application mechanism.  
- **Service Principal Names (SPNs):** Used for Kerberos authentication to services; target for Kerberoasting attacks.  
- **Trusts:** Relationships between domains that can be abused to escalate privileges across domains.

---

## 5. AD Enumeration (Conceptual & Commands)

### Enumerate domain information (requires domain creds / ACLs)
- `nltest /dclist:domain.com` — list DCs  
- `nltest /domain_trusts` — domain trusts  
- `net group "Domain Admins" /domain` — list domain admins (if allowed)

### LDAP & basic queries
- `ldapsearch -x -h <dc> -b "dc=domain,dc=com"` — query directory (requires appropriate access)  
- Use **PowerView** (PowerShell) for rich AD enumeration: `Get-NetUser`, `Get-NetGroup`, `Get-NetDomainController`

### Kerberos & SPNs
- **SPN enumeration:** find service principal names to attempt Kerberoasting  
- Kerberoasting: request service tickets for SPNs and attempt offline cracking to get service account passwords

### Tools for AD enumeration & attacks
- **BloodHound** (uses Neo4j) — visualizes AD attack paths (collect data using SharpHound)  
- **Impacket** — Python tools for SMB, RPC, Kerberos interactions (`GetADUsers.py`, `secretsdump.py`)  
- **CrackMapExec** — lateral movement & enumeration toolkit

---

## 6. Safe Examples & Non-destructive Commands (Lab only)

Use these only in authorized labs.

#### Windows examples (PowerShell / CMD)
```powershell
# Who am I and privileges
whoami /all

# List local admins
net localgroup administrators

# List scheduled tasks
schtasks /Query /FO LIST /V
```

#### Linux examples (for AD tooling or management)
```bash
# Basic LDAP query (requires tools)
ldapsearch -x -h dc.example.local -b "dc=example,dc=local"

# BloodHound/SharpHound note: run in lab following official documentation
```

---

## 7. Detection & Defensive Notes (for defenders)
- **Monitor privileged account activity** (sudden use of PsExec, DCSync-like operations).  
- **Log and centralize PowerShell usage** (Enable ScriptBlock logging, use AMSI).  
- **Monitor service creation and scheduled tasks** for anomalies.  
- **Harden Kerberos settings** (use constrained delegation cautiously).  
- **Segment admin workstations** and use tiered admin models to limit lateral movement.

---

## References & Further Reading
- Microsoft Docs: Windows internals & Active Directory fundamentals  
- BloodHound docs: https://bloodhound.readthedocs.io  
- WinPEAS / PowerUp / PowerView repositories on GitHub
