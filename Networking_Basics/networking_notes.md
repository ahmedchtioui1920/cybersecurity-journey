# Networking Notes — TryHackMe Video Breakdown

This document summarizes key topics from the TryHackMe Networking Basics series using timestamps and task breakdowns.

---

## 📺 Video 1: Networking Introduction

**0:00:00 - Video Overview**  
**0:00:25 - Task 1: What is Networking?**  
- Communication between devices using protocols  
- LAN vs WAN  

**0:03:02 - Task 2: What is the Internet?**  
- A global network of networks  
- Uses TCP/IP stack  

**0:05:46 - Task 3: Identifying Devices on a Network**  
- IP addresses identify devices  
- MAC addresses at Layer 2  
- Hostname, IP, MAC demo via CLI  

**0:20:44 - Task 4: Ping (ICMP)**  
- ICMP protocol for checking connectivity  
- `ping`, `traceroute` command basics  

**0:23:12 - Task 5: Continue Your Learning: Intro to LAN**  

---

## 📺 Video 2: LAN & Subnetting

**0:00:00 - Video Overview**  
**0:00:18 - Task 1: Introducing LAN Topologies**  
- Star, Bus, Mesh topologies  
- Practical examples in homes and businesses  

**0:01:39 - Task 2: A Primer on Subnetting**  
- CIDR notation (e.g. /24)  
- Usable hosts = 2^(32 - subnet bits) - 2  
- Binary subnetting concepts  

**0:13:47 - Task 3: The ARP Protocol**  
- ARP: Maps IP to MAC addresses  
- Used in local network communication  

**0:23:43 - Task 4: The DHCP Protocol**  
- Assigns IP addresses dynamically  
- Process: Discover → Offer → Request → Acknowledge  

**0:26:05 - Task 5: Continue Your Learning: OSI Model**  

---

## 📺 Video 3: OSI Model

**0:00:34 - Task 1: What is the OSI Model?**  
- 7-layer model to describe networking functionality  

**0:02:25 - Task 2: Layer 7 - Application**  
**0:03:31 - Task 3: Layer 6 - Presentation**  
**0:04:54 - Task 4: Layer 5 - Session**  
**0:06:33 - Task 5: Layer 4 - Transport (TCP/UDP)**  
**0:12:44 - Task 6: Layer 3 - Network (IP, routing)**  
**0:15:24 - Task 7: Layer 2 - Data Link (MAC, Ethernet)**  
**0:16:32 - Task 8: Layer 1 - Physical (cables, hardware)**  

**0:17:33 - Task 9: Practical - OSI Game**  

---

## 📺 Video 4: Packets, TCP/IP, and Ports

**0:00:00 - Video Overview**  
**0:00:18 - Task 1: What are Packets and Frames**  
- Packets: Logical data at Layer 3  
- Frames: Physical data at Layer 2  

**0:04:23 - Task 2: TCP/IP (The Three-Way Handshake)**  
- SYN → SYN-ACK → ACK  
- Reliable delivery with TCP  

**0:11:57 - Task 3: Practical - Handshake**  
- Wireshark example of SYN/SYN-ACK/ACK  

**0:12:56 - Task 4: UDP/IP**  
- Faster, unreliable protocol (e.g. DNS, video streaming)  

**0:15:06 - Task 5: Ports 101 (Practical)**  
- Common ports: 80 (HTTP), 443 (HTTPS), 22 (SSH)  
- Use `netstat`, `ss`, or `nmap` for port visibility  

**0:20:41 - Task 6: Continue Your Learning: Extending Your Network**  

---

## 📺 Video 5: Firewalls, VPNs, Port Forwarding

**0:00:00 - Video Overview**  
**0:00:19 - Task 1: Introduction to Port Forwarding**  
- Redirecting external traffic to internal devices  

**0:02:08 - Task 2: Firewalls 101**  
- Allow/block rules  
- Stateful vs Stateless  

**0:05:20 - Task 3: Practical - Firewall**  
- UFW or iptables examples  

**0:06:34 - Task 4: VPN Basics**  
- Encrypts traffic between you and a server  
- Useful for anonymity and secure remote access  

**0:10:22 - Task 5: LAN Networking Devices**  
- Router, Switch, Firewall, Modem (overview)  

**0:14:40 - Task 6: Practical - Network Simulator**  
- Visualize LAN topologies  
- Configure IPs, test connectivity  

---
