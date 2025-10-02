## `bash_cheatsheet.md`

```markdown
# Bash Cheatsheet — Common commands & examples

## Getting started

- `whoami` — current user
- `pwd` — current directory
- `ls -la` — list files (including hidden) with details
- `cd /path/to/dir` — change directory

## Create & view files

- `echo "text" > file` — create/overwrite
- `echo "more" >> file` — append
- `cat file` — view file contents
- `less file` — view file (with paging)

## Searching

- `find /start -name "*.txt"` — find files by name
- `grep "pattern" file` — search inside files
- `grep -R "pattern" /path` — recursive search

## Permissions

- `chmod +x script.sh` — make executable
- `chown user:group file` — change owner & group
- `ls -l` — view permissions

## Redirects & pipes

- `cmd > out.txt` — redirect stdout
- `cmd 2> err.txt` — redirect stderr
- `cmd > out.txt 2>&1` — redirect both
- `cmd1 | cmd2` — pipe output of cmd1 into cmd2

## Compression & archives

- `tar -czvf archive.tar.gz dir/` — create gzipped tar
- `tar -xzvf archive.tar.gz` — extract gzipped tar
- `gzip file` / `gunzip file.gz`
- `bzip2` / `bunzip2`

## Networking & transfer

- `ssh user@host` — connect via SSH
- `scp file user@host:/path/` — secure copy
- `wget url` — download file
- `python -m http.server` — serve files over HTTP

## Processes

- `ps aux | grep process_name`
- `top` — interactive process viewer
- `kill <PID>` / `kill -9 <PID>`

## Handy tips

- Use `man command` for full manual pages.
- `--help` usually shows short usage.
- Tab-completion and up/down arrows speed up navigation.
```
