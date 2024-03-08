
IOAs and IOCs are acronyms that stand for "Indicators of Attack" and "Indicators of Compromise," respectively. They are both used to detect potential security incidents, but they focus on different aspects of the incident.

1. **Indicators of Attack (IOAs)**:
   - IOAs focus on detecting the intent of what an attacker is trying to accomplish regardless of the malware or exploit used in an attack.
   - They are proactive, as they look for patterns of activity that are typically observed in the early stages of attacks, before any damage is done.
   - Examples of IOAs include unusual outbound network traffic, anomalies in privileged user account activity, spikes in database read volumes, or signs of credential dumping.
   - IOAs are often used in behavioral-based detection systems, which look for deviations from normal behavior that may indicate malicious intent.

2. **Indicators of Compromise (IOCs)**:
   - IOCs are pieces of forensic data, such as system log entries or files, that identify potentially malicious activity on a system or network.
   - They are reactive, as they are often identified after an attack has taken place, and are used to find other systems across the network that may have been compromised.
   - Examples of IOCs include known malicious IP addresses, domain names, URLs, file hashes, or strange files and registry keys.
   - IOCs are often used in signature-based detection systems, which rely on a database of known threats to identify attacks.

