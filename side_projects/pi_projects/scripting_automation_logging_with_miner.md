## Objective

Develop a Monero mining application with an accompanying script that ensures its continuous operation. Using what we have learned in this bootcamp so far, the script will check the miner's status, restart it if necessary, and log activities for monitoring purposes. Additionally, the script will be scheduled to run at regular intervals using Cron and rotating logs to reduce disk usage.

##### Disclaimer: Financial and Crypto Investment Risks

*Please note that the content provided here is for informational purposes only and should not be construed as financial, investment, tax, legal, or other types of advice. Cryptocurrency investments carry a high level of risk and are subject to market volatility. Prices can fluctuate significantly in a very short period of time, potentially leading to substantial losses. Before making any investment decisions, it is crucial to conduct your own thorough research and consider your financial situation, investment objectives, and risk tolerance. It may also be beneficial to consult with a qualified financial advisor to ensure that your investment strategies are aligned with your financial goals and risk profile. Investing in cryptocurrencies is not suitable for all investors, and there is no guarantee of return. Past performance is not indicative of future results. You should only invest money that you are prepared to lose. By making any investment, you acknowledge and accept the inherent risks, including the potential loss of principal.

### Watch Chuck's video to setup the miner. 
https://www.youtube.com/watch?v=hHtGN_JzoP8

### Check Miner Process Name

The process name should be `xmrig` and the executable for your start command should be located in the `home/user/xmrig/build` directory if you followed the instructions in the Chuck video.

The process name for a Monero miner can vary depending on the specific mining software you are using. Monero mining can be performed using various miners, such as `XMRig`, `XMR-STAK`, `MinerGate`, among others. Each of these miners has its own executable and, consequently, its own process name when running. Here are some common examples:

- **XMRig**: The process name is usually `xmrig`, unless it has been renamed or is running from a custom script.
- **XMR-STAK**: The process name could be `xmr-stak`, `xmr-stak-rx`, or similar, depending on the version.
- **MinerGate**: If using MinerGate, the process might be named something related to `minergate`.

If you don't know the name of the process and xmrig doesn't work you can try launching your miner and then opening a separate ssh terminal and check the process list with the `top` command.

```bash
top
```

