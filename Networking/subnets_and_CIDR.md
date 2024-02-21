# CIDR Notation

CIDR (Classless Inter-Domain Routing) notation is a compact representation of an IP address and its associated network mask. CIDR notation replaces the old system of classful network addressing with an efficient and flexible method to allocate IP addresses.

### Components:
1. **IP Address**: A standard IPv4 address comprised of 32 bits, typically shown as four octets (groups of 8 bits) in decimal format, separated by dots (e.g., `192.168.1.1`).

2. **Prefix Length**: The number of leading bits in the IP address that are used to identify the network segment. This is indicated by a slash (`/`) followed by a number (e.g., `/24`). The prefix length can range from 0 to 32 for IPv4. The prefix length indicates the division between the network and host portions of the address. The network portion (network prefix) can be used to identify the specific network, while the host portion identifies a specific device (host) within that network.

### Examples of CIDR Notation:
- `192.168.1.0/24`: This indicates that the first 24 bits are the network part of the address, and the remaining 8 bits are for host addresses within that network. This allows for 256 IP addresses (from `192.168.1.0` to `192.168.1.255`), with one of those being the network address (`192.168.1.0`) and another being the broadcast address (`192.168.1.255`).

# Calculating Usable Hosts

### IPv4

IPv4 addresses are 32 bits in length. When you define a network with a specific prefix length, you're indicating how many of those 32 bits are used to identify the network portion of the address. The remaining bits are used for host addresses within that network. Each bit can be a 0 or a 1, so for each bit, there are 2 possible values. You calculate the number of possible host combinations by raising 2 to the power of remaining bits and then subtacting 2 of your available IPs. 

`N` = the total number of bits for IPv4 addresses, which is 32.  
`P` = the prefix length of the subnet.

### *2<sup>(N-P)</sup> - 2*

This calculates the total number of IP addresses in the subnet, and subtracting 2 adjusts for the network and broadcast addresses, which are not usable for hosts. In IPv4 subnetting, the subtraction of 2 addresses from the total number of possible addresses within a subnet is a standard practice because:

1. **Network Address**: The first address in a subnet is reserved as the network address. This address identifies the subnet and cannot be assigned to any individual host within the network.
    
2. **Broadcast Address**: The last address in a subnet is reserved as the broadcast address. This address is used to send a packet to all hosts within the subnet simultaneously.

### IPv6
IPv6 addresses are 128 bits in length. When you define a network with a specific prefix length, you're indicating how many of those 128 bits are used to identify the network portion of the address. The remaining bits are used for host addresses within that network. Each bit can be a 0 or a 1, so for each bit, there are 2 possible values. You calculate the number of possible host combinations by raising 2 to the power of remaining bits. ***You do NOT need to subtract 2 when calculating hosts for IPv6.***   
  
`N` = the total number of bits for IPv6 addresses, which is 128.  
`P` = the prefix length of the subnet.

### *2<sup>(N-P)</sup>*

*IPv6 was designed with such a large address space to accommodate the vast number of devices connecting to the internet and to eliminate the need for conservation techniques required by the limited IPv4 space, such as the subtraction of network and broadcast addresses.*
