# Day 13 — PoC Practice: Public Directory Listing (Beginner)

This practice file walks you step-by-step through **safe**, **read-only** actions to discover and document a public directory listing on a web server in a lab environment, and then produce a completed PoC report entry.
## Overview
Goal: Find whether a target web server exposes a directory listing and document the finding into a beginner-friendly PoC. This exercise is entirely non-destructive and focuses on reconnaissance and documentation skills.

**Target (lab example):** `http://lab.example.local/`

---

## Setup 
1. Used an online lab instance (TryHackMe box). Ensure the target `lab.example.local` resolves in your lab environment.
2. Have basic CLI tools installed on your tester VM: `curl`, `sed`, `mkdir`, `scrot` (for screenshots) or use your OS screenshot tool.
3. Create a workspace folder to store evidence and notes:
```bash
mkdir -p ~/poc_practice/day13_evidence
cd ~/poc_practice
```

---

## Step 1 — Confirm target is reachable (Read-only)
Run a simple HTTP HEAD request to check the server response headers.
```bash
curl -s -I http://lab.example.local/ > evidence/FIND-001-curl-headers.txt
cat evidence/FIND-001-curl-headers.txt
```
**What to look for:** `HTTP/1.1 200 OK` or other 2xx codes. Note server header values (`Server:`, `Content-Type:`) if present.

Save the output file `evidence/FIND-001-curl-headers.txt` in your evidence folder.

---

## Step 2 — Fetch page body (Read-only)
Retrieve the page body to inspect whether a directory listing is shown.
```bash
curl -s http://lab.example.local/ | sed -n '1,200p' > evidence/FIND-001-body-snippet.txt
sed -n '1,40p' evidence/FIND-001-body-snippet.txt
```
**What to look for:** Look for phrases like `Index of /`, `Parent Directory`, or an HTML table listing file names. Save the snippet file created above.

---

## Step 3 — Take a screenshot (Optional but helpful)
Open the URL in a browser inside your lab or use a CLI screenshot tool to capture the view. Save it as `evidence/FIND-001-directory-listing.png`.
If using a GUI browser, take a screenshot and move it to the evidence folder. If using CLI tools (e.g., `scrot`):
```bash
# open browser manually, then run scrot to capture the screen
scrot ~/poc_practice/day13_evidence/FIND-001-directory-listing.png
```

> If you cannot take screenshots, you can rely on the `body-snippet` text as primary evidence.

---

## Step 4 — Verify non-destructiveness (Ensure read-only steps)
Confirm you did not download or modify any files. The commands above only requested content and stored outputs locally. Do **not** run `wget` to recursively download or attempt to access files beyond simple viewing unless you have explicit permission.

---

## Step 5 — Capture minimal metadata (timestamp & requester)
Create a small metadata file describing the test context:
```bash
cat > evidence/FIND-001-metadata.txt <<'MD'
Target: http://lab.example.local/
Tester: Your Name (lab account)
Date: $(date -u +"%Y-%m-%d %H:%M:%SZ") UTC
Actions: curl HEAD, curl GET (first 200 lines), screenshot
Notes: Read-only verification of directory listing; no downloads attempted.
MD
```

---

## Step 6 — Write the PoC (Beginner-friendly)
Create the PoC markdown `FIND-001-poc.md` in your workspace with the following content (this is a template you can paste into your report):

```markdown
**Finding ID:** FIND-001
**Title:** Public Directory Listing Enabled on Web Server
**Affected Asset(s):** http://lab.example.local/
**Severity:** Low (CVSS: 3.3)
**MITRE ATT&CK Mapping:** Discovery — T1083 (File and Directory Discovery)

### Preconditions
- Test conducted in lab environment `lab.example.local`.
- HTTP (port 80) reachable from tester VM.

### Steps to reproduce (read-only)
1. `curl -s -I http://lab.example.local/`  (saved to evidence/FIND-001-curl-headers.txt)
2. `curl -s http://lab.example.local/ | sed -n '1,200p'`  (saved to evidence/FIND-001-body-snippet.txt)
3. Open `http://lab.example.local/` in a browser and observe directory listing (screenshot saved as evidence/FIND-001-directory-listing.png)

### Observed result
The web server returns HTTP 200 and displays a directory listing containing filenames such as `backup.tar.gz`, `config.yml`, `logs/`, and `secrets/` (see evidence files). No files were downloaded or modified.

### Expected result
The server should not list directory contents. It should return 403 or serve a default index page without revealing file names.

### Impact
Information disclosure that can aid further targeting and discovery. The presence of names like `secrets/` increases risk and warrants further investigation in controlled conditions.

### Remediation
- Disable directory indexing (Apache: `Options -Indexes`; Nginx: `autoindex off;`)
- Move backups and sensitive files outside the web root or protect with authentication
- Review deployment process to prevent accidental exposure

### Evidence
- evidence/FIND-001-curl-headers.txt
- evidence/FIND-001-body-snippet.txt
- evidence/FIND-001-directory-listing.png
- evidence/FIND-001-metadata.txt
```

Save the PoC file in your workspace as `FIND-001-poc.md`.

---

## Step 7 — Produce final report snippet (one file)
Create `final_report_snippet.md` combining the PoC and a one-paragraph executive summary for non-technical readers. Keep it concise and paste-ready for your report.

---

## Final Notes & Teaching Points
- This exercise emphasizes careful, documented, and **non-destructive** verification steps and how to present findings.  
- Always include timestamps and proof of permission in your final report.  
- This workflow is suitable for beginners learning reporting discipline; it avoids exploitation and focuses on clarity and reproducibility.


