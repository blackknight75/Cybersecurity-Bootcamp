# DHCP Starvation

DHCP starvation is a type of network attack that aims to deplete the pool of available IP addresses in the DHCP server, preventing legitimate network users from obtaining IP addresses. This attack is typically performed by an attacker sending a large number of DHCP request messages from a forged MAC address to the DHCP server. Since each request appears to come from a different client (because of the unique MAC address), the DHCP server allocates an IP address for each request until its pool of available IP addresses is exhausted.

### How DHCP Starvation Works

1. **Massive Requests**: The attacker uses a DHCP client or a custom script to generate and send DHCPDISCOVER messages with different, spoofed MAC addresses.
2. **Depletion of IP Pool**: The DHCP server responds to these requests by assigning IP addresses from its available pool, eventually depleting the pool if the attack continues unchecked.
3. **Denial of Service**: Legitimate clients are then unable to obtain an IP address because the DHCP server has no more addresses to allocate, leading to a denial of service (DoS) for new or reconnecting devices trying to access the network.

### Objectives and Consequences

- **Denial of Service**: The primary objective is usually to cause a denial of service for legitimate network users who cannot obtain IP addresses.
- **Man-in-the-Middle Attacks**: DHCP starvation can be a precursor to more severe attacks, such as rogue DHCP server attacks (DHCP spoofing). Once the legitimate DHCP server’s IP pool is exhausted, an attacker can set up a rogue DHCP server and start offering IP addresses, along with malicious DNS server settings or default gateways, to intercept or redirect network traffic.

## Spotting DHCP Starvation in Wireshark

When analyzing a Wireshark capture for signs of a DHCP starvation attack, you should look for the following indicators:

1. **High Volume of DHCP Requests**: An unusually high number of DHCPDISCOVER messages originating from different MAC addresses in a short time frame. This is a primary indicator of a DHCP starvation attack.

2. **Spoofed MAC Addresses**: The DHCPDISCOVER messages may appear to come from a wide range of MAC addresses, indicating that the attacker is spoofing these addresses to simulate many clients requesting IP addresses.

3. **Repeated DHCP Requests from the Same MAC Addresses**: If the pool does not exhaust and the attacker keeps trying, you might see repeated DHCPDISCOVER messages from the same set of spoofed MAC addresses, as the attacker's devices continuously attempt to deplete the DHCP address pool.

4. **Lack of Corresponding DHCPACK Messages**: In a normal DHCP interaction, a DHCPDISCOVER message is followed by a DHCPOFFER from the server, then a DHCPREQUEST from the client, and finally a DHCPACK from the server. In a starvation attack, you might notice a lack of DHCPACK messages because the server runs out of IP addresses to assign, or because the requests are fraudulent and are not taken to the final stage of the DORA process.

5. **Exhaustion of IP Address Pool**: If the DHCP server has a mechanism to log or signal when its IP pool is depleted, and you notice this in conjunction with the above signs, it's a strong indicator of DHCP starvation.

To spot these signs in Wireshark:

- Use a filter to display only DHCP packets. You can do this by entering `bootp` (the Bootstrap Protocol, which DHCP is based on) in the Wireshark filter bar.
- Look at the "Info" column to identify the type of DHCP message (DISCOVER, OFFER, REQUEST, ACK).
- Inspect the "Source" column for varying or suspicious MAC addresses, especially if they appear to follow a pattern that suggests spoofing.
- Pay attention to the time stamps of the packets to gauge the volume and frequency of DHCP requests.

Responding to DHCP starvation involves configuring DHCP snooping on switches to block untrusted DHCP messages, limiting the rate of DHCP requests a client can make, and implementing MAC address filtering where feasible.

### Mitigation Strategies

- **Implement DHCP Snooping**: A network security feature available on many switches that filters untrusted DHCP messages. DHCP snooping ensures that only messages from known DHCP servers are relayed on the network.
- **Limit Rate of DHCP Requests**: Configure rate limiting for DHCP requests on switches to prevent an attacker from sending too many requests in a short period.
- **MAC Address Filtering**: While not always practical, especially in environments with a large number of devices, MAC address filtering can control which devices are allowed to obtain an IP address from the DHCP server.
- **Secure DHCP Server Configuration**: Properly configuring the DHCP server with appropriate lease times and considering the use of static IP addresses for known devices can help manage the IP address pool more effectively.
- **Monitor Network Traffic**: Regularly monitoring network traffic for unusual patterns, such as a high number of DHCP requests, can help in early detection of a DHCP starvation attack.

By understanding DHCP starvation and implementing appropriate defensive measures, network administrators can protect their networks from this type of attack and ensure reliable network access for legitimate users.
