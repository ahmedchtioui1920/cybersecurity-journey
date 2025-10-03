# Common Web Vulnerabilities (Intro)

## 1. XSS (Cross-Site Scripting)
Inject JS into a web page.

Example payload:
```html
<script>alert('XSS')</script>
```

Test: Inject into comment fields or search bars. If it pops, XSS is likely.

## 2. SQL Injection
Insert SQL into a query parameter.

Example:
```
?id=1' OR '1'='1
```

Try `'`, `--`, or `' OR 1=1 --` in form fields or URLs.

## 3. IDOR (Insecure Direct Object Reference)
Changing IDs in the URL gives access to others’ data.

Example:
```
/profile/123 → change to /profile/122
```

## 4. Auth Bypass
- Try: Blank passwords, SQLi, missing token headers, etc.

## 5. File Upload Issues
Upload `.php`, `.html` disguised as `.jpg`. Then access it via URL.