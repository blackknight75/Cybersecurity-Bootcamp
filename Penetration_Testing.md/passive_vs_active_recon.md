# Passive VS. Active Recon

### Active Recon

Active reconnaissance in cybersecurity involves directly engaging with a target system to gather information about its configuration, available services, and vulnerabilities. This approach uses tools and techniques to interact with systems, such as port scanning with Nmap, vulnerability scanning with Nessus, or using tools like Wireshark for packet analysis.

**Pros:**
- Provides detailed and accurate information about the target.
- Helps identify specific vulnerabilities that can be exploited.

**Cons:**
- Easily detected by intrusion detection systems, leading to potential legal issues.
- Can be considered intrusive and aggressive, risking alerting the target.

#### Examples
| Type                        | Description                                          | Tools/Resources            |
|-----------------------------|------------------------------------------------------|-----------------------------|
| Port Scanning               | Identifying open ports and services on a target.     | Nmap, Masscan               |
| Vulnerability Scanning      | Detecting potential vulnerabilities in systems.      | Nessus, OpenVAS             |
| Web Application Scanning    | Finding vulnerabilities in web applications.         | OWASP ZAP, Burp Suite       |
| DNS Enumeration             | Gathering domain and DNS information about a target. | nslookup, dig               |
| Network Mapping             | Understanding the layout and architecture of a network. | Zenmap, NetDiscover      |
| Exploitation Tools          | Testing and exploiting known vulnerabilities.        | Metasploit, Exploit-DB      |
| Phishing Simulations        | Simulating phishing attacks to assess security awareness. | Gophish, Phishing Frenzy |
| Social Engineering          | Using deceptive tactics to gather information.       | Social-Engineer Toolkit (SET)|
| Brute Force Attacks         | Testing the strength of passwords and access controls. | Hydra, John the Ripper    |
| Exploiting Known Vulnerabilities | Actively exploiting known weaknesses to assess system defenses. | Custom scripts, CVE databases |

### Passive Recon
Passive reconnaissance in cybersecurity involves gathering information about a target without direct interaction. Techniques include analyzing public records, social media, and other online footprints to collect data on a target's infrastructure, employees, and technologies used. 

**Pros:**
- Lower risk of detection, making it safer and more discreet.
- Can be performed without specialized tools or direct access to the target network.

**Cons:**
- Information may be outdated or incomplete.
- Gathering comprehensive data can be time-consuming and may require sifting through large amounts of irrelevant information.

#### Examples
| Type                         | Description                                               | Tools/Resources                 |
|------------------------------|-----------------------------------------------------------|----------------------------------|
| Online Search                | Gathering publicly available information via search engines. | Google, Bing                     |
| Social Media Analysis        | Analyzing social media profiles for personal or corporate intel. | LinkedIn, Facebook, Twitter      |
| Domain and WHOIS Lookup      | Obtaining domain registration details.                     | WHOIS, DomainTools               |
| DNS Analysis                 | Extracting DNS records for domain mapping and services.    | nslookup, dig, CentralOps        |
| Job Posting Analysis         | Reviewing job postings for technology stacks and roles.    | Indeed, Glassdoor                |
| Website Footprinting         | Analyzing a website's metadata and architecture.           | BuiltWith, Wappalyzer            |
| Email Header Analysis        | Extracting sender information from email headers.          | Email clients, Online tools      |
| Public Record Search         | Searching government and public records for information.   | Various government websites      |
| Technical Documentation Review | Reviewing publicly available manuals or docs for system info. | Manufacturer websites, Archives  |
| Network Peering Databases    | Gathering data from public network peering databases.      | PeeringDB, BGP Toolkit           |
