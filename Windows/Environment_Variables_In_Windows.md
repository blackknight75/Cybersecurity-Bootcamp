Using environment variables in Windows Command Prompt (CMD) can streamline your workflow, especially when dealing with paths or configurations that frequently change.

### Accessing Environment Variables

1. **Display All Environment Variables**:  
   To view all environment variables, open CMD and type:
   ```cmd
   set
   ```
   This command lists all environment variables with their current values.

2. **Access a Specific Environment Variable**:  
   To see the value of a specific environment variable, use:
   ```cmd
   echo %VARIABLE_NAME%
   ```
   Replace `VARIABLE_NAME` with the name of the environment variable you wish to see. For example:
   ```cmd
   echo %PATH%
   ```

### Setting Environment Variables

1. **Temporary Assignment**:  
   To temporarily set an environment variable for the duration of the CMD session, use:
   ```cmd
   set VARIABLE_NAME=value
   ```
   For example:
   ```cmd
   set MY_VAR=HelloWorld
   ```
   This variable will be available until the CMD window is closed.

2. **Permanent Assignment (User Level)**:  
   For a more permanent solution, affecting only the current user, you can use the `setx` command:
   ```cmd
   setx VARIABLE_NAME "value"
   ```
   Note the quotes if the value contains spaces. This change will not affect the current CMD session but will apply to all future sessions.

3. **Permanent Assignment (System Level)**:  
   To set an environment variable at the system level (affecting all users), you need administrative privileges. Open CMD as Administrator and use:
   ```cmd
   setx /M VARIABLE_NAME "value"
   ```
   The `/M` switch specifies that the variable should be set in the system environment.

### Modifying the PATH Environment Variable

The `PATH` variable is a special environment variable that tells the operating system where to look for executable files.

1. **Add a Directory to PATH Temporarily**:  
   ```cmd
   set PATH=%PATH%;C:\Your\Path\Here
   ```

2. **Add a Directory to PATH Permanently (User Level)**:  
   ```cmd
   setx PATH "%PATH%;C:\Your\Path\Here"
   ```

3. **Add a Directory to PATH Permanently (System Level)**:  
   Open CMD as Administrator and use:
   ```cmd
   setx /M PATH "%PATH%;C:\Your\Path\Here"
   ```
   Be cautious when modifying the `PATH` variable to avoid removing essential system paths.

### Removing Environment Variables

- **Temporary Removal**:  
  In the current CMD session, you can unset a variable by setting it to an empty value:
  ```cmd
  set VARIABLE_NAME=
  ```

- **Permanent Removal**:  
  To permanently remove an environment variable, use the `setx` command with an empty value:
  ```cmd
  setx VARIABLE_NAME ""
  ```
  For system-level removal, don't forget to add `/M`.

### Tips

- Changes made with `setx` will not affect the current CMD session. To see the changes, start a new CMD session.
- Use environment variables to avoid hard-coding paths or configurations, making scripts more portable and easier to manage.
- Be careful when modifying system-level environment variables. Incorrect settings can affect system behavior and software functionality.

By mastering environment variables in Windows CMD, you can significantly enhance your ability to manage your development environment, automate tasks, and improve the portability of your scripts.
