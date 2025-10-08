# Bash Scripting Basics for Cybersecurity

## 🖥️ What is Bash?
Bash is a Unix shell and command language used for automating tasks and running commands. It's widely used in Linux environments, especially for cybersecurity and DevOps.

## 🔰 Shebang
```bash
#!/bin/bash
```
This line tells the system that the script should be run with the Bash shell.

## 🔧 Variables and Input
```bash
name="Pentester"
echo "Welcome, $name"

read -p "Enter a target IP: " ip
echo "Scanning $ip..."
```

## 🔁 Loops
```bash
for ip in $(cat targets.txt); do
  echo "Scanning $ip"
  nmap -sV $ip
done
```

## 🔐 Conditionals
```bash
if [ -f report.txt ]; then
  echo "Report exists."
else
  echo "No report found."
fi
```

## 📜 Permissions
Make the script executable:
```bash
chmod +x script.sh
```