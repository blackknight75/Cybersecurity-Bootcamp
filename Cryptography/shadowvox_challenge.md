## **Codename: Sh@d0wV0x**  

  
### :mag: **Mission: Cryptographic Conundrum** :mag:  
**Classified Briefing:** *February 20th 6:07 PM*  
  
Agents,  
  
In the shadows of the digital realm, a cryptic message has been intercepted. Encrypted with layers of complexity, this document holds secrets that could tilt the balance of power. Your mission, should you decide to embark upon it, involves deciphering the unknown - unlocking the encrypted note that has been securely passed to you.

**Objective:**  
Your task is to penetrate the veil of secrecy by identifying the correct key and Initialization Vector (IV). These are the critical pieces needed to decrypt the note and reveal its hidden message.

We were given these 3 strings. The meaning and purpose of these strings are currently unknown, but intelligence suggests they are imperative for the success of your operation. You will need to employ all available resources and expertise to uncover their significance and how they can be leveraged to achieve your objectives.

The Research & Development wing, in anticipation of such encrypted challenges, has engineered a groundbreaking tool designed to assist in the decryption process. However, this tool awaits your prowess to fulfill its purpose. Without the Key and IV, it remains a dormant arsenal in our intelligence toolkit.

This message will self-destruct in five seconds. Good luck, Agent. The fate of the mission rests in your hands. :dark_sunglasses::briefcase::unlock:

---
#### Intercepted Message
> 2kXjwg1f2pFglEgiRTtonnbd3oSzgmC/7VOXYsTK7cN8YVKGVo6hKwx0ORI09odW
/yRYfyKm1jeBBDnxifWz8iCwJoVlmAylgx2aKLn5iSZ0acwvxWWaACvpXdvJ8ge+
ThDjxkTa9YB0ctVdvy1j/n2Mm9DXwi6rhPrItRaVk6bBpU+LkGOEZRoXq5czW94q
4Wg7Tc670cHdlveW/jBCjas9VfKq4diazbZuEoL7zlmvqLUMd52HiIyw1KTqTSDF
n6j4eYAUSzF0DP9iNuEV5xjqSnhtbUb6joj8U19JfG7UN0owgMjIbk9vZmu7QVeM
ocq/uAcMkXBKfQ5g1XeuNZ6ML1gjBLoGfQctHfUsBV/7m1JnhMGtQaXqp0kEqDc6
Pjv9iQZBcPhOyLioWHIY7nDvpyTh3ssFyL/OUUuAv596c+m9eKR7N5aS3TM9aoOK
iOGCR0zDWfr6E1/REELHGJZ0NFp/2bawY9bMu3UsRXaXZ505FH4ZE3PqYMlXlBwJ
zDVjLCBjO5Fha5xyWDTjODXsAsUdhzLhVAhWyePDx0D6nf3+rSbpzA9/b25Gd1W2
ys3wemhb9TMKcERKw0Z0hsVC9baWllZzkCIN3DZD3za9zedXe7TfeT07tjGNxBan
y0FgfGkWQB6uaAOC/nEZcA0bi1wzYBNlvAOE14tCmAUpNL68lc399ceGnoCD+vCQ
+M+Xh9Q1Zk2CVIhwQz9LM4Dmnd1/JVqfQNVpNHxDQ8CqA1UulDywI/7Sw1vhdYrn
Dio43sdWoMoYKV+vbyu4S94Z3t9k5BfdoFrAeoaRILEtD06gKRpiV9eiHGh+VlGH
---

#### Mysterious Strings
`
69 76 20 3d 36 42 37 46 30 43 34 30 36 32 39 37 46 30 44
`  
  
`
72 6c 36 3d 4c 38 38 39 61 61 39 66 62 38 62 67 4c 63 64 38 30 4a 4b 64 63 4c 66 48 62 38 38 39 30 61 64 67 66 30 49 4b 49 63 48 4a 49 4d 67 4a 65 67 39 38 48 49 48 4c 39 66 65 65 38 38 30 67 49 39 38 67
`  

`
00111001 00110000 01000101 00110011 01000010 01000100 00110110 00110101 01000001 01000100 00110001 01000110 01000010 00111001 00110100 01000010 01000001
`  

---

#### OpenSSL Tool 
[https://github.com/blackknight75/Cybersecurity-Bootcamp/blob/main/Cryptography/openssl_tool.sh](https://github.com/blackknight75/Cybersecurity-Bootcamp/blob/main/Cryptography/openssl_tool.sh)

**Manual Decrypt**
```bash
openssl enc -pbkdf2 -nosalt -aes-256-cbc -in <file-to-decrypt.txt> -d -base64 -K <key> -iv <iv>
```
