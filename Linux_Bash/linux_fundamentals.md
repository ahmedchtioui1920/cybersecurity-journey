
# Linux Fundamentals — Notes (Day 01)

**Source:** These notes are adapted from TryHackMe's "Linux Fundamentals" pathway and hands-on Bandit exercises (basic navigation, find/grep, file types, and operators).

This document contains my Day 1 notes: commands, filesystem navigation, find/grep, operators, hidden files, permissions, editors, file transfer, processes, package management, and logs.

## Quick commands

| Command | Description |
|---|---|
| `echo` | Output text to the terminal |
| `whoami` | Show the current user |
| `pwd` | Print working directory |
| `ls` | List directory contents |
| `cd` | Change directory |
| `cat` | Concatenate and print files |
| `find` | Search for files and directories |
| `grep` | Search inside files for patterns |
| `wc -l` | Count lines (useful for logs) |

### Examples

```bash
# echo examples
echo Hello
echo "Hello Friend!"

# whoami
whoami

# find by name
find -name passwords.txt

# find using wildcard
find -name "*.txt"

# count lines in a log
wc -l access.log

# search within a file
grep "81.143.211.90" access.log
```

## Shell operators

| Operator | Meaning |
|---|---|
| `&` | Run command in background |
| `&&` | Run next command only if previous succeeded |
| `>` | Redirect output to file (overwrite) |
| `>>` | Redirect output to file (append) |

### Notes & examples

- `echo hey > welcome`  # creates/overwrites file `welcome` with "hey"
- `echo hello >> welcome`  # appends "hello" to `welcome`
- Backgrounding: `long_task &`
- Chaining: `cmd1 && cmd2`

## Hidden files and help

- Use `ls -a` or `ls --all` to show hidden files (files starting with `.`).
- Use `--help` or `man <command>` to view usage and manual pages.

## Permissions (basic)

- Permission bits: `r`=read, `w`=write, `x`=execute.
- `ls -l` shows owner, group, and permissions.
- To remove a directory and its contents: `rm -r <dir>` (or `rm -R <dir>`).

## Common directories

- `/etc` — system configuration files
- `/var` — variable data (logs, databases)
- `/root` — root user's home
- `/tmp` — temporary files

## Editors

- `nano` — beginner-friendly terminal text editor
- `vim` — powerful editor (steeper learning curve)

## Useful utilities

- `wget` — download files from the internet
- `scp` — securely copy files between hosts (e.g. `scp user@host:/path/file ./`)
- `python -m http.server` — serve current directory over HTTP for quick file transfer

## Processes

- `ps aux` / `ps -ef` — list processes
- `top` / `htop` — interactive process viewer
- `kill <PID>` — send SIGTERM (or `kill -9 <PID>` for SIGKILL)
- Background/foreground control with `&`, `fg`, `bg`, and `Ctrl-Z`/`Ctrl-C`

## Services & systemctl (brief)

- `systemctl start|stop|enable|disable <service>` — manage services on systemd systems

## Automation

- `crontab -e` — edit cron jobs
- Cron time fields: `MIN HOUR DOM MON DOW CMD`

## Packages & logs

- `apt`, `dpkg` (Debian/Ubuntu) for package management
- Logs mostly under `/var/log` (e.g. `apache2/access.log`)

---

_End of Day 01 notes_
```



