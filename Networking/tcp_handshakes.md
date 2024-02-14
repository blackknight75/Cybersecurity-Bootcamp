# Establishing Connection

The TCP three-way handshake is crucial for establishing a reliable connection between a client and a server in the TCP/IP networking protocol. It ensures readiness for data transmission and agreement on initial sequence numbers for tracking data streams. Below is a step-by-step breakdown:

### SYN

- **Client Sends SYN (Synchronize)**:
  - **Purpose**: Initiates the connection.
  - **Packet Details**: The SYN flag is set to 1, and the sequence number field carries the client's initial sequence number (ISN).

#### Create a Filter to Check for These Events
```
tcp.flags.syn==1 && tcp.ack==0
```

### SYN-ACK

- **Server Responds with SYN-ACK (Synchronize-Acknowledgment)**:
  - **Purpose**: Acknowledges the client's request.
  - **Packet Details**: Both SYN and ACK flags are set to 1.

#### Create a Filter to Check for These Events
```
tcp.flags.syn==1 && tcp.flags.ack==1
```

### ACK

- **Client Acknowledges with ACK**:
  - **Purpose**: Acknowledges the server's response.
  - **Packet Details**: The ACK flag is set to 1.

#### Create a Filter to Check for These Events
```
tcp.flags.ack==1 && tcp.flags.syn==0
```

**Conclusion**: After this handshake the connection is established, ready for data transmission. This process ensures a reliable, ordered, and error-checked delivery of packets.

# Terminating Connection

TCP connection termination is a four-step process, ensuring that both parties have completed data transmission and agree to close the connection. Below is a detailed step-by-step explanation:

### FIN from the Initiator

- **Client (or Server) Sends FIN (Finish)**:
  - **Purpose**: Indicates that the sender has finished sending data and wants to start the connection termination process.
  - **Packet Details**: The FIN flag is set to 1.

#### Create a Filter to Check for These Events
```
tcp.flags.fin==1 && tcp.flags.ack==0
```

### ACK for FIN

- **Receiver Responds with ACK**:
  - **Purpose**: Acknowledges the receipt of the FIN packet from the initiator.
  - **Packet Details**: The ACK flag is set to 1.

#### Create a Filter to Check for These Events
```
tcp.flags.fin==0 && tcp.flags.ack==1
```
### FIN from the Receiver

- **Receiver (Now Initiator) Sends FIN**:
  - **Purpose**: After sending all remaining data, the receiver of the first FIN now sends its own FIN, indicating it has also finished sending data.
  - **Packet Details**: The FIN flag is set to 1.

#### Create a Filter to Check for These Events
```
tcp.flags.fin==1 && tcp.flags.ack==0
```
### ACK for FIN

- **Original Initiator Responds with ACK**:
  - **Purpose**: Acknowledges the receipt of the FIN packet from the receiver.
  - **Packet Details**: The ACK flag is set to 1.

#### Create a Filter to Check for These Events
```
tcp.flags.fin==0 && tcp.flags.ack==1
```

**Conclusion**: After these steps, the TCP connection is fully terminated. This four-step process ensures that both sides of the connection are informed and agree upon the disconnection, allowing for a clean and orderly shutdown of the session.


# Alternative: Using `tcp.stream` to Filter Handshakes

To track a TCP three-way handshake or four-way termination handshake in Wireshark using the `tcp.stream` filter, you can follow these steps. The `tcp.stream` filter in Wireshark is a powerful feature that allows you to isolate and analyze all packets belonging to a specific TCP connection, identified by a unique stream index. Here's how you can use it:

### Tracking a Three-Way Handshake

1. **Identify an Initial Connection Packet**: Look for the first packet of a TCP three-way handshake, which is a SYN packet. You can use the filter `tcp.flags.syn == 1 && tcp.flags.ack == 0` to find all SYN packets initiating a connection.

2. **Find the TCP Stream Index**: Once you've identified a SYN packet that initiates a connection, select it. In the packet details pane, expand the "Transmission Control Protocol" section. Look for the `tcp.stream` value. This value is assigned by Wireshark to uniquely identify all packets belonging to the same TCP connection.

3. **Apply the `tcp.stream` Filter**: Right-click on the packet, navigate to "Follow" and then "TCP Stream". This action automatically applies a filter like `tcp.stream == x`, where `x` is the stream index of the connection. Alternatively, you can manually enter the filter `tcp.stream == x` in the filter bar, replacing `x` with the stream index you found.

4. **Analyze the Three-Way Handshake**: With the filter applied, you should now see only the packets belonging to that TCP connection. Look for the three packets that comprise the three-way handshake:
   - SYN packet from the client.
   - SYN-ACK packet from the server.
   - ACK packet from the client.

### Tracking a Four-Way Termination Handshake

1. **Continue Using the Same `tcp.stream` Filter**: If you're continuing from tracking the three-way handshake, keep the same `tcp.stream` filter applied. Otherwise, identify a connection you wish to analyze the termination of, and apply the `tcp.stream` filter as described above.

2. **Identify the Termination Packets**: In a TCP connection's termination, look for the sequence of packets comprising the four-way handshake:
   - FIN from the first party (client or server).
   - ACK from the second party.
   - FIN from the second party.
   - ACK from the first party.

3. **Analyze Packet Details**: For each of these packets, you can examine the flags set in the "Transmission Control Protocol" section of the packet details. You're looking for packets with the FIN flag set for the first and third steps and the ACK flag set for all four steps.

Using the `tcp.stream` filter in Wireshark allows you to isolate and examine the specific sequence of packets involved in both establishing and terminating a TCP connection, making it easier to analyze the behavior of the connection, troubleshoot issues, or understand the flow of data between two endpoints.
