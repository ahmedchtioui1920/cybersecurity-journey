# Day 12 — Windows & Active Directory (Beginner Level)


## 1. What is Windows? (Very Short)
Windows is an operating system that runs programs, manages files, and handles users. For security work, focus on these simple ideas:
- **User accounts:** People who log in (standard user, administrator).  
- **Processes:** Programs that run (you can see them in Task Manager).  
- **Services:** Background programs that start automatically (e.g., antivirus).  
- **Registry:** A settings database where Windows stores configuration (don’t edit it unless instructed in a lab).

---

## 2. Simple Useful Commands (Windows - Beginner)
Open a Command Prompt or PowerShell window in your lab VM and try these (they just show info):

- `whoami` → shows your username.  
- `whoami /all` → shows extra info about user groups and privileges.  
- `systeminfo` → shows basic system details (OS, build).  
- `hostname` → shows the computer’s name.  
- `net user` → lists local user accounts.  
- `net localgroup administrators` → shows who is a local administrator.
- `tasklist` → lists running programs (simple view).


---

## 3. What is Active Directory (AD)? (Very Short)
Active Directory is a system companies use to manage many Windows computers and users centrally. Key beginner ideas:
- **Domain:** A group of computers and user accounts managed together.  
- **Domain Controller (DC):** The server that knows about all users and computers.  
- **Accounts:** Users in AD can log on to many computers using one account.  
- **Groups:** Collections of users (e.g., Domain Admins) that have special rights.

---

## 4. Simple AD Concepts to Know
- **Domain vs Local account:** A local account only works on one PC; a domain account works across the network.  
- **Administrator vs User:** Administrators can install software and change settings. Users have fewer rights.  
- **Group Policy:** Rules that admins push to many computers (like “disable USB drives” or “install software”).

---

## 5. Beginner-Friendly Examples (Safe, Read-Only)
These commands only read information; they do not change anything. Run them in a lab VM if available.

### Windows (Command Prompt / PowerShell)
```powershell
# Who am I?
whoami

# Show system information (can be long)
systeminfo

# Show local users
net user

# Show local administrators
net localgroup administrators

# List running processes (simple list)
tasklist
```

### If you have a small AD lab (optional)
```bash
# Find the domain controller (the server that runs AD)
nltest /dclist:<your-domain>

# List domain groups (requires domain access)
net group "Domain Admins" /domain
```

---

## 6. Very Basic Privilege Escalation Concepts (Beginner overview)
Privilege escalation means moving from a normal user account to an account with more privileges (like Admin). As a beginner, just understand the common reasons this can happen:
- Someone left a file or program that any user can change (bad permissions).  
- A service runs as Administrator and uses a file that users can overwrite.  
- Weak passwords or shared passwords for service accounts.


---

## 7. Quick Glossary
- **DC:** Domain Controller — server that manages user logins.  
- **Admin:** A user with full control of a machine.  
- **Domain account:** Login that works across many company computers.  
- **SUID/Service:** Advanced topics — come back later when comfortable with basics.


