# SSH with MFA

Enabling Multi-Factor Authentication (MFA) on SSH involves configuring the SSH server to prompt users for an additional factor of authentication besides their password. This can be achieved using tools like Google Authenticator or LastPass Authenticator. Below are the steps to enable MFA on SSH with both Google Authenticator and LastPass Authenticator. The steps provided below should be executed on the target machine where you want to enable MFA for SSH.

Here's a brief overview of the steps involved:

1. **Install the Authenticator App on Your Mobile Device:**
   - Install Google Authenticator or LastPass Authenticator on your mobile device.

2. **Configure MFA on the Target Machine:**
   - Install the necessary packages (`libpam-google-authenticator` for Google Authenticator or `libpam-lpass` for LastPass Authenticator) on the target machine.
   - Configure the authenticator app by running `google-authenticator` or setting up LastPass Authenticator on the target machine.
   - Modify the SSH configuration (`/etc/pam.d/sshd`) on the target machine to enable MFA.

3. **Restart the SSH Service:**
   - Restart the SSH service on the target machine to apply the changes.

By completing these steps on the target machine, you enable MFA for SSH, which requires users to provide an additional authentication code from their authenticator app after entering their password when connecting via SSH.

### Enabling MFA with Google Authenticator:

1. **Install Google Authenticator:**
   - Install the Google Authenticator package on your server:
     ```
     sudo apt update
     sudo apt install libpam-google-authenticator
     ```

2. **Configure Google Authenticator:**
   - Run the following command as the user for whom you want to enable MFA:
     ```
     google-authenticator
     ```
   - Follow the on-screen prompts to configure Google Authenticator. This includes scanning a QR code or entering a secret key into the Google Authenticator app on your mobile device.

3. **Modify SSH Configuration:**
   - Edit the SSH configuration file:
     ```
     sudo nano /etc/pam.d/sshd
     ```
   - Add the following line at the end of the file:
     ```
     auth required pam_google_authenticator.so
     ```

4. **Restart SSH Service:**
   - Restart the SSH service to apply the changes:
     ```
     sudo systemctl restart sshd
     ```

### Enabling MFA with LastPass Authenticator:

1. **Install LastPass Authenticator:**
   - Install the LastPass Authenticator app on your mobile device from the App Store or Google Play Store.

2. **Install PAM Module for LastPass Authenticator:**
   - Install the `libpam-lpass` package, which provides the PAM module for LastPass Authenticator:
     ```
     sudo apt update
     sudo apt install libpam-lpass
     ```

3. **Configure LastPass Authenticator:**
   - Add a new account in the LastPass Authenticator app by scanning the QR code or entering the secret key provided during the setup process.

4. **Modify SSH Configuration:**
   - Edit the SSH configuration file:
     ```
     sudo nano /etc/pam.d/sshd
     ```
   - Add the following line at the end of the file:
     ```
     auth required pam_lpass.so
     ```

5. **Restart SSH Service:**
   - Restart the SSH service to apply the changes:
     ```
     sudo systemctl restart sshd
     ```

With these configurations in place, SSH will prompt users for an additional authentication code from their respective authenticator app after they enter their password, thus enabling MFA for SSH.
