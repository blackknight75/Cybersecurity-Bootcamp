# High Availability & Bridging

High availability (HA) and bridging refers to a potential issue within the data link layer (Layer 2) of the OSI (Open Systems Interconnection) model, especially when dealing with network configurations that include bridging in a high availability setup.

>Layer 2 of the OSI model is responsible for data transfer between adjacent network nodes in a wide area or local area network. Bridges, switches, and access points operate at this layer to forward data based on MAC (Media Access Control) addresses. They help in extending or segmenting networks by forwarding frames to their destination MAC addresses within the network.

## Concern

When configuring networks for high availability (which aims at ensuring an agreed level of operational performance, usually uptime, for a higher than normal period), you might employ redundant paths to ensure network resilience and minimize downtime. If these redundant paths are not managed correctly, they can lead to the creation of layer 2 loops.

A layer 2 loop occurs when there are multiple paths between two endpoints in a network, and the network devices fail to recognize the loop. This situation can lead to broadcast storms, where the same frame circulates the network indefinitely, multiplying as it is broadcasted by each bridge or switch that receives it. This can severely degrade network performance or bring the network down entirely, as the devices become overwhelmed with redundant traffic.

## Mitigation

To handle layer 2 loops, network protocols such as Spanning Tree Protocol (STP) and its variants (RSTP, MSTP) are used. STP works by creating a tree structure of the network, with a single, unambiguous path between any two network points. It disables the redundant paths that could potentially create loops and only re-enables them if the active path fails, thus maintaining high availability without the risk of loops.

In a HA+bridge scenario, careful planning and configuration are necessary to ensure that these layer 2 loops are managed to maintain network stability and availability. This involves configuring STP correctly, ensuring that network devices and paths are appropriately redundant, and constantly monitoring the network to prevent and address potential issues promptly.
