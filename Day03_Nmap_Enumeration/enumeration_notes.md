# Enumeration Notes - Service-by-Service Guide

After identifying open ports with Nmap, manual enumeration drills into each service to reveal useful attack vectors, credentials, misconfigurations or sensitive files.

---

## General Techniques

- **Banner grabbing** with `nc` / `telnet`:
  ```bash
  nc <ip> <port>
  telnet <ip> <port>
  ```
  Look at the first lines returned — they frequently include software/version.

- **HTTP inspection**:
  ```bash
  curl -I http://<ip>
  curl http://<ip>/robots.txt
  ```
  Check headers, cookies, robots.txt, sitemap, default pages.

- **Save outputs** — always redirect to files for reporting:
  ```bash
  nmap -sV -oN nmap_services.txt <ip>
  curl -I http://<ip> > http_headers.txt
  ```

---

## Service-Specific Commands & Examples

### FTP (port 21)
- Anonymous login:
  ```bash
  ftp <ip>
  # or
  nc <ip> 21
  ```
- Check for upload / writable directories after logging in.
- Look for backup files, scripts, credentials.

### SSH (port 22)
- Banner check:
  ```bash
  nc <ip> 22
  ```
- If weak credentials are suspected, use credential lists responsibly (in lab only):
  ```bash
  hydra -l root -P /usr/share/wordlists/rockyou.txt ssh://<ip>
  ```

### HTTP / Web (port 80/443)
- GET headers and content:
  ```bash
  curl -I http://<ip>
  curl http://<ip>/somepage
  ```
- Directory brute-force (lab only):
  ```bash
  gobuster dir -u http://<ip> -w /usr/share/wordlists/dirb/common.txt
  ```
- Test common vulnerabilities manually (e.g., reflected XSS, simple file inclusion) with crafted requests using `curl` or `nc`.

### SMB (ports 139/445)
- Enumerate shares:
  ```bash
  smbclient -L //<ip> -N
  ```
- Use `enum4linux` for a richer SMB enumeration:
  ```bash
  enum4linux -a <ip>
  ```

### DNS
- Check records:
  ```bash
  dig @8.8.8.8 <target> ANY
  nslookup <target>
  ```
- Zone transfers (if allowed):
  ```bash
  dig AXFR @<dns-server> <domain>
  ```

---

## Example Manual Enumeration Workflow (one host)

1. Run `nmap -sS -sV -oN scan.txt <ip>`
2. For each open port:
   - Banner grab (`nc <ip> <port>`)
   - If HTTP: `curl -I` + `gobuster dir`
   - If SMB: `smbclient -L //ip -N` + `enum4linux`
   - If FTP: try anonymous login
3. Record every command and output to separate files for reporting.
4. Prioritize findings by exploitability and data exposure.

---

## Documentation / Reporting Tips

- For each finding include:
  - **Title** (e.g., "Anonymous FTP allowed")
  - **Description** (what you observed)
  - **Evidence** (command + exact output or saved file)
  - **Impact** (why it matters)
  - **Recommendation** (how to fix)

- Keep concise logs: `nmap_results.txt`, `ftp_output.txt`, `http_headers.txt`, `smb_shares.txt`

---

## Safe Practice Reminder
Only run enumeration and exploitation against systems you are explicitly authorized to test. Use local VMs or platform labs (TryHackMe / HTB) for practice.
