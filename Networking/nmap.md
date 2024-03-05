# Nmap

Nmap (Network Mapper) is a powerful open-source network scanning tool used for network discovery, security auditing, and vulnerability assessment. It allows users to explore networks, find open ports, detect operating systems, and gather information about hosts and services.

1. **Scan a Single Host:**
   ```bash
   nmap <target>
   ```
   This command scans a single host identified by its IP address or hostname.

2. **Scan Multiple Hosts:**
   ```bash
   nmap <target1> <target2> ...
   ```
   This command scans multiple hosts identified by their IP addresses or hostnames.

3. **Scan a Range of IPs:**
   ```bash
   nmap <start_ip>-<end_ip>
   ```
   This command scans a range of IP addresses from `<start_ip>` to `<end_ip>`.

4. **Scan a Subnet:**
   ```bash
   nmap <subnet>/CIDR
   ```
   This command scans all hosts within a subnet specified by its IP address and CIDR notation.

5. **TCP SYN Scan:**
   ```bash
   nmap -sS <target>
   ```
   This command performs a TCP SYN scan, also known as a stealth scan, to determine open ports.

6. **TCP Connect Scan:**
   ```bash
   nmap -sT <target>
   ```
   This command performs a TCP connect scan, which completes the TCP three-way handshake to determine open ports.

7. **UDP Scan:**
   ```bash
   nmap -sU <target>
   ```
   This command performs a UDP scan to determine open UDP ports.

8. **OS Detection:**
   ```bash
   nmap -O <target>
   ```
   This command performs OS detection to identify the operating system running on the target.

9. **Service Version Detection:**
   ```bash
   nmap -sV <target>
   ```
   This command performs service version detection to identify the versions of services running on open ports.

10. **Aggressive Scan:**
    ```bash
    nmap -A <target>
    ```
    This command enables aggressive scanning options, including OS detection, version detection, and script scanning.

11. **Ping Scan (ICMP Echo):**
    ```bash
    nmap -PE <target>
    ```
    This command performs a ping scan using ICMP echo requests to determine if hosts are online.

12. **Ping Scan (TCP ACK):**
    ```bash
    nmap -PA <target>
    ```
    This command performs a ping scan using TCP ACK packets to determine if hosts are online.

13. **Port Range Scan:**
    ```bash
    nmap -p <port_range> <target>
    ```
    This command scans a specified range of ports on the target.

14. **Exclude Ports from Scan:**
    ```bash
    nmap --exclude-ports <port1,port2,...> <target>
    ```
    This command excludes specified ports from the scan.

15. **Verbose Output:**
    ```bash
    nmap -v <target>
    ```
    This command provides verbose output, including additional information about the scan progress.

16. **Save Output to a File:**
    ```bash
    nmap -oN <output_file> <target>
    ```
    This command saves the scan results to a file in normal format.

17. **Save Output in XML Format:**
    ```bash
    nmap -oX <output_file.xml> <target>
    ```
    This command saves the scan results to an XML file for further analysis.

18. **Script Scan:**
    ```bash
    nmap --script <script_name> <target>
    ```
    This command performs a script scan using a specified Nmap script.

19. **Timing Options (Aggressive):**
    ```bash
    nmap -T4 <target>
    ```
    This command sets aggressive timing options to speed up the scan.

20. **Help Menu:**
    ```bash
    nmap --help
    ```
    This command displays the help menu with information about Nmap's options and usage.
    
    ---
