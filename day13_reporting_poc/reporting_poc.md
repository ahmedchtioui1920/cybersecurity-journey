# Day 13 — Reporting & Proof of Concept (PoC) for Pentesting

This document covers best practices for **reporting** penetration testing findings and producing safe, clear **Proofs of Concept (PoC)**. It is designed to help you document vulnerabilities professionally so defenders can reproduce, understand, and fix issues quickly.

---

## 1. Purpose of a Pentest Report
A pentest report translates technical findings into actionable information for stakeholders. It should:
- Communicate impact and risk clearly.
- Provide reproducible evidence (PoC) without causing harm.
- Prioritize remediation steps.
- Map findings to standards (e.g., CVSS, MITRE ATT&CK) when possible.

---

## 2. Report Structure (Recommended Sections)
1. **Title Page** – engagement name, client, date, scope, authors.  
2. **Executive Summary** – non-technical overview: key findings, business impact, high-level recommendations. Keep it short (1 page).  
3. **Scope & Methodology** – what was tested, excluded assets, test types (black/gray/white box), tools used, rules of engagement.  
4. **Findings** – one finding per subsection with clear headings. Each finding should include:  
   - Title & Identifier (e.g., FIND-001)  
   - Affected assets (IP, hostname, URL)  
   - Severity/risk rating (e.g., CVSS v3 score or custom)  
   - Summary (1–2 sentences)  
   - Impact (what an attacker could do)  
   - Proof of Concept (safe, reproducible steps)  
   - Remediation (practical, prioritized fixes)  
   - References & detection suggestions (logs, IDS rules)  
5. **Appendices** – raw data, tool outputs, credentials used (if test accounts), glossary, mapping to MITRE ATT&CK.

---

## 3. Writing Clear Proofs of Concept (PoC)
PoCs show **how** an issue can be reproduced. They must be:
- **Reproducible** in a controlled lab or the tested environment.  
- **Non-destructive**: avoid actions that alter or damage systems. Use read-only checks when possible.  
- **Minimal**: include only steps needed to demonstrate the issue, not exploitation guidance.
- **Sanitized**: redact sensitive info, avoid actual exfiltration in the report.

### PoC Components
- **Preconditions**: any required setup (test account, request headers).  
- **Steps to reproduce**: numbered commands or actions the reader can run.  
- **Observed result**: exact output, status codes, screenshots, or log snippets.  
- **Expected result**: what should have happened if the vulnerability did not exist.  
- **Impact statement**: brief explanation of security implications.

---

## 4. Example PoC (Safe & Non-destructive)

**Finding**: Reflected input displayed in response page (Potential XSS - low impact demonstration)

**Preconditions**: Access to test URL in lab environment: `http://lab.example.local/search?q=`

**Steps to reproduce** (do these in a lab environment only):
1. Open a browser and navigate to: `http://lab.example.local/search?q=test`  
2. Observe the search term is echoed on the page.  
3. As a safe demonstration, request the URL with a benign test string that includes special characters:  
   ```
   GET /search?q=<test-input> HTTP/1.1
   Host: lab.example.local
   ```
4. Observe response body contains the echoed input without encoding: e.g., `You searched for: <test-input>`

**Observed result**: The page reflects the input literally in the HTML. (Include screenshot of response or HTML snippet.)

**Expected result**: User-supplied content should be properly encoded/escaped before rendering.

**Impact**: If unescaped, this could allow script injection in contexts that interpret HTML/JS. In this lab example no actual exploit payload was used.

**Remediation**: Apply proper output encoding and use context-aware escaping (e.g., HTML encode values inserted into page content).

---

## 5. Screenshots, Logs, and Evidence Handling
- Use screenshots to show UI issues, but crop/redact sensitive data.  
- Include raw HTTP request/response snippets when helpful; redact tokens, API keys, or personal data.  
- Attach logs or tool outputs as appendices rather than inline to keep report concise.  
- Timestamp all evidence and include a note about the timezone used in the report.

---

## 6. Severity & Risk Ratings (Practical Guidance)
- Use CVSS v3 for consistency, or a simple High/Medium/Low classification.  
- Consider: ease of exploitability, required privileges, user interaction, and potential impact.  
- Document assumptions (e.g., “assumes unauthenticated access” or “requires authenticated user”) that affect severity.

---

## 7. Mapping to MITRE ATT&CK and Detection Suggestions
- Map techniques to MITRE ATT&CK IDs for clarity (e.g., T1059 - Command and Scripting Interpreter).  
- Provide detection suggestions: log sources, indicators of compromise, or SIEM rules that could alert on the behavior demonstrated by the PoC.

---

## 8. Reproducibility Checklist (for each finding)
- [ ] Preconditions documented and minimal.  
- [ ] Steps are numbered and deterministic.  
- [ ] Expected vs observed outputs shown.  
- [ ] Evidence included (screenshot, curl output, logs).  
- [ ] Remediation steps are actionable.  
- [ ] Sensitivity review completed (no secrets leaked).

---

## 9. PoC Templates (Markdown snippets to paste into reports)

**PoC Header (template)**
```
**Finding ID:** FIND-XXX
**Title:** Short descriptive title
**Affected Asset(s):** hostname / IP / URL
**Severity:** High / Medium / Low (CVSS: x.x)
**Preconditions:** What is required to reproduce
**Steps to reproduce:** Numbered steps
**Observed result:** Exact output / screenshot reference
**Expected result:** What should occur normally
**Impact:** Short impact description
**Remediation:** Practical steps to fix
**References:** Links to CVE, OWASP, MITRE ATT&CK
```

**HTTP Request/Response snippet (example)**
```
GET /search?q=test HTTP/1.1
Host: lab.example.local

HTTP/1.1 200 OK
Content-Type: text/html; charset=utf-8

<html>...You searched for: test...</html>
```

---

## 10. Legal & Ethical Considerations for Reporting
- Always follow the rules of engagement (ROE). Include them in the scope section.  
- Share sensitive findings securely (encrypted email, secure portal).  
- Coordinate disclosure timelines with stakeholders — don’t publish sensitive PoCs publicly until the issue is fixed unless part of an agreed disclosure plan.

---

## 11. Appendix: Quick Report Checklist (one-page)
- Title, date, authors, scope ✔️  
- Executive summary (1 paragraph) ✔️  
- Each finding: ID, Asset, Severity, PoC, Remediation ✔️  
- Evidence attached and redacted where necessary ✔️  
- MITRE ATT&CK mapping & detection suggestions ✔️  
- Signed ROE / permission proof in appendices ✔️

---

**Reminder:** This document focuses on producing safe, clear, and actionable reports. Always use PoCs responsibly and avoid providing destructive exploit code in reports intended for general audiences.
