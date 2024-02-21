# DNS Record Types

DNS (Domain Name System) records are used to control how your domain is resolved, each serving different purposes. Here’s an overview of different DNS record types and their functions, along with examples of how to use `nslookup` to query each type:

### A (Address) Record
- **Purpose**: Maps a domain to an IPv4 address.

```bash
nslookup example.com

# Output
Server:		8.8.8.8
Address:	8.8.8.8#53

Non-authoritative answer:
Name:	example.com
Address: 93.184.216.34
```

### AAAA (IPv6 Address) Record
- **Purpose**: Maps a domain to an IPv6 address.

```bash
nslookup -type=aaaa ipv6.example.com`
```

### CNAME (Canonical Name) Record
- **Purpose**: Maps an alias name to a true or canonical domain name.

```bash
nslookup -type=cname www.example.com`
```

### MX (Mail Exchange) Record
- **Purpose**: Specifies mail servers responsible for a domain.

```bash
nslookup -type=mx example.com
```

### PTR (Pointer) Record
- **Purpose**: Maps an IP address to a host name for reverse DNS lookups.

```bash
nslookup -type=ptr 55.123.45.67.in-addr.arpa
```

### NS (Name Server) Record
- **Purpose**: Delegates a subdomain to a set of name servers.

```bash
nslookup -type=ns example.com
```

### TXT (Text) Record
- **Purpose**: Allows administrators to insert arbitrary text into a DNS record. Often used for verification purposes.

```bash
nslookup -type=txt example.com
```

### SRV (Service) Record
- **Purpose**: Specifies information about available services.

```bash
nslookup -type=srv _sip._tcp.example.com
```

### SOA (Start of Authority) Record
- **Purpose**: Stores essential domain information, including the primary name server, the email of the domain administrator, the domain serial number, and timers.

```bash
nslookup -type=soa example.com
```

### SPF (Sender Policy Framework) Record
- **Purpose**: Helps prevent email spoofing by specifying which mail servers are allowed to send email on behalf of your domain.
- **Note**: SPF records are now typically included within TXT records.

```bash
nslookup -type=txt example.com
```
*Look for entries starting with "v=spf1..."*

### CAA (Certification Authority Authorization) Record
- **Purpose**: Specifies which certificate authorities (CAs) are allowed to issue certificates for a domain.

```bash
nslookup -type=caa example.com
```
