# Burp Suite Detailed Notes

## 1. Installation
- Download Burp Suite (Community Edition): https://portswigger.net/burp/communitydownload
- Make sure Java is installed: `sudo apt install default-jre`

## 2. Setting up Proxy
- Set browser proxy: 127.0.0.1:8080
- Visit http://burp in browser
- Download and install CA certificate for HTTPS interception

## 3. Using Burp Suite Tools

### Proxy
Intercepts browser traffic. Can modify requests on-the-fly.

### Repeater
Used for manual testing of requests.
- Right-click → Send to Repeater
- Modify parameters, headers, etc.

### Intruder
Brute-force testing (e.g. login forms)
- Set target and payload positions
- Add payloads (e.g., password list)
- Start attack

### Decoder
Decode/encode data:
- Base64
- URL encoding
- HTML encoding

### Comparer
Compare 2 responses:
- E.g., successful login vs failed login response

## 4. Manual Brute-Force Example (Login)
1. Intercept login request with Proxy
2. Send to Repeater
3. Modify username/password fields
4. Observe status code / response length

Example Request:
```
POST /login HTTP/1.1
Host: vulnerable.com
Content-Type: application/x-www-form-urlencoded

username=admin&password=admin123
```

## 5. Notes & Reporting
- Save requests/responses as `.txt`
- Note status code, response time, length
- Good practice: log every manual test you do