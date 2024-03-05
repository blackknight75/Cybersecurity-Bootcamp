# Firewalld

Firewalld is a dynamic firewall management tool for Linux systems that provides a more user-friendly interface for managing firewall rules compared to the traditional iptables command. It is the default firewall solution in many modern Linux distributions, including CentOS, Fedora, and RHEL.

1. **Check the Status of Firewalld:**
   ```bash
   sudo firewall-cmd --state
   ```
   This command checks the status of firewalld, whether it's running or not.

2. **Enable Firewalld:**
   ```bash
   sudo systemctl start firewalld
   ```
   This command starts the firewalld service.

3. **Disable Firewalld:**
   ```bash
   sudo systemctl stop firewalld
   ```
   This command stops the firewalld service.

4. **Add a Service to the Firewall:**
   ```bash
   sudo firewall-cmd --add-service=<service_name> --permanent
   ```
   This command adds a service to the firewall rules. Replace `<service_name>` with the name of the service (e.g., http, ssh).

5. **Remove a Service from the Firewall:**
   ```bash
   sudo firewall-cmd --remove-service=<service_name> --permanent
   ```
   This command removes a service from the firewall rules. Replace `<service_name>` with the name of the service.

6. **Open a Port:**
   ```bash
   sudo firewall-cmd --add-port=<port_number>/tcp --permanent
   ```
   This command opens a specific TCP port in the firewall. Replace `<port_number>` with the port number you want to open.

7. **Close a Port:**
   ```bash
   sudo firewall-cmd --remove-port=<port_number>/tcp --permanent
   ```
   This command closes a specific TCP port in the firewall. Replace `<port_number>` with the port number you want to close.

8. **Reload Firewalld:**
   ```bash
   sudo firewall-cmd --reload
   ```
   This command reloads the firewall configuration without interrupting active connections.

9. **List All Zones:**
   ```bash
   sudo firewall-cmd --get-zones
   ```
   This command lists all available zones in firewalld.

10. **Change Zone for an Interface:**
    ```bash
    sudo firewall-cmd --zone=<zone_name> --change-interface=<interface_name> --permanent
    ```
    This command changes the zone for a specific network interface. Replace `<zone_name>` with the desired zone and `<interface_name>` with the name of the network interface.

### `--permanent`

The `--permanent` option in firewalld commands is used to make changes to the firewall configuration permanent. When you make changes to the firewall configuration without the `--permanent` option, those changes are applied immediately but not saved permanently. They are only active until the next system reboot.

Using the `--permanent` option with firewalld commands ensures that the changes you make to the firewall configuration are persistent across reboots. These changes are saved to the permanent configuration files on disk and remain in effect even after system restarts.

### `--state`

The `--state` option in the firewall-cmd command is used to check the current state of the firewalld service. When you run firewall-cmd `--state`, it provides information about whether the firewalld service is running or not.

Here's a breakdown of how the `--state` option works:

`Running`: If the firewalld service is running, the command will return running.

`Not running`: If the firewalld service is not running, the command will return not running.
