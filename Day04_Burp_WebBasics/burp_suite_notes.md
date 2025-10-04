# Burp Suite Notes & Cheat Sheet 📚

This document summarizes the core concepts and tools in **Burp Suite (Community Edition)**, as studied in the TryHackMe module: **"Burp Suite"**. It covers theory, tool usage, and a real-world example attack.

---

## 🧠 Studied Topics (TryHackMe)
### 🔹 Task 2: What is Burp Suite?
Burp Suite is a graphical tool for testing web application security. It intercepts HTTP/S traffic between your browser and the target web server, allowing you to inspect and manipulate it.

### 🔹 Task 3: Features of Burp Community Edition
- Manual testing
- Proxy to intercept/modify traffic
- Repeater for replaying requests
- Intruder for brute-force/fuzzing
- Decoder, Comparer, Logger

No automation (Scanner, Intruder Speed) in Community version.

---

## 🧭 Task 6: Navigation in Burp Suite
Main tabs:
- **Dashboard**: Activity and alerts
- **Target**: Define scope and view site map
- **Proxy**: Intercept, view and forward traffic
- **Repeater**: Modify and resend requests
- **Intruder**: Automate payload injection
- **Decoder**: Encode/decode data
- **Comparer**: Diff responses

---

## ⚙️ Task 7: Options (Proxy Settings)
Configure request interception behavior, match/replace rules, logging. Allows fine-tuning of proxy actions and responses.

---

## 🌐 Task 8: Introduction to the Burp Proxy
Set your browser to route HTTP/HTTPS traffic through Burp:
- Proxy: `127.0.0.1:8080`
- Visit: http://burp to install and trust Burp CA Certificate
- Browser then securely routes traffic through Burp

---

## 🧪 Task 11: The Burp Suite Browser
Built-in Chromium browser already configured to work with Burp. Avoids certificate issues and helps with TLS interception.

---

## 🎯 Task 12: Scoping and Targeting
Use scope settings to:
- Define which hosts/domains you want to test
- Filter out irrelevant traffic
- Stay organized and avoid legal issues

---

## 🗺️ Task 13: Site Map and Issue Definitions
The **Site Map** tab helps track all visited pages/resources. Right-click on items to send them to other tools (Repeater, Intruder). Issue definitions describe potential vulnerabilities detected (in Pro version).

---

## 💥 Task 14: Example Attack — XSS Injection (Manual)
**Scenario**: Target web app has a contact form with an email input field.

**Steps:**
1. Configure browser proxy through Burp (127.0.0.1:8080).
2. Visit the `/contact` page in browser and fill the form.
3. Burp intercepts the request (Intercept ON).
4. Modify the email field:
   ```
   <script>alert('XSS')</script>
   ```
5. Forward the request.
6. Observe a successful XSS popup when the page loads or response renders the script.

**Impact**: Demonstrates that user input is improperly sanitized and reflected in HTML.

---

## ✅ Cheatsheet Summary

| Tool     | Use Case                                |
|----------|------------------------------------------|
| Proxy    | Intercept, view, and modify requests     |
| Repeater | Manual testing and fuzzing               |
| Intruder | Automate attacks (limited in Community)  |
| Decoder  | Encode/decode (Base64, Hex, etc.)        |
| Comparer | Diff responses for subtle differences     |

**Tip**: Always document input, expected output, and server behavior. Save intercepted requests for reporting.

---

🔐 **Ethical Reminder**: Use Burp Suite only on systems you are authorized to test.