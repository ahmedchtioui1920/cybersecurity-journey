# Networking Notes — Summary (TryHackMe)

This summary covers foundational networking concepts explained across multiple TryHackMe learning modules.

---

## 🌐 What is Networking?
- Networking is the practice of connecting computers and devices to share resources and communicate.
- It includes both wired and wireless communication and relies on protocols like TCP/IP.

## 🌍 What is the Internet?
- The internet is a massive global network composed of smaller networks.
- It allows devices worldwide to connect using IP addresses and standardized communication protocols.

## 🖥️ Identifying Devices on a Network
- Devices on a network are identified by:
  - **IP address** (logical identifier)
  - **MAC address** (physical identifier)
  - **Hostname** (human-readable name)
- Commands like `ip a` or `ifconfig` help reveal this information.

## 📶 Ping & ICMP
- Ping uses the **ICMP protocol** to test connectivity between devices.
- It checks if a host is reachable and measures round-trip time.

## 🕸️ LAN Topologies
- Common network structures include:
  - **Star**: Devices connect to a central hub.
  - **Bus**: All devices share a single communication line.
  - **Mesh**: Devices connect directly to many or all others.
- Topologies affect speed, reliability, and scalability.

## 📐 Subnetting Basics
- Subnetting divides a network into smaller parts to improve organization and security.
- Uses CIDR notation (e.g. /24) to define how many bits are for the network vs. host.
- Key formulas:
  - Hosts = 2^(32 - subnet bits) - 2
  - Subnet mask determines usable IP range.

## 🔍 ARP (Address Resolution Protocol)
- ARP maps an IP address to a MAC address.
- It’s used for communication within local networks (Layer 2).

## 🎯 DHCP (Dynamic Host Configuration Protocol)
- Automatically assigns IP addresses to devices.
- Process: Discover → Offer → Request → Acknowledge.

## 🧱 OSI Model (7 Layers)
1. **Application** – Interface for end-user applications.
2. **Presentation** – Data formatting and encryption.
3. **Session** – Manages connections and sessions.
4. **Transport** – Ensures reliable delivery (TCP/UDP).
5. **Network** – Handles routing and logical addressing (IP).
6. **Data Link** – Deals with MAC addresses and Ethernet.
7. **Physical** – Hardware transmission (cables, signals).

## 📦 Packets and Frames
- **Packet**: Data unit at Layer 3 (Network).
- **Frame**: Data unit at Layer 2 (Data Link).
- Data is encapsulated as it moves down the OSI layers.

## 🤝 TCP/IP and Handshakes
- **TCP** provides reliable, ordered communication using a three-step handshake: SYN → SYN-ACK → ACK.
- **UDP** is faster but unreliable; often used for streaming, DNS, gaming.

## 🎯 Ports and Services
- Ports identify specific services on a device:
  - 80 (HTTP), 443 (HTTPS), 22 (SSH), 53 (DNS)
- Used with IP to direct traffic to the correct process.

## 🚪 Port Forwarding
- Allows external devices to access services inside a private network.
- Example: forwarding port 80 to a web server behind a router.

## 🔥 Firewalls
- Firewalls control traffic flow with allow/block rules.
- Can be **stateful** (track connection state) or **stateless**.

## 🛡️ VPNs (Virtual Private Networks)
- Encrypt data between your device and a remote server.
- Useful for privacy, anonymity, and secure remote access.

## 🧰 LAN Devices Overview
- **Router**: Directs traffic between networks.
- **Switch**: Connects devices in a LAN.
- **Firewall**: Monitors and controls incoming/outgoing traffic.
- **Modem**: Connects to your ISP.

---

This summary provides a solid foundation in computer networking, useful for cybersecurity, system administration, and ethical hacking.
