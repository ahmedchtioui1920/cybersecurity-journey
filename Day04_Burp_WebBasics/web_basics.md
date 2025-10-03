# Web Basics – Foundations for Pentesters

## 1. HTTP Request & Response

### 📤 HTTP Request Example (GET)
```
GET /login HTTP/1.1
Host: example.com
User-Agent: Mozilla/5.0
Cookie: sessionid=1234
```

### 📥 HTTP Response Example
```
HTTP/1.1 200 OK
Content-Type: text/html
Set-Cookie: sessionid=5678; HttpOnly
```

- **Request**: Sent by browser/client to the server
- **Response**: Server replies with status, headers, and HTML content

## 2. HTTP Methods
| Method | Use                      |
|--------|--------------------------|
| GET    | Retrieve data (idempotent)|
| POST   | Submit data              |
| PUT    | Update resource          |
| DELETE | Delete resource          |

## 3. URL Structure
```
https://example.com:443/products?id=5&category=books
|   |        |      |         |
|   |        |      |         └── Query String
|   |        |      └──────────── Path
|   |        └────────────────── Domain
|   └─────────────────────────── Protocol
```

## 4. Cookies & Sessions
- Cookies store session or tracking info in the browser.
- Example:
```
Set-Cookie: sessionid=abc123; Secure; HttpOnly
```

**HttpOnly** → Can't be accessed via JS. Helps protect against XSS.  
**Secure** → Only sent over HTTPS.

## 5. HTML Forms (Login Example)
```html
<form method="POST" action="/login">
  <input type="text" name="username" />
  <input type="password" name="password" />
  <input type="submit" value="Login" />
</form>
```

This sends data to `/login` using POST — visible in Burp.