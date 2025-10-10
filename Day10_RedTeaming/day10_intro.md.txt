# Day 10 — Red Teaming Intro (Concise)

This document gives a compact introduction to Red Teaming covering points 1 → 7: core definition, roles, lifecycle, key concepts, technique categories, tool categories (conceptual), and reporting/value. Use this as the short authoritative intro for the Day 10 module.

---

## 1. What is Red Teaming?
Red Teaming is adversary emulation: realistic, goal-oriented offensive activities designed to test an organization’s detection, response and resilience. It differs from vulnerability scanning by focusing on end-to-end attack scenarios, stealth, and operational objectives rather than isolated findings.

---

## 2. Roles & Relationships
- **Red Team:** offensive operators who emulate attackers to expose gaps in defenses.  
- **Blue Team:** defenders who detect, respond to, and remediate incidents.  
- **Purple Team:** a collaborative mode where Red and Blue share learnings to tighten controls.  
Core mindset: think like an adversary, preserve stealth, and document every action.

---

## 3. Simplified Lifecycle (Kill Chain)
A practical kill-chain to map actions:
1. **Reconnaissance** — gather public + internal intelligence.  
2. **Initial Access** — gain a foothold (credential abuse, exposed apps, social engineering).  
3. **Execution** — run code or commands on a compromised host.  
4. **Persistence** — establish mechanisms to survive reboots and detection.  
5. **Privilege Escalation** — obtain higher privileges (local or domain admin).  
6. **Lateral Movement** — move through the network to reach targets.  
7. **Actions on Objective** — exfiltrate data, achieve the mission, or demonstrate impact.  
After these: **Cleanup & Reporting** (document findings and recommend mitigations).

---

## 4. Key Concepts to Internalize
- **Adversary Emulation:** model a real-world threat using TTPs (tactics, techniques, procedures).  
- **Stealth & Persistence:** balance objective achievement with minimizing detection.  
- **Rules of Engagement (ROE):** legal and operational boundaries that constrain Red Team activity.  
- **Detection vs Prevention:** Red Team finds weaknesses; Blue Team converts those into detections and fixes.  
- **MITRE ATT&CK Mapping:** use ATT&CK IDs to describe techniques clearly and consistently.

---

## 5. Typical Technique Categories (high level)
- **Reconnaissance:** public records, DNS, certificate transparency, OSINT.  
- **Credential Access:** password reuse, leaked credentials, social engineering.  
- **Exploitation:** leveraging vulnerable services or misconfigurations to run code.  
- **Command & Control (C2):** covert channels that allow remote control of compromised hosts.  
- **Privilege Escalation:** local misconfigurations, vulnerable services, token manipulation.  
- **Lateral Movement:** remote execution, trust abuse, AD exploitation in enterprise environments.  
- **Exfiltration:** stealthy extraction of data via encrypted or covert channels.

---

## 6. Tool Categories (conceptual)
(These categories describe tool purpose — not a how-to list.)
- **Recon/OSINT tools** — discover assets and public information.  
- **Scanning/Fingerprinting tools** — identify open services and versions.  
- **Exploitation/payload frameworks** — craft and deliver test payloads in lab/authorized contexts.  
- **Post-exploitation & C2 frameworks** — maintain access and orchestrate actions.  
- **Directory/AD analysis tools** — map enterprise attack paths (e.g., for Active Directory).  
Note: use only in authorized labs or engagements.

---

## 7. Reporting & Value
A Red Team deliverable must be actionable:
- **What happened:** timeline of the engagement.  
- **How it happened:** clear attack path(s) and techniques used (map to MITRE ATT&CK where possible).  
- **Impact:** what an adversary could do with the access.  
- **Remediation:** prioritized, practical fixes and detection suggestions.  
Good reports close the loop — they help defenders implement measurable improvements.

---

**Legal Reminder:** Red Team activities must be performed only with explicit permission and clear rules of engagement. This document is for learning and authorized practice only.
