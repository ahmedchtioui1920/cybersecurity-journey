Intercept and Modify Example Tasks:

1. Intercept a GET request (e.g., /profile?id=5)
   → Modify ID to 1, forward request

2. Submit login form
   → Modify password field in Repeater, repeat until 200 OK

3. Add XSS payload in search field
   → <script>alert(1)</script>

4. Use Decoder to base64-decode string: ZGVmYXVsdA==

5. Use Comparer:
   → Compare login success and fail responses
=======
1. Login to a test site, capture the request
2. Modify username or password in Repeater
3. Intercept GET requests and change parameters
4. Add a custom cookie to your request
5. Remove headers like User-Agent — observe behavior
6. Try injecting this in a search field:
   <script>alert(1)</script>
7. Use Decoder to base64 encode your name, then decode it back

