# Wireshark Queries

### Display Filters vs Capture Filters
*Wireshark offers two primary types of filters: **Display Filters** and **Capture Filters**.*

- Display Filters are used to filter packets after they have been captured. They are incredibly flexible, allowing users to use a wide range of protocols and packet fields to refine the displayed packets in the Wireshark interface.
  
- Capture Filters are applied during the packet capture process, limiting which packets are stored by Wireshark. These filters use a different syntax and are less flexible but can be very efficient for reducing the volume of captured data.

### Syntax and Usage
- **Syntax**: Display filters in Wireshark are written using a readable syntax that includes the protocol, field names, and operators (e.g., `==`, `!=`, `>`, `<`, `contains`, `matches`).

- **Syntax Highlighting**: The Display Filter field will visually indicate the correctness of your syntax. If the text is red, Wireshark recognizes the filter syntax as invalid. If the filter is valid, the text will usually be displayed in a different color (like green or black, depending on the version and theme).
  
- **Combining Conditions**: Filters can combine multiple conditions using logical operators like and, or, and not for more complex queries.

- **Application**: To apply a display filter, enter it into the filter bar at the top of the Wireshark window and press Enter. As you start typing a protocol or field name, Wireshark provides autocomplete suggestions that can help you construct your filter correctly. The displayed packets will update to only show those that match the filter criteria.

- **Saving Filters**: If you find yourself using certain filters frequently, you can save them by clicking the bookmark icon next to the Display Filter field. Saved filters can be quickly accessed and applied, saving you time in future analysis.

Wireshark's query and filtering capabilities are a cornerstone of its utility, providing the flexibility and depth needed to analyze and understand network traffic in detail. Whether you're a network administrator, security professional, or curious learner, mastering Wireshark filters can significantly enhance your ability to interact with and analyze network data.

### IP Address Filters
**Filter by a specific IP address**  
*This filter is used to display all packets involving the IP address specified.*
```
ip.addr == 192.168.1.1
```

**Exclude specific IP address**  
*This is used to exclude all traffic to or from the specified IP address.*
```
!(ip.addr == 192.168.1.1)
```

**Filter traffic between two IP addresses**  
*This shows all traffic between the two specified IP addresses.*
```
ip.addr == 192.168.1.1 and ip.addr == 192.168.2.1
```

**Display all traffic within a specific subnet**  
*This filter shows all traffic where either the source or destination IP is within the specified subnet.*
```
ip.addr == 192.168.1.0/24
```
  
### Protocol Filter
**Filter by a specific protocol (e.g., HTTP)**  
*This displays all packets that use the specified protocol.*
```
http
```
  
### Port Filter
**Filter by a specific TCP port**  
*This is used to capture all traffic that is sent to or from specified port.*
```
`tcp.port == 80`
```

**Filter by Source Port**
*Shows all TCP packets where the source port specified*
```
tcp.srcport == 80
```

**Filter by Destination Port**
*Displays all TCP packets targeting specified port*
```
tcp.dstport == 443
```
  
### Source and Destination Filter
**Filter by source IP address**

```
`ip.src == 192.168.1.1`
```

**Filter by destination IP address**

```
`ip.dst == 192.168.1.1`
```
  
### Filtering ARP Traffic
**Display ARP traffic**  
*This is useful for examining Address Resolution Protocol traffic, which can help in identifying IP to MAC address mappings on the local network.*
```
arp
```
  
### TCP or UDP Traffice Filters
**Filter TCP traffic**

```
tcp
```

**Display packets with the SYN flag set**  
*Useful for identifying the beginning of TCP connections.*
```
tcp.flags.syn == 1
```

**Display TCP packets with reset flag**  
*Useful for identifying connections that are being reset, which can indicate errors or issues in communication between hosts.*

```
tcp.flags.reset == 1
```

**Filter UDP traffic**

```
udp
```
  
### Mac Address Filter
**Filter by a specific MAC address**  
*This filter is useful for isolating traffic from a specific device on the network.*
```
eth.addr == 00:11:22:33:44:55
```
  
### DNS Queries Filter
**Filter DNS queries**  
*This displays all DNS query packets, helpful for troubleshooting DNS issues.*
```
dns
```
  
### Filtering by Packet Length
**Display packets larger than a certain size**  
*This can help identify large packets that may be causing fragmentation or other issues.*
```
frame.len > 1500
```

# Usefull Wireshark Combos

### Combining IP Address for a Specific Protocol  
*This is useful for viewing all TCP traffic involving a specific IP address.*
```
ip.addr == 192.168.1.1 and tcp
```

### Non-HTTP and Non-HTTPS Traffic for a Specific Host  
*Useful for identifying what other protocols (besides HTTP/HTTPS) a specific host is using.*
```
ip.host == www.example.com and not http and not https
```

### TCP Traffic on Port 80 or 443 Not Involving a Specific IP Address  
*Useful for examining web traffic that does not involve a particular host.*
```
(tcp.port == 80 or tcp.port == 443) and not ip.addr == 192.168.1.1
```

### SYN Flood Attack Detection (SYN Packets without Corresponding ACK)  
*This can help identify a potential SYN flood attack by showing SYN packets that aren't followed by ACKs.*
```
tcp.flags.syn == 1 and tcp.flags.ack == 0 and not tcp.analysis.initial_rtt
```

### FTP Traffic Involving Specific Usernames  
*Filters FTP traffic to show commands involving specific usernames, useful for auditing or monitoring.*
```
ftp.request.command == "USER" and ftp.request.arg contains "sysadmin"
```




---
