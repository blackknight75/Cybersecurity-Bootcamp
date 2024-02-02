# WMIC Aliases

In WMIC (Windows Management Instrumentation Command-line), aliases are used as shorthand to reference WMI classes that represent various system components and data. These aliases allow users to perform operations without needing to know the underlying WMI class names. Below is a comprehensive list of common aliases available in WMIC, which can be used to query or manipulate different aspects of the Windows operating system:

- **`ALIAS`**: Lists information about WMIC aliases.
- **`BASEBOARD`**: Provides information related to the motherboard.
- **`BIOS`**: Gives details about the system BIOS.
- **`BOOTCONFIG`**: Configuration details of the system boot settings.
- **`CDROM`**: Information about CD-ROM drives.
- **`COMPUTERSYSTEM`**: Details about the computer system and its configuration.
- **`CPU`**: Details about the central processing unit(s).
- **`DATAFILE`**: Information on data files, akin to performing file searches.
- **`DCOMAPP`**: Information on DCOM (Distributed Component Object Model) applications.
- **`DESKTOP`**: User desktop configuration details.
- **`DESKTOPMONITOR`**: Information on desktop monitors.
- **`DEVICEMEMORYADDRESS`**: Memory address range details for devices.
- **`DISKDRIVE`**: Information about physical disk drives.
- **`DISKQUOTA`**: Details on disk quotas for users.
- **`DMA`**: Direct Memory Access (DMA) channels information.
- **`ENVIRONMENT`**: Environment variables for the system or user.
- **`GROUP`**: User groups information.
- **`IDECONTROLLER`**: Information about IDE controllers.
- **`IRQ`**: Details about hardware IRQ (Interrupt Request) settings.
- **`JOB`**: Information on scheduled jobs.
- **`LOADORDER`**: Service load order groups.
- **`LOGICALDISK`**: Details about logical disks (drives).
- **`LOGON`**: Logon session information.
- **`MEMCACHE`**: Memory cache information.
- **`MEMORYCHIP`**: Physical memory chip information.
- **`MEMPHYSICAL`**: Overall physical memory information.
- **`NETCLIENT`**: Network client information.
- **`NETLOGIN`**: Network login profiles (for a user).
- **`NETPROTOCOL`**: Network protocols information.
- **`NETUSE`**: Active network connections.
- **`NIC`**: Network interface controller information.
- **`NICCONFIG`**: Network interface configuration, including IP.
- **`NTDOMAIN`**: NT domain information.
- **`NTEVENT`**: Windows event log entries.
- **`NTEVENTLOG`**: Event log configurations.
- **`ONBOARDDEVICE`**: Information on devices integrated on the motherboard.
- **`OS`**: Operating system details.
- **`PAGEFILE`**: Virtual memory pagefile settings.
- **`PAGEFILESET`**: Page file configurations.
- **`PARTITION`**: Disk partition information.
- **`PORTCONNECTOR`**: Physical port connector information.
- **`PRINTER`**: Printer device information.
- **`PRINTERCONFIG`**: Printer configuration.
- **`PRINTJOB`**: Active print jobs.
- **`PROCESS`**: Running processes information.
- **`PRODUCT`**: Installed software products.
- **`QFE`**: Quick Fix Engineering (Windows Update and hotfixes).
- **`QUOTASETTING`**: Disk quota settings.
- **`RDACCOUNT`**: Remote desktop permitted user accounts.
- **`RDNIC`**: Remote desktop network interface configuration.
- **`RECOVEROS`**: Recovery and debugging settings.
- **`REGISTRY`**: Windows registry information.
- **`SCSICONTROLLER`**: SCSI controller information.
- **`SERVER`**: Information on the server service.
- **`SERVICE`**: System services information.
- **`SHARE`**: Network shares information.
- **`SOFTWAREELEMENT`**: Software element (component) information.
- **`SOFTWAREFEATURE`**: Installed software features.
- **`SOUNDDEV`**: Sound device information.
- **`STARTUP`**: Programs that run at system startup.
- **`SYSACCOUNT`**: System user accounts.
- **`SYSDRIVER`**: System drivers information.
- **`SYSTEMENCLOSURE`**: Physical system enclosure details.
- **`SYSTEMSLOT`**: System slot information.
- **`TAPEDRIVE`**: Tape drive information.
- **`TEMPERATURE`**: Temperature probe readings (if available).
- **`TIMEZONE`**: System time zone information.
- **`UPS`**: Uninterruptible Power Supply (if present) information.
- **`USERACCOUNT`**: User account details.
- **`VOLTAGE`**: Voltage probe readings (if available).
- **`VOLUME`**: Volume (disk) information.
- **`VOLUMEQUOTASETTING`**: Volume quota settings.
- **`VOLUMEUSERQUOTA`**: User quota information on a volume.

#### To get a list of all aliases directly from WMIC, open Command Prompt and enter:

```cmd
wmic alias list brief
```
*This command displays all available aliases along with a brief description of each.*

## Top 10 Common Uses of WMIC Aliases
Here are the top 10 common uses of WMIC aliases, providing quick and efficient access to system information and management tasks:

### 1. View System Information
- Using the `COMPUTERSYSTEM` alias, you can quickly get detailed information about your computer system. 

```cmd
wmic computersystem get manufacturer, model, name, numberofprocessors, systemtype
```

### 2. Check BIOS Version
- The `BIOS` alias allows you to retrieve information about the system BIOS, including the manufacturer and version.

```cmd
wmic bios get manufacturer, smbiosbiosversion
```

### 3. List Installed Software
- With the `PRODUCT` alias, you can list all installed software on a machine, which is useful for inventory or audit purposes.

```cmd
wmic product get name, version
```

### 4. Monitor Disk Space
- The `LOGICALDISK` alias provides information about disk drives, including free space, which is crucial for system monitoring.

```cmd
wmic logicaldisk get name, freespace, size, volumename
```

### 5. Query CPU Information
- Using the `CPU` alias, you can gather detailed information about the CPU(s) installed in the system.

```cmd
wmic cpu get name, caption, maxclockspeed, status
```

### 6. Manage Processes
- The `PROCESS` alias is used to list or terminate processes. This is particularly useful for script-based automation or when dealing with unresponsive applications.

```cmd
wmic process list brief
wmic process where name="notepad.exe" delete
```

### 7. Check Memory Usage
- With the `MEMPHYSICAL` alias, you can get an overview of the physical memory (RAM) installed in the system.

```cmd
wmic memphysical get maxcapacity, memorydevices
```

### 8. View Network Adapter Configurations
- The `NICCONFIG` alias lets you view and modify network adapter settings, including IP addresses.

```cmd
wmic nicconfig get caption, ipaddress, macaddress
```

### 9. Get Service Status
- The `SERVICE` alias allows you to query the status of system services, enabling quick troubleshooting or system checks.

```cmd
wmic service get name, state, startmode
```

### 10. Retrieve User Account Information
- Using the `USERACCOUNT` alias, you can list user accounts, check account status, and even modify properties.

```cmd
wmic useraccount get name, disabled, passwordrequired, status
```

These common uses of WMIC aliases demonstrate the tool's versatility in handling a wide range of system management tasks. By leveraging these commands, you can efficiently perform system diagnostics, monitoring, and configurations directly from the command line.



