# IDS

Intrusion Detection Systems (IDS) are designed to monitor network traffic and system activities for malicious actions or policy violations. There are primarily two types of IDS based on their detection techniques: Signature-Based IDS and Anomaly-Based IDS.

**Signature-Based IDS:**

- Signature-Based IDS, also known as misuse detection, relies on a predefined set of patterns or signatures that are known to be malicious. These signatures could be byte sequences in network traffic, or known malicious instruction sequences used by malware.
- This type of IDS is very effective at detecting known threats. When network traffic or system behavior matches a signature in the database, an alert is generated.
- The major drawback is that Signature-Based IDS cannot detect new, previously unknown attacks or variants of existing attacks that do not match existing signatures.
- Regular updates to the signature database are essential for maintaining its effectiveness.
- Signature-Based IDS is similar to how antivirus software operates.

**Anomaly-Based IDS:**

- Anomaly-Based IDS, also known as behavior-based detection, builds a baseline of normal behavior on the network or system and then continuously monitors for activities that deviate from that baseline.
- The system may use statistical methods, machine learning, or other forms of artificial intelligence to learn what is considered normal and then alert on the anomalies.
- Anomaly-Based IDS is capable of detecting previously unknown attacks by noticing unusual behaviors that could signify a threat.
- However, it can produce higher false positives compared to Signature-Based IDS, because legitimate but unusual network behavior may be flagged as malicious.
- Anomaly-Based IDS requires an initial learning period to establish what is normal and may need ongoing tuning to adapt to legitimate changes in network behavior.
