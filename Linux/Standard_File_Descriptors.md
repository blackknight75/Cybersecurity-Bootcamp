# Standard File Descriptors in Linux

1. **Standard Input (stdin) - File Descriptor `0`:**
   - Used for _input_ to a program.
   - Default: Reads from the keyboard.
   - Commonly used in programming for reading data into a program.

2. **Standard Output (stdout) - File Descriptor `1`:**
   - Used for _output_ from a program.
   - Default: Directs output to the terminal/console.
   - Typically displays the output of commands or programs.

3. **Standard Error (stderr) - File Descriptor `2`:**
   - Specifically for outputting _error messages_ and diagnostics.
   - Default: Outputs to the terminal/console, but separate from stdout.
   - Allows for easier debugging and log management.

## Grep 'logrotate' Output Example

```bash
sudo logrotate -vf /etc/logrotate.conf 2>&1 | grep cron
```

`2` = The standard error (stderr) output from the logrotate command.  
`>&` = Redirect one stream type to another.  
`1` = Standard output (which grep can use).

## Redirection (`>` and `&`):

- The `>` symbol is used for redirection. It redirects the output of a command to a file or another stream.
- The `&` symbol is used in conjunction with `>` to specify that you're redirecting a file descriptor.

#### Syntax:

- The syntax `A>&B` redirects file descriptor `A` to file descriptor `B`. 
  - For example, `2>&1` redirects the standard error (`stderr`, file descriptor 2) to the same place as the standard output (`stdout`, file descriptor 1).

#### Usage & Examples:

*This is often used in shell scripts and command lines to control the output and error messages of commands. Here are 5 common uses with examples*

1. **Redirecting Output to a File:**
   - **Use Case**: Saving the output of a command to a file.
   - **Example**: 
     ```bash
     ls -l > output.txt
     ```
     This command redirects the output of `ls -l` (which lists directory contents in long format) to a file named `output.txt`.

2. **Redirecting Error Messages to a File:**
   - **Use Case**: Separately capturing error messages for analysis or debugging.
   - **Example**: 
     ```bash
     command 2> error.log
     ```
     In this case, any error messages produced by `command` are redirected to `error.log`.

3. **Redirecting Both Output and Error to the Same File:**
   - **Use Case**: Capturing all command output, both regular and error, in a single file.
   - **Example**: 
     ```bash
     command > output_and_error.log 2>&1
     ```
     This command redirects both stdout and stderr of `command` to `output_and_error.log`.

4. **Piping Output to Another Command:**
   - **Use Case**: Using the output of one command as the input to another.
   - **Example**: 
     ```bash
     cat file.txt | grep 'search_term'
     ```
     Here, the output of `cat file.txt` is piped directly into `grep`, which searches it for 'search_term'.

5. **Discarding Output:**
   - **Use Case**: Running a command but ignoring its output or errors.
   - **Example**: 
     ```bash
     command > /dev/null 2>&1
     ```
     This command runs `command` but redirects both its standard output and error output to `/dev/null`, effectively discarding them.

