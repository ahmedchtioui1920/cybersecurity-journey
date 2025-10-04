# Web Basics

## HTTP Protocol
- **HTTP Methods**:
  - GET: Retrieve data
  - POST: Submit data
  - PUT: Update data
  - DELETE: Remove data

- **Status Codes**:
  - 200 OK: Success
  - 301 Moved Permanently: Redirection
  - 403 Forbidden: Access denied
  - 404 Not Found: Resource missing
  - 500 Internal Server Error: Server crashed

## Cookies and Sessions
- **Cookies** store data in the browser (e.g., login tokens)
- **Sessions** are server-side stored, referenced via session cookies

## HTML Forms
Used for user input. Typical login form:
```html
<form action="/login" method="POST">
  <input name="username" type="text">
  <input name="password" type="password">
</form>
```

## HTTP Headers
Example:
```
GET / HTTP/1.1
Host: example.com
User-Agent: Firefox
Cookie: sessionid=abc123
```