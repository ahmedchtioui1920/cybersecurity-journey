# Web Basics – Reformulated Notes

## Web Application Overview
Web applications are software programs that run in a web browser. They interact with users via the internet using web protocols, most notably HTTP and HTTPS.

## Uniform Resource Locator (URL)
A URL is the address used to access resources on the internet. It includes the protocol (http/https), domain name, optional port, path, and query parameters.
Example: `https://example.com:443/products?id=5`

## HTTP Messages
Communication between a client (browser) and a server happens through HTTP messages. There are two types: requests and responses.

## HTTP Request: Request Line and Methods
The request line includes the method (e.g., GET, POST), the path of the resource, and the HTTP version.
Example: `GET /index.html HTTP/1.1`

Common methods:
- **GET**: Retrieve data
- **POST**: Submit data to be processed
- **PUT**: Update a resource
- **DELETE**: Remove a resource

## HTTP Request: Headers and Body
Headers provide metadata about the request (e.g., content type, user agent). The body contains data (mainly used in POST/PUT requests).
Example headers:
```
Host: example.com
User-Agent: Mozilla/5.0
Content-Type: application/json
```

## HTTP Response: Status Line and Status Codes
The status line includes the HTTP version, a status code, and a reason phrase.
Example: `HTTP/1.1 200 OK`

Common status codes:
- **200 OK**: Success
- **301 Moved Permanently**: Redirection
- **404 Not Found**: Resource missing
- **500 Internal Server Error**: Server crashed

## HTTP Response: Headers and Body
Response headers describe server metadata or content. The body contains the content returned (e.g., HTML, JSON, files).
Example headers:
```
Content-Type: text/html
Content-Length: 1024
```

## Security Headers
Security headers help protect web applications from common attacks.
- **Content-Security-Policy**: Prevents XSS attacks by controlling resources the user agent is allowed to load.
- **X-Content-Type-Options**: Prevents MIME-sniffing attacks.
- **X-Frame-Options**: Prevents clickjacking by controlling whether the site can be loaded in frames.