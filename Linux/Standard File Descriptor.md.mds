# Standard File Descriptors in Linux

1. **Standard Input (stdin) - File Descriptor 0:**
   - Used for _input_ to a program.
   - Default: Reads from the keyboard.
   - Commonly used in programming for reading data into a program.

2. **Standard Output (stdout) - File Descriptor 1:**
   - Used for _output_ from a program.
   - Default: Directs output to the terminal/console.
   - Typically displays the output of commands or programs.

3. **Standard Error (stderr) - File Descriptor 2:**
   - Specifically for outputting _error messages_ and diagnostics.
   - Default: Outputs to the terminal/console, but separate from stdout.
   - Allows for easier debugging and log management.

## Grep 'logrotate' Output Example

```shell
sudo logrotate -vf /etc/logrotate.conf 2>&1 | grep cron```

2 = The standard error (stderr) output from the logrotate command.
>& = Redirect one stream type to another.
1 = Standard output (which grep can use).