![xmrig process](https://raw.githubusercontent.com/blackknight75/Cybersecurity-Bootcamp/main/side_projects/assets/xmrig_process.png)

```bash

#!/bin/bash

# The command to start your miner process. Adjust this to your specific command.
START_COMMAND="/home/user/xmrig/build/xmrig -o gulf.moneroocean.stream:10128 -u <your wallet address here> -p <name your worker here>"

# Process name to check if it's running. Adjust this to match your miner's process name.
PROCESS_NAME="xmrig"

if ! pgrep -x "$PROCESS_NAME" > /dev/null
then
    echo "Miner is not running. Starting miner..."
    $START_COMMAND
else
    echo "Miner is already running."
fi

```

### Start Command Variable Breakdown

```bash
START_COMMAND="/home/user/xmrig/build/xmrig -o gulf.moneroocean.stream:10128 -u <your wallet address here> -p <name your worker here>"
```
This is a typical way to start the `xmrig` mining software with specific options for mining Monero (or other compatible cryptocurrencies) through a mining pool. Let's break down the command and its options:

- `/home/user/xmrig/build/xmrig`: This specifies the path to the `xmrig` executable. This path tells the system where to find the `xmrig` program on your computer. In this case, it's located in `/home/user/xmrig/build/`.

- `-o gulf.moneroocean.stream:10128`: The `-o` option specifies the mining pool's URL and port number. Here, `gulf.moneroocean.stream` is the address of the mining pool, and `10128` is the port number used for the connection. Mining pools are servers that coordinate the efforts of individual miners, combining their computational power to increase the chances of mining a block and receiving rewards.

- `-u <monero wallet address>`: The `-u` option is followed by your Monero wallet address. This is where your mining rewards will be sent. You should replace `<monero wallet address>` with your actual Monero wallet address.

- `-p monero_pi1`: The `-p` option is used for the password field required by many mining pools. In many cases, this field can be arbitrary or used to set worker names or identifiers. Here, `monero_pi1` could be a worker name or identifier for the mining rig. Some pools use this field for additional settings or to differentiate between multiple mining rigs under the same wallet address.
This command starts `xmrig`, directing it to mine using the `gulf.moneroocean.stream` pool on port `10128`, crediting rewards to the specified Monero wallet address, identifying the mining session with a custom identifier or worker name (`monero_pi1`).

### Checking For Process with `pgrep`

```bash
if ! pgrep -x "$PROCESS_NAME" > /dev/null
```
The `if` condition used in this shell script checks if a process with a specific name is not running on the system. Let's break down the command to understand how it works:

- `pgrep`: This is a command-line utility that searches for processes running on the system based on given criteria. It returns the process ID (PID) of matching processes.

- `-x`: This option tells `pgrep` to match the process name exactly. Without this option, `pgrep` might return processes whose names contain the given string as a substring. With `-x`, `pgrep` only returns processes whose names exactly match the string provided.

- `"$PROCESS_NAME"`: This is a variable that contains the name of the process you're searching for. The process name should be specified without any path. The double quotes are used to ensure that the variable is treated as a single argument, even if it contains spaces.

- `> /dev/null`: This part redirects the output of the `pgrep` command to `/dev/null`, which is a special file that discards all data written to it. Essentially, this hides the output of `pgrep` so it doesn't clutter the console. The primary purpose here is not to display the process IDs found by `pgrep`, but rather to use the command's exit status.

- `!`: This is a logical NOT operator used in shell scripts. It inverts the exit status of the command that follows it. Normally, `pgrep` returns a success status (exit status `0`) if it finds a matching process, and a failure status (non-zero exit status) if it doesn't. The `!` operator inverts this logic.

Putting it all together, the `if` condition checks if `pgrep` _cannot_ find a process with the exact name stored in `$PROCESS_NAME`. If `pgrep` does not find a matching process, it exits with a non-zero status, which is then inverted by `!` to a success status, causing the `if` block to execute. In other words, the code inside the `if` block is executed if the process named `$PROCESS_NAME` is not running. This is commonly used in scripts to start a process if it's not already running.

### Don't forget to add execute permissions
```bash
chmod +x monitor_miner.sh
```

### Schedule the Script
Use `Cron` to schedule this script to run at regular intervals (e.g., every 5 minutes).

Edit the crontab file:
```bash
crontab -e
```

Add a new line to the file to schedule your script:
```bash
*/5 * * * * /home/user/xmrig/monitor_miner.sh
```

This will run the script every 5 minutes. Adjust the path and timing as necessary.

### Modifying the Monitoring Script for Logging

Setup your log file directory
```bash
mkdir /home/user/miner_logs
```

### Updated Monitoring Script with Timestamped Log Files

```bash
#!/bin/bash

# Absolute path to log directory
LOG_DIR="/home/user/miner_logs"

# Current timestamp
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)

# Log file names with timestamp
SCRIPT_LOG="$LOG_DIR/miner_monitor_$TIMESTAMP.log"
XMRIG_LOG="$LOG_DIR/xmrig_$TIMESTAMP.log"

# The command to start your miner process. Adjust this to your specific command.
START_COMMAND="/home/user/xmrig/build/xmrig -o gulf.moneroocean.stream:10128 -u <monero wallet address> -p monero_pi1 -l $XMRIG_LOG"

# Process name to check if it's running. Adjust this to match your miner's process name.
PROCESS_NAME="xmrig"

# Log the checking process
echo "$(date) Checking for $PROCESS_NAME process." | tee -a "$SCRIPT_LOG"

if ! pgrep -x "$PROCESS_NAME" > /dev/null
then
    echo "$(date) $PROCESS_NAME is not running. Starting $PROCESS_NAME..." | tee -a "$SCRIPT_LOG"
    $START_COMMAND >> "$SCRIPT_LOG" 2>&1 &
else
    echo "$(date) $PROCESS_NAME is already running." | tee -a "$SCRIPT_LOG"
fi
```

This script now includes a timestamp in the log file names, creating unique logs for each instance it starts the `xmrig` process. The `tee -a` command is used to append the script's output to the script log file (`$SCRIPT_LOG`) and display it in the terminal. The `xmrig` miner's output is directed to its own timestamped log file (`$XMRIG_LOG`).

### Add Logging To Start Command Variable

`-l $XMRIG_LOG`: The `-l` option specifies the path to the log file where `xmrig` will write its output. The `$XMRIG_LOG` is a variable that should contain the full path to this log file. Logging to a file is useful for monitoring the miner's performance and troubleshooting issues, as it records the miner's output.
### Formatting the `date` Command
The `date` command is used to generate a timestamp string from the current date and time, and then assign it to a variable named `TIMESTAMP`. It utilizes the `date` command in Unix/Linux systems, which is a powerful tool for displaying or changing the system date and time. The formatting options (`+%Y-%m-%d_%H-%M-%S`) specify how the output should be structured.

- `date`: Invokes the date command, which by default outputs the current system date and time.
    
- `+%Y-%m-%d_%H-%M-%S`: Specifies the format for the output date and time string.
    
    - `%Y`: Represents the year in four digits (e.g., 2024).
    - `%m`: Represents the month as a two-digit number (01 to 12).
    - `%d`: Represents the day of the month as a two-digit number (01 to 31).
    - `_`: A literal underscore character used as a separator between the date and time parts.
    - `%H`: Represents the hour in 24-hour format as a two-digit number (00 to 23).
    - `%M`: Represents the minute as a two-digit number (00 to 59).
    - `%S`: Represents the second as a two-digit number (00 to 59).

The `$(...)` syntax is used for command substitution in shell scripting. It executes the command inside the parentheses and replaces it with the output of the command. In this case, it executes the `date` command with the specified format options and assigns the resulting string to the `TIMESTAMP` variable.

This formatted timestamp is often used in scripting to create filenames or log entries that include the exact date and time of creation or execution, making it easier to sort, identify, and track files or events chronologically.
#### `tee` Command

The `tee` command in Unix/Linux is used to read from the standard input and write to both standard output and one or more files simultaneously. When used in a command pipeline, `tee` ***allows you to divert a copy of the output stream to a file while also displaying it on the screen.***

Here's what each part does:

- `echo "$(date) Checking for $PROCESS_NAME process."` generates a string that includes the current date and a message about checking for the `$PROCESS_NAME` process. This string is sent to standard output (stdout).

- The `|` (pipe) takes the stdout from the `echo` command and passes it as input to the `tee` command.

- `tee -a "$SCRIPT_LOG"` takes the input from the pipe and does two things:

	- It appends (`-a` option) the input to the file specified by `$SCRIPT_LOG`. If the file doesn't exist, `tee` creates it. If it does exist, `tee` adds the input to the end of the file without overwriting the existing contents.
	- It also outputs the same input to the console, allowing you to see the message in real-time.

***The `-a` option is crucial here because without it, `tee` would overwrite the contents of `$SCRIPT_LOG` each time the command is run, instead of appending to it. By using `-a`, you ensure that all messages generated by this command are preserved in `$SCRIPT_LOG` in sequential order, providing a continuous log of the script's operations over time.

### Key Points:

- **Timestamps** are used to create unique filenames, preventing overwriting of log files and allowing easy identification of logs for specific runs.
- **Log Directory**: Ensure the specified directory exists (`/home/user/miner_logs`). Adjust the path as necessary for your environment.
- **Log Separation**: The script's activities and the `xmrig` process's output are logged separately, making it easier to troubleshoot and review logs.
- **Background Execution**: The `&` at the end of the `START_COMMAND` execution line ensures that the `xmrig` process runs in the background, allowing the script to complete and not hang waiting for `xmrig` to finish.

### Check Your Log Files

Ensure your script is properly logging files:

```bash
cd /home/user/miner_logs
ls -la

-rw-r--r-- 1 user group   126 Feb 12 20:30 miner_monitor_2024-02-12_20-30-01.log
-rw-r--r-- 1 user group   112 Feb 12 20:35 miner_monitor_2024-02-12_20-35-01.log
-rw-r--r-- 1 user group   112 Feb 12 20:40 miner_monitor_2024-02-12_20-40-01.log
-rw-r--r-- 1 user group 16883 Feb 12 21:10 xmrig_2024-02-12_20-30-01.log
```

Check contents of log files:

```bash
cat miner_monitor_2024-02-12_20-30-01.log

Mon 12 Feb 20:30:01 GMT 2024 Checking for xmrig process.
Mon 12 Feb 20:30:01 GMT 2024 xmrig is not running. Starting xmrig...
```

![miner logs](https://raw.githubusercontent.com/blackknight75/Cybersecurity-Bootcamp/main/side_projects/assets/miner_logs.png)

### BONUS: Rotate Your Logs With `logrotate`

To implement log rotation for the log files generated by your script, you can use the `logrotate` utility available on most Linux distributions. `logrotate` allows for automatic rotation, compression, removal, and mailing of log files. Each log file may be handled daily, weekly, monthly, or when it grows too large.

You'll need to create a configuration file for `logrotate` that specifies how to manage your log files. Here's how you can set it up for your mining logs:

### Create A Logrotate Configuration File

Create a new file named `miner_logs.conf` in the `/etc/logrotate.d/` directory. You'll need root permissions to create files in this directory.

```bash
sudo nano /etc/logrotate.d/miner_logs.conf
```

### Configure Log Rotation

```bash
/home/user/miner_logs/*.log {
    monthly
    missingok
    rotate 12
    compress
    notifempty
    create 660 <username> <groupname>
    dateext
}
```

This specific configuration manages the rotation of log files located in `/home/user/miner_logs/` with a `.log` extension. Here's a detailed explanation of each option within the configuration block:

1. **`monthly`**: This option specifies the frequency of log rotation. Despite the comment indicating daily rotation, the `monthly` setting means log files are rotated once a month.

2. **`missingok`**: If the log file does not exist, `logrotate` will not report an error. This option is useful for handling situations where a log file might not be generated for some reason (e.g., if the application hasn't been used and therefore hasn't produced any logs).

3. **`rotate 12`**: This tells `logrotate` to keep 12 old log files. When a log file is rotated, it's renamed and optionally compressed (based on other settings). Once there are 12 older versions of the log file, the oldest is deleted during the next rotation event. This ensures a maximum of 12 rotated log files are kept at any time, which corresponds to a full year of logs if combined with the `monthly` rotation frequency.

4. **`compress`**: After rotation, log files are compressed using gzip to save disk space. The compressed files will have a `.gz` extension added to their original filename.

5. **`notifempty`**: This prevents `logrotate` from rotating a log file if it is empty. It ensures that empty log files are not needlessly rotated and compressed, avoiding the creation of unnecessary empty compressed log files.

6. **`create 660 <username> <groupname>`**: After rotating a log file, `logrotate` will create a new log file with the specified mode (permissions), owner, and group. In this case, the new log file will have permissions set to `660` (read and write for the owner and group, no permissions for others), owned by the user `<username>`, and assigned to the group `<groupname>`. This ensures that new log files have the correct permissions for writing by the application and are secure.

7. **`dateext`**: This appends the date to the filename of the rotated log file instead of using a numeric sequence. The date format is `YYYYMMDD`, making it easy to identify when each log file was created based on its filename.

The configuration effectively manages log file rotation for the Monero miner logs, keeping the directory tidy and ensuring that disk space is not overwhelmed by uncompressed log files.

The backlogs (rotated and compressed log files) are stored in the same directory as the original log files, unless otherwise specified in the `logrotate` configuration. In the example provided, the original log files are located in `/home/user/miner_logs/`. Therefore, the rotated and compressed log files will also be stored in the `/home/user/miner_logs/` directory.

When `logrotate` rotates a log, it renames the current log file, often appending a date, sequence number, or a combination thereof to the file name, and then compresses it if compression is enabled (`compress` option). For instance, if you have a log file named `miner_monitor.log`, after rotation and compression (assuming the `dateext` option is used and compression is enabled), you might find a rotated log file named something like `miner_monitor_2024-02-10.log.gz` in the same directory.

It's important to ensure that the directory has enough storage space to accommodate the backlog files, especially if you're keeping multiple or large log files. If you need to store rotated logs in a different directory, you would typically handle that with a custom script in the `postrotate` section of your `logrotate` configuration, as `logrotate` itself does not directly support specifying a different directory for rotated files within its standard options.

### Test Your Logrotate

```bash
 sudo logrotate -v -d /etc/logrotate.d/miner_logs.conf
 
warning: logrotate in debug mode does nothing except printing debug messages!  Consider using verbose mode (-v) instead if this is not what you want.

reading config file /etc/logrotate.d/miner_logs.conf
Reading state from file: /var/lib/logrotate/status
Allocating hash table for state file, size 64 entries
Creating new state
Creating new state
Creating new state
Creating new state
Creating new state
Creating new state
Creating new state

Handling 1 logs

rotating pattern: /home/user/miner_logs/*.log  monthly (12 rotations)
empty log files are not rotated, old logs are removed
...
...
...
```

Logrotate is typically run by a cron job once a day. To ensure logrotate uses your configuration during its regular operation, no further action is required. The daily cron job for logrotate will automatically pick up your new configuration file and rotate the logs according to the rules you've specified.

This setup will manage your mining log files automatically, keeping them compressed and purged based on the criteria you set, thus saving disk space and making log management more efficient.

# Bonus #2 Add Discord Notifications

To send notifications from a Bash script to Discord, you can use Discord Webhooks in a similar manner to Slack. Discord Webhooks are a simple way to post messages to channels in Discord from external programs. Here's how you can set this up:

### Account Setup and Download

> ### Download
> *If you prefer not to install anything, you can access it through the web app.*  
> https://discord.com/

> ### Register for Account
> https://discord.com/register

### Create a Server
Creating a server in Discord is a straightforward process that can be done within the Discord app or web interface. Here's how to create a new server:
*On Desktop (Discord App or Web)*

- Open the Discord application on your desktop or navigate to the Discord web version in your browser and log in to your account.
- Add a Server:
	- Look for the `+` icon on the left side of the Discord interface, which is typically found at the bottom of your server list.
	- Click the `+` icon to start the process of creating a new server.
    
![Alt text](/side_projects/assets/create_plus.png) 
  
- You will be presented with an option to either join an existing server or create a new one. Select `Create My Own` for creating a new server.
   
![Alt text](/side_projects/assets/create_own.png)  
  
- Choose the purpose of your server (for me and my friends, for a club or community, etc.). This helps Discord set up default settings that might be relevant for your server's intended use.
  
![Alt text](/side_projects/assets/create_for_me.png)  
  
Enter a server name. You can also add a server icon by clicking on the circle on the left. The icon can be any image file that represents your server, but it's optional at this stage and can be added or changed later.  
  
![Alt text](/side_projects/assets/create_server_name.png)  
  
- Region Selection (if prompted):
	- Discord might automatically select the server region based on your location for optimal performance. However, Discord has been moving towards global servers with automatic region selection, so you might not need to manually choose a region.
- After setting up your server's name (and icon, if chosen), click `Create` to finalize the creation of your new server.

### Add a Channel

- Navigate to the server you created. It should be on the far left side.
- To create a new channel, find the `+` icon and click it.

![Alt text](/side_projects/assets/add_channel.png)  
  
- A menu will pop up asking for details about the new channel.
- Name: Enter the name of your channel.
- Channel Type: Select whether it's a text or voice channel.
- If applicable, you can also set permissions at this stage, deciding who can access the channel and what they can do within it.
  
![Alt text](/side_projects/assets/name_channel.png)  

### Create the Webhook

- Go to the settings of the channel where you want the notifications to be posted.

![Alt text](/side_projects/assets/channel_settings.png)  
  
- Find the `Integrations` tab.  
  
![Alt text](/side_projects/assets/integrations.png)  

- Then click on `Create Webhook`.

![Alt text](/side_projects/assets/create_webhook.png)  

- Give your webhook a name, and select the channel where messages will be posted. Click "Copy Webhook URL" once you're done and click `Save Shanges` at the bottom. Once saved click the `X ESC` at the top right.

![Alt text](/side_projects/assets/webhook_setup.png)  
  
# How Do I Get My Webhook URL???
> ## *If you've followed the steps without interruption, your webhook URL should be copied to your clipboard. If not, or if it's lost, revisit the steps above to find your webhook and click `Copy Webhook URL` again. This URL is necessary for subsequent script modifications.*
  
# Update Your Script to Communicate With Discord

- Log into Your Raspberry Pi or Linux Machine. You can do this directly using its interface or remotely via SSH, depending on your setup.

- Access the terminal on your Raspberry Pi or Linux machine. If you're using a desktop environment, you can usually find it in the menu under Accessories or System Tools.
Navigate to Your Script's Directory

- Use the cd command to change directories to the location of your mining script. Replace <directory> with the actual path where your script is stored.
  
```bash
cd <directory>
```
- Use the nano text editor to open your script for editing. Replace <script_name> with the name of your script file.

```bash
nano <script_name>.sh
```

- Add the Notification Code and Webhook URL. In the nano editor, navigate to the then section of the if statement where you want to add the Discord notification functionality.

- Insert the following curl command to send a notification. Make sure to replace <Your Discord Webhook URL> with your actual Discord webhook URL.

```bash
curl -H "Content-Type: application/json" \
     -X POST \
     -d "{\"content\": \"Xmrig is not running. Starting Xmrig\"}" \
     <Your Discord Webhook URL>
```
*Ensure this line is properly placed within the script logic where you want the notification to be triggered.*

### Curl Command Breakdown

The curl command is used to send a POST request to a specified webhook URL, which is a common way to programmatically interact with web services. This particular command is structured to send a notification message, indicating that the Xmrig mining process is not running and will be started. Let's break down this command to understand each of its components in detail:

`curl` is a command-line tool used to transfer data to or from a server. It supports a variety of protocols, including HTTP, HTTPS, FTP, and more. In this context, curl is used to make an HTTP POST request to a Discord webhook URL.  

`-H "Content-Type: application/json"` The -H option adds an HTTP header to the request. In this case, "Content-Type: application/json" specifies that the data being sent in the request is in JSON format. This header is important because it tells the server what kind of data to expect, and since Discord webhooks expect JSON data, this header is required for the request to be processed correctly.  

`-X POST` The -X option specifies the HTTP method to use when communicating with the server. POST is one of the standard HTTP methods used to submit data to be processed to a specified resource. In this scenario, you're using POST to send data to the webhook.  

`-d "{\"content\": \"Xmrig is not running. Starting Xmrig\"}"` The -d option is used to send data with the request. The data is enclosed in quotes and must be a valid JSON string. Here, you're constructing a JSON object with a single property, content, which contains the message you want to send: "Xmrig is not running. Starting Xmrig".

*It's important to note that the double quotes inside the JSON string are escaped with backslashes `\` to ensure the shell treats them as part of the JSON string, rather than interpreting them as shell syntax.*  

`<add your WEBHOOK URL here>` This part of the command should be replaced with the actual webhook URL you're sending the POST request to. Webhooks are user-defined HTTP callbacks, which are triggered by specific events. When you send a POST request to a Discord webhook URL, Discord processes the request and performs an action, such as sending a message to a specified channel on your Discord server.  

In summary, this curl command sends a JSON-formatted HTTP POST request to a Discord webhook URL. The request contains a message indicating that the Xmrig process is not running and will be started. This is a useful way to programmatically send notifications to a Discord channel, allowing for real-time alerts and updates based on specific events or conditions in your scripts or applications.

- After adding the notification code, save your changes in nano by pressing Ctrl-X, then press Y to confirm the changes, and Enter to save under the current script name.

## Testing

- It's a good idea to test the script to ensure the notification is sent as expected. You can do this by running the script manually from the terminal:

```bash
./<script_name>.sh
```
*Replace <script_name> with the name of your mining script. If everything is set up correctly, you should see the notification in your Discord channel when the script triggers the notification condition.*

If your script doesn't execute because the process it tries to start is already running, follow these steps to resolve the issue:

### Find Your Process ID (PID)

First, you need to identify the Process ID (PID) of the already running process. You can do this by using the pgrep command followed by the name of your process. For example, if your process is named xmrig, you would use:
```bash
pgrep xmrig
```

This command will output the PID(s) of the process(es) matching the name xmrig.

### Terminate the Process

Once you have the PID, you can terminate the process using the kill command followed by the PID you found in the previous step. For example, if the PID was 1234, you would use:

```bash
kill 1234
```

If the process doesn't terminate with a standard kill command, you might need to use kill -9 followed by the PID to forcefully terminate the process. However, use this option cautiously as it immediately stops the process without allowing it to clean up resources or save data.

```bash
kill -9 1234
```

### Run Your Script Again

With the process now terminated, you can be confident that it is not running. Go ahead and run your script again. Navigate to the directory where your script is located (if you're not already there) and execute it. For example, if your script is named miner_monitor.sh, you would run:

```bash
./miner_monitor.sh
```

This command assumes your script has the appropriate execute permissions. If it doesn't, you may first need to grant execute permissions to your script with the chmod command:

```bash
chmod +x miner_monitor.sh
```
