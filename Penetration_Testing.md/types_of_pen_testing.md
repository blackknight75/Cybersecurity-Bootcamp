# Types Of Penetration Testing

Penetration testing, often referred to as "pen testing" or "ethical hacking," is a simulated cyber attack against your computer system to check for exploitable vulnerabilities. This is in contrast to a real cyberattack, which is unauthorized and malicious. The primary objective of penetration testing is to identify security weaknesses. It can also be used to test an organization's security policy compliance, its employees' security awareness, and the organization's ability to identify and respond to security incidents. Penetration tests are typically performed using manual or automated technologies to systematically compromise servers, endpoints, web applications, wireless networks, network devices, mobile devices, and other potential points of exposure.

There are three main types of penetration testing, distinguished primarily by the breadth of knowledge shared with the tester about the systems being tested:

1. **White Box Penetration Testing (Full View)**:
   - **Description**: White Box penetration testing is also known as clear box testing, glass box testing, transparent box testing, and open box testing. In this approach, the penetration tester is given full knowledge of the network and systems they are testing. This includes network maps, IP addresses, source code, and credentials. The objective is to simulate an attack that could be carried out by an internal source or with an in-depth understanding of the system, such as a rogue employee or a hacker that has obtained detailed information about the network.
   - **Advantages**: Allows for a thorough test of the application's logic and flow, and the tests can be more targeted and quicker since the tester knows exactly where to look.
   - **Disadvantages**: It might not accurately represent real-world attacks from external attackers who wouldn't have this information.

2. **Gray Box Penetration Testing (Partial View)**:
   - **Description**: Gray Box penetration testing represents a partial knowledge scenario. The tester has some information about the systems they are testing, which could simulate an attack by someone with limited inside knowledge or by an external attacker who has managed to gather some information about the system. This could include basic network layouts, user IDs (but not passwords), or any information that could be obtained through web application reconnaissance.
   - **Advantages**: It provides a realistic scenario of how an actual attack could occur, offering a balance between white box and black box testing.
   - **Disadvantages**: It may not uncover all the vulnerabilities that a white box test could, nor does it fully simulate an uninformed attacker's approach like a black box test.

3. **Black Box Penetration Testing (No View)**:
   - **Description**: Black Box penetration testing is when the tester has no prior knowledge of the network or system being tested. This approach simulates an external hacking or cyberattack and aims to find vulnerabilities and weaknesses through discovery and exploitation efforts similar to those used by attackers with no inside information.
   - **Advantages**: It simulates a real-world attack scenario from the perspective of an outsider, which can help identify what information is publicly available about the system that could be used in an attack.
   - **Disadvantages**: This method can be time-consuming and less efficient since the tester is starting without any information. It might not identify all vulnerabilities, especially those that would require internal network access to discover.

Each type of penetration testing has its distinct purposes, advantages, and disadvantages, making them suitable for different testing scenarios. The choice between them depends on the specific objectives of the test, the resources available, and the nature of the system or network being tested.
