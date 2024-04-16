# Privilege Escalation

Privilege escalation is a critical phase in many cybersecurity attacks, where an attacker expands their control over the system by gaining elevated access to resources that are normally protected from an application or user. The goal is to achieve higher-level permissions on a system or network, and there are numerous techniques attackers might use to accomplish this. Here are some of the most common privilege escalation techniques:

### 1. **Exploitation of Software Vulnerabilities**
   - This includes exploiting known software vulnerabilities such as buffer overflows, SQL injections, or other software bugs that allow an attacker to execute code with elevated privileges. Many attackers rely on publicly disclosed vulnerabilities and use automated tools to exploit them.
     ##### Tools and Resources
     - [Metasploit](https://www.metasploit.com/): A powerful framework that includes a suite of tools for developing and executing exploit code against a remote target machine.
     - [Exploit-DB](https://www.exploit-db.com/): An archive of public exploits and corresponding vulnerable software, maintained by Offensive Security.
     - [CVE](https://cve.mitre.org/cve/search_cve_list.html) Details: A database of publicly known cybersecurity vulnerabilities, which can be searched for specific exploits.

### 2. **Misconfigurations and Default Settings**
   - Systems that are set up with insecure default configurations or misconfigurations (like overly permissive file permissions, unsecured databases, or default passwords) can be exploited to gain higher privileges.
     ##### Tools and Resources
     - [Nessus](https://www.tenable.com/products/nessus?ttrp444386=ttrp496606): A vulnerability scanner that can detect misconfigurations and insecure default settings.

### 3. **Password Cracking and Credential Dumping**
   - Attackers might use tools to extract passwords stored on a computer system (e.g., in memory or configuration files). Tools like Mimikatz are popular for extracting credentials from Windows systems.
     ##### Tools and Resources
     - [Mimikatz](https://github.com/gentilkiwi/mimikatz): A tool to extract plaintext passwords, hashes, PIN codes, and kerberos tickets from memory.
     - [John the Ripper](https://www.openwall.com/john/): A fast password cracker, currently available for many flavors of Unix, Windows, DOS, and OpenVMS.
     - [Hashcat](https://hashcat.net/hashcat/): An advanced password recovery tool supporting a large number of algorithms and very flexible attack options.

### 4. **Privilege Escalation Scripts and Tools**
   - These are tools specifically designed to automate the search for vulnerabilities and misconfigurations that can be exploited for privilege escalation. Examples include Metasploit’s local exploit suggester, PowerSploit, and Windows Exploit Suggester.
     ##### Tools and Resources
     - [PowerSploit-Dev](https://github.com/PowerShellMafia/PowerSploit): A collection of Microsoft PowerShell modules that can be used to aid penetration testers during all phases of an assessment.

### 5. **Abusing File Permissions and Access Control Lists (ACLs)**
   - Attackers might find executable files, scripts, or services with weak file permissions that they can modify. By altering these files, attackers can execute arbitrary commands with elevated privileges.

### 6. **SID-History Injection**
   - In Windows environments, attackers can add additional SIDs (Security Identifier) to the token of a current session, impersonating more privileged accounts and gaining their privileges.
    ##### Tools and Resources
    - [Mimikatz](https://github.com/gentilkiwi/mimikatz): Also capable of SID-History injection.
     
### 7. **DLL Hijacking**
   - By placing a malicious dynamic link library (DLL) file in a location that is searched before the legitimate DLL file, an attacker can have their malicious code executed in the context of a higher privileged application.

### 8. **Token Manipulation**
   - In environments like Windows, attackers can manipulate access tokens, which are used to define the security context of user or process threads. This allows attackers to impersonate other users.
      ##### Tools and Resources
      - [Mimikatz](https://github.com/gentilkiwi/mimikatz): Also, useful for manipulationg and stealing tokens.
        
### 9. **Path Interception**
   - An attacker might place a malicious executable on a path that is earlier in the search path environment variable than the legitimate executable, leading to the execution of the malicious program instead of the intended one.

### 10. **Exploiting Cron Jobs and Scheduled Tasks**
  - If cron jobs or scheduled tasks are running scripts as a superuser, modifying these scripts (if they are writable by a low-privileged user) can lead to privilege escalation.
    
### 11. **Kernel Exploits**
  - Vulnerabilities in the operating system kernel can be exploited to run code at the kernel level, thus completely compromising the system with the highest level of privileges.

### 12. **Use of Unquoted Service Paths**
  - If a Windows service path is unquoted and contains spaces, Windows will attempt to execute each substring as a separate command until it finds a valid executable. If a malicious executable is placed correctly, it can be run instead of the legitimate service.

Each of these techniques can be mitigated by proper system configuration, regular updates, the principle of least privilege, and proactive security measures. Knowing how these techniques work is crucial for both penetration testers and defenders to secure systems effectively.
