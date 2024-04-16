# Top Linux Files To Harvest In LINUX

When performing security assessments, penetration tests, or digital forensics on a Linux system, certain files are particularly valuable due to the sensitive or useful information they can contain. Here are ten important files or types of files that security professionals often target for their potential to reveal insights about the system, its configuration, and its users:

| File/Directories | Description |
|------------------|-------------|
| `/etc/shadow`    | Contains hashed passwords for the users listed in `/etc/passwd`. Access is restricted to privileged users. |
| `~/.ssh/`        | Directory containing SSH keys and known hosts. Includes sensitive private keys (`id_rsa`, `id_dsa`, etc.) and the `authorized_keys` file. |
| `/etc/sudoers`   | Defines which users/groups can execute commands as other users (typically as root) via `sudo`. |
| `/root/.bash_history` or `~/.bash_history` | Records command history for the root user or other users, potentially revealing sensitive operations, scripts, or mistakes. |
| `/var/log/auth.log` or `/var/log/secure` | Contains system authorization information, including authentication logs for system usage such as login attempts and sudo entries. |
| `/etc/passwd`    | Contains information about all user accounts on the system. Lists user IDs, home directories, shells, and other details. |
| `/etc/group`     | Lists all groups on the system and the users belonging to those groups. Provides insight into privilege levels and user organization. |
| `/etc/network/interfaces` or `/etc/sysconfig/network-scripts/` | Contains network interface configuration details, revealing how a system is connected and its network settings. |
| `/var/www/html/` | Default document root directory for Apache web server, usually contains web applications and their data. |
| `/var/spool/cron/crontabs/` | Contains user-defined cron jobs, which can reveal scheduled tasks and potentially exploitable scripts. |
| `/etc/apache2/apache2.conf` (or `httpd.conf` for other distributions) | Primary configuration file for Apache web server, revealing settings that dictate server behavior. |
| `/var/log/dmesg` | Contains kernel-related messages useful for understanding underlying hardware or planning further attacks. |
| `/etc/hosts`     | Contains mappings of IP addresses to hostnames, potentially indicating network spoofing or redirections. |
| `/etc/resolv.conf` | Contains DNS client configuration, including primary and secondary DNS servers, crucial for network configuration. |
| `/proc/cpuinfo`  | Provides detailed information about the CPU, such as its model, make, number of cores, and speed. |
| `/proc/meminfo`  | Shows memory usage statistics including total memory, free memory, and memory used for buffers. |
| `/etc/mtab`      | Lists all currently mounted filesystems along with their mount options. Useful for understanding filesystem architecture. |
| `/etc/issue`     | Displays a system identification text before the login prompt, revealing OS version info that can be useful for banner grabbing. |
| `/home/*/.gnupg/`| Directory containing user's GPG encryption keys and configurations. Can reveal sensitive encryption settings and keys. |
| `/var/lib/dpkg/status` (Debian-based) or `/var/lib/rpm/Packages` (RPM-based) | Lists all software packages installed on the system along with version info, used for package management. |
