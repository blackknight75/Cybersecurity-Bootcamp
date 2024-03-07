# Laye 2 Loops

Layer 2 loops refer to a situation in a computer network where there are multiple paths between two devices at the data link layer (Layer 2) of the OSI model, without proper control mechanisms in place to prevent endless circulation of frames. This level of the OSI model is where devices like switches and bridges operate, making decisions on forwarding data based on MAC (Media Access Control) addresses.

In a well-designed network, frames (units of data) should have a clear, unambiguous path from source to destination. However, in networks that incorporate redundancy to enhance reliability and availability, there can be multiple paths that a frame could potentially take between two points. Without appropriate management, this redundancy can lead to loops.

### How Layer 2 Loops Occur
Layer 2 loops typically occur in Ethernet networks with redundant paths. For example, if Switch A is connected to Switch B and Switch C, and there's also a link connecting Switch B and Switch C for redundancy, a loop exists. If the network doesn’t have protocols like Spanning Tree Protocol (STP) configured to manage this redundancy, it can cause problems. When a frame is sent from Switch A to Switch B with the intention of reaching a device beyond Switch C, both Switch B and Switch C could keep forwarding this frame to each other endlessly if each switch thinks the other path is a better route to the destination.

## Why They Are Problematic

### Broadcast Storms
- **Broadcast Replication:** Ethernet networks use broadcast frames to discover devices and services. In a looped network, a broadcast frame sent by a device will be endlessly circulated and replicated because each switch or bridge forwards broadcasts to all ports (except the one it arrived on), aiming to reach devices whose locations are unknown.
- **Network Saturation:** As these frames are replicated and circulated, the network becomes saturated with redundant copies of the same broadcast frame. This excessive traffic consumes all available bandwidth, leaving no room for legitimate traffic.

### MAC Address Table Instability
- **Flapping:** Switches maintain MAC address tables to map devices to specific ports, facilitating efficient data forwarding. In a looped environment, the same MAC address appears to move between different ports (because the switch sees the same address from multiple paths), causing the MAC address table to constantly update ("flap"). This instability can lead to legitimate traffic being sent to the wrong destination or dropped entirely.

### CPU Load Increase
- **Processing Overhead:** Each frame processed by a switch or bridge consumes CPU resources. In a loop scenario, the exponential increase in frames due to broadcasts and multicasts significantly raises the processing load on these devices. This can lead to a situation where network devices are unable to process legitimate traffic efficiently because they are overwhelmed by the looped traffic.

### Resource Depletion
- **Exhaustion of Network Resources:** The network devices have limited memory and processing capabilities. The flood of unnecessary traffic in a loop can exhaust these resources, leading to dropped packets, increased latency, and, in severe cases, device crashes or network outages.

### Disruption of Network Services
- **Impact on Network Reliability:** The combined effect of broadcast storms, MAC address table instability, increased CPU load, and resource depletion can severely impact the reliability and availability of network services. Critical applications and services may become unreachable, and the network might fail to meet its designed high availability goals.

## Mitigation
Preventing and mitigating the effects of Layer 2 loops involves network design considerations and the implementation of protocols like the Spanning Tree Protocol (STP) and its variants (Rapid Spanning Tree Protocol - RSTP, Multiple Spanning Tree Protocol - MSTP). These protocols help create a loop-free topology by selectively blocking redundant paths that could cause loops, while still maintaining network redundancy for high availability.
