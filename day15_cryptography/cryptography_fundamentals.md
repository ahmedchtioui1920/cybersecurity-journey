
# 🧩 Day 15 — Cryptography Fundamentals

## 1. Introduction
Cryptography is the science of protecting information by transforming it into unreadable form for unauthorized users.  
Main goals are **Confidentiality, Integrity, Authentication,** and **Non-repudiation.**

---

## 2. Types of Cryptography
### 🔸 Symmetric Encryption
- Uses the **same key** for encryption and decryption.
- Faster but requires secure key sharing.
- Examples: **AES, DES, ChaCha20**

#### Example (AES with OpenSSL)
```bash
echo "secret message" > msg.txt
openssl enc -aes-256-cbc -salt -in msg.txt -out msg.enc
openssl enc -aes-256-cbc -d -in msg.enc -out msg_dec.txt
cat msg_dec.txt
```

### 🔸 Asymmetric Encryption
- Uses **public key** to encrypt and **private key** to decrypt.
- Slower but solves the key sharing problem.
- Examples: **RSA, ECC**

#### Example (RSA Key Generation)
```bash
openssl genrsa -out private.pem 2048
openssl rsa -in private.pem -pubout -out public.pem
```

---

## 3. Hashing
- Converts any data into a fixed-length string.
- One-way function — cannot be reversed.
- Used for password storage and file integrity.

#### Example (SHA256)
```bash
echo "mypassword" | sha256sum
```

Common algorithms: **MD5, SHA1, SHA256, bcrypt, Argon2**

---

## 4. Digital Signatures
- Verifies authenticity and integrity of a message.
- Sender signs with **private key**, receiver verifies with **public key.**

#### Example
```bash
openssl dgst -sha256 -sign private.pem -out sign.bin msg.txt
openssl dgst -sha256 -verify public.pem -signature sign.bin msg.txt
```

---

## 5. Encoding vs Encryption vs Hashing
| Concept | Reversible | Key Needed | Purpose |
|----------|-------------|-------------|----------|
| Encoding | ✅ Yes | ❌ No | Data formatting |
| Encryption | ✅ Yes | ✅ Yes | Data protection |
| Hashing | ❌ No | ❌ No | Integrity checking |

---

## 6. Practice Tasks
1. Encrypt and decrypt your own text using AES and RSA.  
2. Hash a password using SHA256 and bcrypt.  
3. Create a small "signature verification" example using OpenSSL.  

---

## 7. Summary
- Symmetric = Fast, single key  
- Asymmetric = Secure, key pair  
- Hashing = One-way integrity check  
- Signatures = Verification of authenticity  

**✅ Mastering these fundamentals builds the foundation for network security, digital certificates, and secure communication.**
