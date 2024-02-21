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
nslookup -type=aaaa ipv6.example.com
```

### CNAME (Canonical Name) Record
- **Purpose**: Maps an alias name to a true or canonical domain name.

```bash
nslookup -type=cname www.example.com

# Output
Server:		8.8.8.8
Address:	8.8.8.8#53

Non-authoritative answer:
Can't find www.example.com: No answer

Authoritative answers can be found from:
example.com
	origin = ns.icann.org
	mail addr = noc.dns.icann.org
	serial = 2024013015
	refresh = 7200
	retry = 3600
	expire = 1209600
	minimum = 3600
```

### MX (Mail Exchange) Record
- **Purpose**: Specifies mail servers responsible for a domain.

```bash
nslookup -type=mx example.com

# Output
Server:		8.8.8.8
Address:	8.8.8.8#53

Non-authoritative answer:
example.com	mail exchanger = 0 .

Authoritative answers can be found from:
```

### PTR (Pointer) Record
- **Purpose**: Maps an IP address to a host name for reverse DNS lookups.

```bash
nslookup -type=ptr 55.123.45.67.in-addr.arpa

# Output
Server:		8.8.8.8
Address:	8.8.8.8#53

Non-authoritative answer:
55.123.45.67.in-addr.arpa	name = host-67-45-123-55.hnremote.net.

Authoritative answers can be found from:
```

### NS (Name Server) Record
- **Purpose**: Delegates a subdomain to a set of name servers.

```bash
nslookup -type=ns example.com

# Output
Server:		8.8.8.8
Address:	8.8.8.8#53

Non-authoritative answer:
example.com	nameserver = a.iana-servers.net.
example.com	nameserver = b.iana-servers.net.

Authoritative answers can be found from:
```

### TXT (Text) Record
- **Purpose**: Allows administrators to insert arbitrary text into a DNS record. Often used for verification purposes.

```bash
nslookup -type=txt example.com

# Output
Server:		8.8.8.8
Address:	8.8.8.8#53

Non-authoritative answer:
example.com	text = "v=spf1 -all"
example.com	text = "wgyf8z8cgvm2qmxpnbnldrcltvk4xqfn"

Authoritative answers can be found from:
```

### SRV (Service) Record
- **Purpose**: Specifies information about available services.

```bash
nslookup -type=srv _sip._tcp.example.com
```
- _sip._tcp.example.com: This is the domain name being queried. It is formatted specifically to request SRV records. The components of this name are:

- `_sip`: Indicates the service being queried, in this case, SIP (Session Initiation Protocol), which is used for initiating, maintaining, modifying, and terminating real-time sessions that involve video, voice, messaging, and other communications applications and services over internet protocol (IP) networks.
- `_tcp`: Specifies the protocol used by the service, TCP (Transmission Control Protocol) in this case.
- `example.com`: The domain within which the service is being queried.

*If you're querying a domain you don't control or manage, it's possible that there simply are no SRV records for SIP over TCP configured for that domain. Not all domains will have such specific SRV records unless they're actively offering those services.*

### SOA (Start of Authority) Record
- **Purpose**: Stores essential domain information, including the primary name server, the email of the domain administrator, the domain serial number, and timers.

```bash
nslookup -type=soa example.com

# Output
Server:		8.8.8.8
Address:	8.8.8.8#53

Non-authoritative answer:
example.com
	origin = ns.icann.org
	mail addr = noc.dns.icann.org
	serial = 2024013015
	refresh = 7200
	retry = 3600
	expire = 1209600
	minimum = 3600

Authoritative answers can be found from:
```

### SPF (Sender Policy Framework) Record
- **Purpose**: Helps prevent email spoofing by specifying which mail servers are allowed to send email on behalf of your domain.
- **Note**: SPF records are now typically included within TXT records.

```bash
nslookup -type=txt example.com

# Output
Server:		8.8.8.8
Address:	8.8.8.8#53

Non-authoritative answer:
example.com	text = "v=spf1 -all"
example.com	text = "wgyf8z8cgvm2qmxpnbnldrcltvk4xqfn"

Authoritative answers can be found from:
```
*Look for entries starting with "v=spf1..."*

### CAA (Certification Authority Authorization) Record
- **Purpose**: Specifies which certificate authorities (CAs) are allowed to issue certificates for a domain.

```bash
nslookup -type=caa example.com

# Output
Server:		8.8.8.8
Address:	8.8.8.8#53

Non-authoritative answer:
Can't find example.com: No answer

Authoritative answers can be found from:
example.com
	origin = ns.icann.org
	mail addr = noc.dns.icann.org
	serial = 2024013015
	refresh = 7200
	retry = 3600
	expire = 1209600
	minimum = 3600
```
