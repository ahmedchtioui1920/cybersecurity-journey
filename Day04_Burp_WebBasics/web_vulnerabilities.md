# Web Vulnerabilities Overview

## XSS (Cross-Site Scripting)
Inject JS code into site to steal cookies, deface UI.
Example:
```html
<script>alert('XSS')</script>
```

## SQL Injection
Inject SQL to access data.
Example:
```sql
' OR 1=1 --
```

## IDOR (Insecure Direct Object Reference)
Accessing unauthorized data by modifying URL/object ID.

## Broken Authentication
Weak login or session handling.

## CSRF
Force user to send unintended requests.