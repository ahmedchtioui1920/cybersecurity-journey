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
