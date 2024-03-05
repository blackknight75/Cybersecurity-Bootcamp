
To set up pfSense to monitor WAN traffic and pass the filtered traffic to a UniFi Gateway Pro (UXG-Pro) for managing the LAN network, you can configure pfSense in a transparent bridging mode. Here's a step-by-step guide:

1. **Prepare Your Network:**
   - Ensure that pfSense and the UXG-Pro are connected properly to your network.
   - Assign static IP addresses to pfSense and the UXG-Pro within the same subnet but with different IPs.

2. **Configure pfSense in Bridging Mode:**
   - Access the pfSense web interface.
   - Navigate to "Interfaces" > "Assignments."
   - Assign the WAN interface to the appropriate physical network interface.
   - Navigate to "Interfaces" > "Other Types."
   - Select "Bridge."
   - Choose the WAN and LAN interfaces to bridge together.
   - Save the configuration and apply changes.

3. **Configure Firewall Rules on pfSense:**
   - Navigate to "Firewall" > "Rules."
   - Select the WAN interface.
   - Create rules to allow/deny traffic as needed. You might want to block all inbound traffic except for essential services like SSH or VPN management.
   - Save the rules.

4. **Connect pfSense to the UXG-Pro:**
   - Connect the LAN interface of pfSense to the WAN port of the UXG-Pro.

5. **Configure UXG-Pro:**
   - Access the UniFi Controller software or web interface for the UXG-Pro.
   - Configure WAN settings (such as static IP or DHCP) according to your network setup.
   - Configure LAN settings to match the LAN subnet of your network.
   - Configure any additional network settings as required.

6. **Test Connectivity:**
   - Test connectivity from devices on your LAN network to ensure they can access the Internet through the UXG-Pro via pfSense.

7. **Monitor Traffic:**
   - Monitor WAN traffic using the pfSense interface to analyze and filter incoming traffic from the Internet.

### Transparent Bridge Mode (Bridge Mode)

Transparent bridge mode, also known as bridging mode, is a network configuration in which a device operates as a bridge between two or more network segments. In this mode, the device forwards network traffic between the segments without modifying the data or the network addresses.

Here's how transparent bridge mode works:

1. **Transparent Bridging Device:** The device configured in transparent bridge mode acts as a bridge, connecting two or more network segments. It typically has at least two network interfaces, one for each segment it bridges.

2. **Layer 2 Operation:** Transparent bridging operates at Layer 2 of the OSI model, meaning it forwards Ethernet frames based on the MAC addresses of the devices connected to the bridged segments.

3. **MAC Address Learning:** When a frame arrives at the bridging device, it examines the source MAC address of the frame and learns which interface it arrived on. It then stores this information in a forwarding table.

4. **Forwarding Frames:** When a frame destined for a device on the other network segment arrives at the bridging device, it looks up the destination MAC address in its forwarding table to determine which interface to forward the frame out of.

5. **No IP Addressing Changes:** In transparent bridge mode, the bridging device does not modify the IP addresses or other network-layer information in the packets it forwards. This means that devices on either side of the bridge can remain in the same IP subnet.

6. **Transparency:** From the perspective of devices on the network segments being bridged, the presence of the bridging device is transparent. They are unaware that their traffic is being forwarded through a bridge.

Transparent bridge mode is commonly used in scenarios where it is desirable to connect two network segments together as if they were part of the same physical network, without requiring changes to the network configuration of devices on either segment. It is often used in situations such as connecting LAN segments in a large network, implementing network redundancy, or integrating different types of network technologies. In the context of firewalls, transparent bridge mode allows a firewall to filter traffic between network segments without requiring changes to IP addressing or network configuration.

### Bridge Mode with DMZ

Using transparent bridge mode for a DMZ (Demilitarized Zone) between the WAN and LAN (UXG-Pro) can be a suitable approach, depending on your specific network requirements and security objectives. However, it's important to carefully consider the implications and limitations of transparent bridging in this context:

1. **Isolation of DMZ:** Transparent bridging can effectively isolate the DMZ from both the WAN and LAN segments by creating a separate network segment for hosting publicly accessible services. This helps to enhance security by reducing the risk of direct access to internal resources from the Internet.

2. **Traffic Filtering:** The bridging device (e.g., pfSense) can implement firewall rules to selectively allow or deny traffic between the WAN, DMZ, and LAN segments based on specific criteria. This allows for granular control over which types of traffic are permitted to traverse the bridge.

3. **Simplified Configuration:** Transparent bridge mode can simplify network configuration by allowing devices in the DMZ to have IP addresses that are directly routable from the WAN, without requiring complex NAT (Network Address Translation) rules. This can streamline the deployment and management of DMZ services.

4. **Potential Limitations:** While transparent bridging can provide effective segmentation, it may introduce limitations compared to other network architectures. For example, it may not be as scalable or flexible as routing-based solutions, and it may not support certain advanced features or protocols.

5. **Security Considerations:** Transparent bridging alone may not provide sufficient security for a DMZ environment. It should be complemented by other security measures such as intrusion detection/prevention systems, application layer filtering, and regular security audits to mitigate potential risks.

Ultimately, the suitability of using transparent bridge mode for a DMZ depends on factors such as the complexity of your network topology, the level of security required, and your organization's specific needs and preferences. It's advisable to carefully assess these factors and consult with network security experts to determine the most appropriate approach for your environment.
