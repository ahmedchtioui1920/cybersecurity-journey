# 🗃️ Metasploit Database & Host Management

Metasploit has a built-in database that stores results of scans, services, credentials, and hosts for efficient re-use.

## Starting the Database
It usually starts with Metasploit automatically. If not:
```bash
msfdb start
```

## Key Concepts

### Hosts
Target machines discovered during scans.

### Services
Ports/services detected (e.g., SSH, SMB, HTTP).

### Workspaces
Separate environments to organize findings (e.g., by target org or subnet).
```bash
workspace -a test_lab
workspace test_lab
```

### Storing Results
Once you scan or exploit something, it is saved to the DB:
```bash
hosts
services
creds
```

This makes it easy to track progress and create reports.