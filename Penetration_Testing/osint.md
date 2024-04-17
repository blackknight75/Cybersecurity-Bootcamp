# OSINT

OSINT, or Open Source Intelligence, refers to the collection and analysis of information that is gathered from publicly available sources. This is used in a variety of fields such as security, law enforcement, and competitive business analysis, to gather actionable insights without direct access to private or classified sources. Here are ten common techniques used in OSINT:

1. **Public Records:** This includes accessing government databases, court records, and public government reports to gather information about individuals or companies.
2. **Social Media Monitoring:** Analyzing information shared on platforms like Facebook, Twitter, LinkedIn, and Instagram to gather intelligence on individuals’ activities and connections.
3. **Web Scraping:** Automatically extracting data from websites. This can include news outlets, forums, and commercial websites.
4. **Satellite Imagery:** Analyzing images from satellite providers for geographical information and to monitor changes over time in specific locations.
5. **Domain Name and IP Research:** Using tools to look up domain registration details, IP addresses, associated websites, and server information.
6. **Reverse Image Searching:** Using an image to search for related images or to find the source of an image.
7. **Data Breaches:** Analyzing information from past data breaches to find sensitive data that can be used in further analysis.
8. **Online Marketplaces:** Monitoring e-commerce sites and online marketplaces to gather information on products, trends, and pricing.
9. **Forums and Blogs:** Searching through discussion boards and blogs for user-generated content that may provide insights on a wide range of topics.
10. **Network Sniffing:** Monitoring network traffic accessible from public or semi-public networks to capture data being transmitted.

### Specific OSINT Tools

**Google Dorking:**
Google Dorking (also known as Google hacking) is a technique that uses advanced search queries to find specific information in Google's search engine that is not easily accessible through simple searches. These queries can use operators such as `site:`, `filetype:`, `inurl:`, etc., to filter search results more effectively. For instance, using `filetype:pdf site:example.com` to find all PDF files hosted on a particular domain.

**Shodan:**
Shodan is a search engine that helps users to find specific types of internet-connected devices (webcams, routers, servers, etc.) across the world. Unlike Google, which searches the web, Shodan scans for internet-connected devices, making it possible to find devices that are online and accessible. Shodan queries can reveal devices such as traffic lights, security cameras, home heating systems, and control systems for major infrastructure.

**Certificate Transparency:**
Certificate Transparency (CT) involves the use of public logs to record SSL certificates issued by certificate authorities. It enhances security by allowing anyone to audit SSL certificates and verify whether the certificates are legitimate. This is crucial for preventing man-in-the-middle attacks where a fake certificate could be used to intercept or modify data. Users can search these logs to find any certificates issued for their domain, potentially discovering malicious issued certificates.

These tools and techniques represent just a part of what's available in the realm of OSINT, highlighting the diverse methods and resources available for gathering information from open sources.
