## `bash_cheatsheet.md`


```markdown
**Source / purpose:** condensed notes for TryHackMe Linux Fundamentals (3-part summary) ).  
Use this as a quick reference while learning and doing Bandit / TryHackMe labs.

---

## Table of Contents
1. [Linux Fundamentals — Part 1 (Basics & Shell)](#linux-fundamentals---part-1-basics--shell)  
2. [Linux Fundamentals — Part 2 (Files, Permissions & Users)](#linux-fundamentals---part-2-files-permissions--users)  
3. [Linux Fundamentals — Part 3 (Processes, Services & Networking)](#linux-fundamentals---part-3-processes-services--networking)

---

## Linux Fundamentals — Part 1 (Basics & Shell)

### What is Linux?
- Kernel + userland tools = an operating system often used on servers and in security labs.
- Distributions (Ubuntu, Debian, Fedora, etc.) package kernel + utilities.

### Logging in & shells
- `ssh user@host` — connect to remote machines. Bandit uses SSH.
- Shells: `bash` (common), `sh`, `zsh`.
- Prompt basics: type commands, press Enter.

### Basic filesystem concepts
- Root of filesystem: `/`
- Important directories:
  - `/home` — users' home directories
  - `/etc` — system configuration
  - `/var` — variable data like logs
  - `/usr` — user programs & libraries
  - `/tmp` — temp files

### Navigation basics
- `pwd` — print current directory
- `ls` / `ls -la` — list files (hidden with `-a`)
- `cd /path` — change directory
- `mkdir`, `rmdir` — create / remove directories
- `cp`, `mv`, `rm` — copy, move, delete

### Viewing files
- `cat file` — print file
- `less file` — paginate through files
- `head -n 10 file`, `tail -n 10 file` — first/last lines
- `file filename` — detect file type (useful for binary vs text)

---

## Linux Fundamentals — Part 2 (Files, Permissions & Users)

### File types & hidden files
- Files beginning with `.` are hidden. `ls -a` shows them.
- `file` and `strings` help inspect binary files.

### Permissions model
- Owner, Group, Others — each with `r` (read), `w` (write), `x` (execute)
- `ls -l` shows permission bits: `-rwxr-xr--`
- Change permissions: `chmod`, e.g. `chmod +x script.sh`
- Change owner/group: `chown user:group file`

### Special file modes
- `sudo` to run commands as root (if allowed).
- Be cautious with `rm -r` (recursive delete) and `sudo rm -rf`.

### Searching files
- `find` — file discovery (by name, size, owner, type)
  - Examples:
    - `find / -type f -name "secret.txt" 2>/dev/null`
    - `find . -size 1033c` (size in bytes)
- `locate` — fast DB-backed search (may need `updatedb`)

### Searching inside files
- `grep "pattern" file` — find lines that match
- `grep -R "pattern" /path` — recursive search
- `wc -l file` — line count

---

## Linux Fundamentals — Part 3 (Processes, Services & Networking)

### Processes & job control
- `ps aux` / `ps -ef` — list processes
- `top` / `htop` — interactive process viewer
- `&` to background a job, `fg` to bring to foreground, `Ctrl-Z` to suspend
- `kill PID`, `kill -9 PID` — send signals

### Services (systemd)
- `systemctl start|stop|status service`
- `systemctl enable service` — run at boot

### Networking basics
- `ip a` or `ifconfig` — show network interfaces
- `ping host`, `traceroute host`
- `ss -tuln` or `netstat -tuln` — list listening ports
- `ssh user@host` to connect remotely

### File transfer
- `scp user@host:/path/file ./` — copy via SSH
- `wget URL` / `curl -O URL` — download files
- `python3 -m http.server 8000` — serve files over HTTP (quick transfer)

### Logs
- Logs commonly in `/var/log` (`syslog`, `auth.log`, `apache2/access.log`)


