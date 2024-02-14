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
