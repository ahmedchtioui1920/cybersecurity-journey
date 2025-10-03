# Subnetting Practice

## CIDR and Subnet Mask
- /24 → 255.255.255.0 → 254 usable hosts
- /26 → 255.255.255.192 → 62 usable hosts

## Subnetting Steps
1. Identify CIDR (e.g., /26)
2. Calculate host bits: 32 - CIDR
3. Calculate hosts: 2^host_bits - 2

## Examples
- 192.168.1.0/26
  - Hosts: 62
  - Range: 192.168.1.1 – 192.168.1.62
  - Broadcast: 192.168.1.63

## Practice Questions
- What is the broadcast address of 10.0.0.0/30?
- How many usable hosts in 172.16.0.0/20?
