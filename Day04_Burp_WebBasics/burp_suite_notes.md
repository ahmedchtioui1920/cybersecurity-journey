# Burp Suite Basics

## 1. Install Burp Suite (Community)
- Go to: https://portswigger.net/burp/communitydownload
- Install Java if missing (`sudo apt install default-jre`)

## 2. Setup Your Browser to Use Burp Proxy
- Set manual proxy to: `127.0.0.1:8080`
- Install Burp CA Certificate:
  - Visit http://burp in your browser → download cert
  - Add it to browser trusted certs

## 3. Intercepting Requests

### Steps:
1. Turn "Intercept ON"
2. Visit a site in browser (e.g., http://example.com)
3. Burp will pause the request — view/edit it

### Modify Example:
Change GET /profile?id=123 to id=1 → send it

## 4. Tools Overview

### 🔹 Proxy
Intercept & modify traffic

### 🔹 Repeater
Send and tweak requests manually

### 🔹 Intruder
Brute force login fields, test for fuzzing (e.g., user enumeration)

### 🔹 Decoder
Decode hex, base64, URL encoding

### 🔹 Comparer
Compare two responses (e.g., success vs fail)

## 5. Real Use Case: Login Brute Force (Manual)
1. Intercept login request → Send to Repeater
2. Modify username/password repeatedly
3. Observe response differences (status, content length)

## 6. Best Practice
- Take notes of each test: input, result, response code
- Save raw requests/responses if needed for reports