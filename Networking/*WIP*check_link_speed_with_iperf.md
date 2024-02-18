# iperf3
`iperf3` is a powerful tool used for measuring the maximum achievable bandwidth on IP networks. It supports testing of both TCP and UDP data streams while measuring the throughput of the network between two endpoints. iperf3 is widely used for network performance testing and troubleshooting because it can easily test the speed and quality of a network link.

Here are some key features and aspects of iperf3:

### Key Features:
- **TCP and UDP Support**: iperf3 can test both TCP (for reliable, connection-oriented services) and UDP (for datagrams) to measure bandwidth, loss, and jitter.

- **Bi-directional Testing**: Allows for simultaneous testing of both transmit and receive paths.

- **Customizable Parameters**: Users can adjust various parameters such as port number, interval length, transmission time, buffer length, and more.

- **Multithreading**: It supports multiple simultaneous connections to test the aggregate bandwidth.

- **JSON Output**: iperf3 can produce test results in a JSON format, which is useful for programmatically parsing and analyzing the data.


Step 1: Check if iperf3 is Installed on Both Server and Client Machines
On Linux (Server): Open a terminal and type `iperf3 -v`. If iperf3 is installed, you'll see the version information. If not, you'll see a command not found message.
On Windows (Client): Open Command Prompt and type `iperf3 -v`. If iperf3 is installed, it will display the version information. Otherwise, you'll see an error message indicating that iperf3 is not recognized.
Step 2: Install iperf3
Linux Server:

Update your package manager: sudo apt-get update (for Debian/Ubuntu) or sudo yum update (for CentOS/RHEL).
Install iperf3: sudo apt-get install iperf3 (for Debian/Ubuntu) or sudo yum install iperf3 (for CentOS/RHEL).
Windows Client:

Download the compiled iperf3 binary for Windows from the official iPerf website.
Extract the ZIP file to a folder, e.g., C:\iperf3.
Step 3: Add to PATH If Not Working After Install
If iperf3 does not run directly in the command line, you may need to add it to your PATH.

Windows Client:
Right-click the Start button and select Windows Terminal (Admin) or Command Prompt (Admin).
Type sysdm.cpl and press Enter to open the System Properties dialog.
Go to the Advanced tab and click on Environment Variables.
Under System Variables, find and select the Path variable, then click Edit.
Click New and add the path to the iperf3 folder (e.g., C:\iperf3). Click OK to save and exit.
Step 4: Launch iperf3 on Server
On your Linux server, start iperf3 in server mode:

```bash
iperf3 -s
```

This command starts iperf3 in server mode, listening on the default port 5201. Note this port number if you plan to use a different one, specify it with the -p option (e.g., iperf3 -s -p 5001).

Step 5: Launch iperf3 on Client Machine
On your Windows client, point iperf3 at the server's IP address and port number:

```cmd
iperf3 -c <server_ip_address> -p <port_number>
```

Replace <server_ip_address> with your Linux server's IP address. If you're using the default port, you can omit the -p <port_number> part.

Step 6: Results
After running the test, you'll see output similar to this on both the client and server:

```cmd
-----------------------------------------------------------
Accepted connection from 192.168.1.193, port 52022
[  5] local 192.168.1.198 port 5201 connected to 192.168.1.193 port 52023
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-1.00   sec  26.8 MBytes   225 Mbits/sec
...
[  5]   8.00-9.00   sec  80.9 MBytes   679 Mbits/sec
```

This output shows the results for each one-second interval of the test, including the amount of data transferred and the bitrate.

The Transfer column shows how much data was sent from the client to the server during each interval.
The Bitrate column shows the network throughput (speed) during each interval.
This test helps you assess the performance of your network connection between the two machines.
