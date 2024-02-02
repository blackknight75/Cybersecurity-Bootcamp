| Command | Bash Shell | CMD | PowerShell |
|---------|------------|-----|------------|
| Archive Files without Compression | `tar -cvf archive_name.tar /path/to/directory` | N/A | New-Item -Path 'archive_name.tar' -ItemType File |
| Change Directory | `cd` | `cd` | Set-Location or `cd` |
| Change File Permissions | `chmod` | N/A | Set-ACL |
| Check Disk Space | `df` | `chkdsk` | Get-PSDrive |
| Check for Open Ports | `netstat -tuln` | `netstat -an` | Get-NetTCPConnection |
| Check if a Program Exists | `which program_name` | `where program_name` | Get-Command `program_name` |
| Compare Two Files | `diff file1 file2` | `fc file1 file2` | Compare-Object (Get-Content file1) (Get-Content file2) |
| Compress Files | `tar -czvf` | N/A | Compress-Archive |
| Copy Files | `cp` | `copy` | Copy-Item or `cp` |
| Create Directory | `mkdir` | `mkdir` | New-Item -ItemType Directory or `mkdir` |
| Decompress Files | `tar -xzvf` | N/A | Expand-Archive |
| Delete Files | `rm` | `del` | Remove-Item or `rm` |
| Display Current Directory | `pwd` | `cd` | Get-Location or `pwd` |
| Display File Content | `cat` | `type` | Get-Content or `cat` |
| Display Network Configuration | `ifconfig` or `ip addr` | `ipconfig` | Get-NetIPConfiguration |
| Download a File from the Internet | `wget` or `curl` | N/A | Invoke-WebRequest |
| Edit a File in Terminal | `nano or vim file_name` | Not directly possible, use notepad or similar | notepad file_name or use ISE |
| Execute a Command in Background | `command &` | `start /b command` | Start-Job -ScriptBlock { `command` } |
| Find Files | `find` | `dir /s` | Get-ChildItem -Recurse or `ls -Recurse` |
| Get Current User | `whoami` | `echo %USERNAME%` | `whoami` |
| Get Environment Variable | `echo $VAR` | `echo %VAR%` | Write-Output `$env:VAR` |
| Get IP Address | `hostname -I` | `ipconfig` | Get-NetIPAddress |
| Get System Information | `uname -a` or `lsb_release -a` | `systeminfo` | Get-ComputerInfo or Get-WmiObject Win32_OperatingSystem |
| Kill a Process | `kill` | `taskkill` | Stop-Process |
| List All Running Services | `service --status-all` | `net start` | Get-Service |
| List Directory Contents | `ls` | `dir` | Get-ChildItem or `ls` |
| List Network Interfaces | `ifconfig -a or ip link show` | `ipconfig /all` | Get-NetAdapter |
| Monitor System Activity | `top` | N/A | Get-Process \| Sort-Object CPU -Descending |
| Move Files | `mv` | `move` | Move-Item or `mv` |
| Mount a File System | `mount /dev/sdX /path/to/mount_point` | N/A | New-PSDrive -Name 'DriveName' -PSProvider FileSystem -Root '\\Server\Share' |
| Print Text to Console | `echo` | `echo` | Write-Output |
| Print Working Directory | `pwd` | `cd` | Get-Location |
| Read Input from User | `read varname` | `set /p varname=` | `$varname = Read-Host` |
| Redirect Output to File | `> or >>` | `> or >>` | Out-File -FilePath |
| Remove Directory | `rmdir` | `rmdir /s` | Remove-Item -Recurse or `rm -Recurse` |
| Restart a Service | `service name restart` | `net stop service_name && net start service_name` | Restart-Service -Name service_name |
| Schedule a Job | `cron jobs` | `schtasks` | New-ScheduledTask |
| Search File Content | `grep 'search_term' file_name` | `findstr 'search_term' file_name` | Select-String -Path file_name -Pattern 'search_term' |
| Set Environment Variable | `export VAR=value` | `set VAR=value` | `$env:VAR = 'value'` |
| Show Available RAM | `free -m` | `systeminfo \| findstr /C:"Available Physical Memory"` | Get-CimInstance Win32_PhysicalMemory \| Measure-Object Capacity -Sum |
| Show Disk Usage by Directory | `du -h --max-depth=1` | N/A | Get-ChildItem -Path 'directory' -Recurse \| Measure-Object -Property Length -Sum |
| Show System Date and Time | `date` | `date /t && time /t` | Get-Date |
| Unmount a File System | `umount /path/to/mount_point` | N/A | Remove-PSDrive -Name 'DriveName' |
| Update System Packages | `apt-get update; apt-get upgrade` | N/A | Update-Package |
| View Running Processes | `ps` | `tasklist` | Get-Process |
