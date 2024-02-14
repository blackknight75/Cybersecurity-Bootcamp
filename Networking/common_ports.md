# Common Networking Ports

| Port Number | Protocol | Service/Application              | Description                                                                                   |
|-------------|----------|----------------------------------|-----------------------------------------------------------------------------------------------|
| 20, 21      | TCP      | FTP (File Transfer Protocol)     | Port 20 is used for data transfer, while port 21 is for control (commands).                   |
| 22          | TCP/UDP  | SSH (Secure Shell)               | Used for secure logins, file transfers (scp, sftp) and port forwarding.                       |
| 23          | TCP/UDP  | Telnet                           | Used for unencrypted text communications (not recommended for use).                          |
| 25          | TCP      | SMTP (Simple Mail Transfer Protocol) | Used for sending emails.                                                                     |
| 53          | TCP/UDP  | DNS (Domain Name System)         | Used for domain name resolution.                                                             |
| 80          | TCP      | HTTP (Hypertext Transfer Protocol)| Used for unsecured web traffic.                                                              |
| 110         | TCP      | POP3 (Post Office Protocol version 3) | Used for receiving emails.                                                                  |
| 143         | TCP      | IMAP (Internet Message Access Protocol) | Used for retrieving emails.                                                                 |
| 443         | TCP      | HTTPS (HTTP Secure)              | Used for secure web traffic.                                                                 |
| 445         | TCP      | Microsoft-DS (Active Directory, Windows shares) | Used for Windows file and printer sharing, as well as other Windows services.               |
| 587         | TCP      | SMTP (Simple Mail Transfer Protocol) | Used for email message submission (alternative to port 25).                                 |
| 993         | TCP      | IMAP over SSL (IMAPS)            | Used for securely retrieving emails.                                                         |
| 995         | TCP      | POP3 over SSL (POP3S)            | Used for securely receiving emails.                                                          |
| 1433, 1434  | TCP/UDP  | Microsoft SQL Server             | Port 1433 is used for database management communications; 1434 for SQL Server browser service. |
| 3306        | TCP/UDP  | MySQL                            | Used for MySQL database access.                                                              |
| 3389        | TCP/UDP  | RDP (Remote Desktop Protocol)    | Used for Windows Remote Desktop and Remote Assistance connections.                           |
| 5060, 5061  | TCP/UDP  | SIP (Session Initiation Protocol)| 5060 for non-encrypted signaling traffic, 5061 for encrypted.                                |
| 6379        | TCP      | Redis                            | Used for Redis database access.                                                              |
| 8080        | TCP      | HTTP Alternate                   | Often used as an alternative to port 80 for web traffic, especially for proxies and secondary web servers. |
| 69          | UDP      | TFTP (Trivial File Transfer Protocol) | Used for simple file transfers without authentication.                                         |
| 123         | UDP      | NTP (Network Time Protocol)          | Used for clock synchronization between computer systems.                                       |
| 137-139     | TCP/UDP  | NetBIOS                             | Used for network basic input/output system services for file sharing and name resolution.       |
| 161, 162    | UDP      | SNMP (Simple Network Management Protocol) | 161 for SNMP messages, 162 for SNMP trap messages, used for network management.              |
| 389         | TCP/UDP  | LDAP (Lightweight Directory Access Protocol) | Used for accessing and maintaining distributed directory information services.               |
| 443         | TCP      | HTTPS (HTTP Secure)                 | Used for secure web traffic, utilizing SSL/TLS.                                                |
| 465         | TCP      | SMTPS (Secure SMTP)                 | Used for secure email transmission. Originally intended for SMTP over SSL.                     |
| 514         | TCP/UDP  | Syslog                              | Used for logging system messages in an IP network.                                             |
| 636         | TCP      | LDAPS (LDAP over SSL)               | Used for secure LDAP communications.                                                           |
| 989, 990    | TCP      | FTPS (FTP Secure)                   | Port 989 for data transfer and 990 for control (commands), using FTP over SSL/TLS.             |
| 1194        | UDP      | OpenVPN                             | Used for OpenVPN connections.                                                                  |
| 1723        | TCP      | PPTP (Point-to-Point Tunneling Protocol) | Used for VPN services.                                                                       |
| 1812, 1813  | UDP      | RADIUS (Remote Authentication Dial-In User Service) | 1812 for authentication and authorization, 1813 for accounting.                              |
| 2049        | TCP/UDP  | NFS (Network File System)            | Used for distributed file systems in a network.                                                |
| 2082, 2083  | TCP      | cPanel                              | 2082 for cPanel default port, 2083 for cPanel over SSL.                                        |
| 2483, 2484  | TCP      | Oracle Database                     | 2483 for unencrypted data, 2484 for SSL-encrypted data.                                        |
| 3389        | TCP/UDP  | RDP (Remote Desktop Protocol)       | Used for Windows Remote Desktop and Remote Assistance connections.                            |
| 5060, 5061  | TCP/UDP  | SIP (Session Initiation Protocol)   | 5060 for non-encrypted signaling traffic, 5061 for encrypted.                                  |
| 5222, 5223  | TCP      | XMPP (Jabber)                       | 5222 for client connections, 5223 for legacy SSL connections (typically for instant messaging).|
| 5900        | TCP/UDP  | VNC (Virtual Network Computing)     | Used for remote desktop sharing.                                                               |
| 8443        | TCP      | HTTPS Alternate                     | Often used as an alternative to port 443 for web traffic, especially for HTTPS services.       |
