# Wireless Security

Wireless security is essential for protecting data and maintaining the integrity and privacy of a wireless network. Various security protocols have evolved over time, each with its advancements and limitations. Below are the main types of wireless security protocols used today, including WEP, WPA, WPA2, and WPA3, along with their pros, cons, and examples.

| **Security Protocol** | **Pros** | **Cons** | **Examples** |
|-----------------------|----------|----------|--------------|
| **WEP** | - Compatible with older hardware<br>- Simple setup | - Weak security due to static key encryption<br>- Easily breached | Older wireless networks |
| **WPA** | - Improved security with TKIP<br>- Backward compatible with WEP hardware | - Vulnerabilities in TKIP encryption<br>- Can reduce network performance | Interim solution for devices not supporting WPA2 |
| **WPA2** | - Strong security with AES support<br>- Mandatory for Wi-Fi certification since 2006 | - Security depends on password complexity<br>- Vulnerable to attacks like KRACK | Standard for most wireless networks |
| **WPA3** | - Enhanced security and privacy<br>- Provides forward secrecy | - Compatibility issues with older devices<br>- Not as widely adopted yet | Recommended for all new networks and devices |

### TKIP
`TKIP` (Temporal Key Integrity Protocol) is an encryption protocol introduced as part of the Wi-Fi Protected Access (`WPA`) standard. It was designed to provide more secure encryption than the previously used `WEP` (Wired Equivalent Privacy) algorithm, without requiring the replacement of existing hardware. `TKIP` includes several enhancements over `WEP` to improve wireless security:

1. **Per-Packet Key Mixing:** TKIP uses a mixing function to combine the secret root key with the initialization vector (IV) for each packet. This provides a unique encryption key for each packet, significantly improving security over WEP, which reuses keys.

2. **Key Hashing:** To prevent attacks on the keys themselves, TKIP implements a hashing algorithm to obscure the keys in use.

3. **Sequence Counter:** A sequence counter (also known as a replay counter) is used to protect against replay attacks, where an attacker captures data packets and retransmits them to disrupt network communication or to facilitate unauthorized access.

4. **Message Integrity Check (MIC):** TKIP introduces a message integrity check, named Michael, to protect against tampering and forgery of packets. MIC provides a way to ensure that a packet has not been altered in transit.

#### Vulnerabilities
Despite these improvements, TKIP itself was found to be vulnerable to certain types of cryptographic attacks, leading to the development of WPA2, which uses the more secure AES (Advanced Encryption Standard) algorithm instead. WPA2 became the recommended standard for securing Wi-Fi networks, and TKIP has been phased out in favor of WPA2 or WPA3, which provides even stronger security measures.

### AES
AES (Advanced Encryption Standard) is a symmetric encryption algorithm widely used across the globe to secure data. It was established as an encryption standard by the U.S. National Institute of Standards and Technology (NIST) in 2001, after a rigorous selection process. AES is designed to replace the older DES (Data Encryption Standard) due to its stronger security features and resistance to cryptographic attacks.

`AES` operates on fixed block sizes of 128 bits, but it can be configured to use three different key lengths: 128, 192, or 256 bits, with the longer keys providing a higher level of security. Despite the increase in key length, AES is designed to be efficient in both hardware and software implementations.

Key Features of AES:

1. **Symmetric Key Algorithm:** The same key is used for both encrypting and decrypting data, necessitating secure key management practices.

2. **Block Cipher:** It encrypts data in fixed-size blocks (128 bits) rather than one bit at a time, making it more efficient for large amounts of data.

3. **Security:** AES is considered secure against all known practical attacks, making it suitable for protecting classified government information and widely used in various industries for securing sensitive data.

4. **Efficiency:** It can run on a wide range of devices and platforms, from high-end servers to small IoT devices, due to its efficient design.

5. **Versatility:** AES is used in numerous security protocols, including SSL/TLS for securing internet connections, VPNs for creating secure network tunnels, and WPA2/WPA3 for securing Wi-Fi networks.

The adoption of AES as a worldwide encryption standard underscores its importance in modern cybersecurity measures, ensuring that data transmitted over the internet or stored on devices can be protected against unauthorized access.

### Other Wireless Security Measures
- **MAC Address Filtering:** Pros: Restricts network access to allowed devices. Cons: MAC addresses can be spoofed.
- **Hidden SSIDs:** Pros: Hides network name from casual observation. Cons: SSIDs can still be discovered with the right tools.

### Conclusion
The evolution of wireless security protocols from WEP to WPA3 illustrates significant advancements in protecting data integrity and user privacy on wireless networks. While WPA3 offers the highest level of security among these protocols, its effectiveness is contingent on widespread adoption and compatibility with all devices. Network security is not solely dependent on the protocol used; it requires a comprehensive approach that includes strong, complex passwords, regular updates to firmware, and education on secure network practices. Ultimately, the choice of security protocol should balance the need for robust protection against practical considerations such as device compatibility and network performance.
