# Getting Started with WMIC

The Windows Management Instrumentation Command-line (WMIC) tool allows users to perform a wide range of operations in Windows environments by querying and setting properties in the WMI repository. The syntax for using WMIC involves several components that can be combined to execute queries, set properties, and call methods. Here's a breakdown of the basic syntax:

```cmd
wmic [context] [alias] [where clause] [verb clause]
```

- **[context]:** This is optional and specifies the WMIC environment settings, such as the output format.
- **[alias]:** Represents the WMI class you're interacting with, such as `process`, `service`, or `product`. This part of the syntax specifies what aspect of the system you're querying or configuring.
- **[where clause]:** This is optional and allows you to filter the objects affected by your command based on their properties, such as `name='example.exe'`. It narrows down the scope of the command to objects that match the criteria.
- **[verb clause]:** Specifies the action to be performed, such as `list`, `get`, `call`, or `delete`. It can also include additional options or arguments required by the action.

## Basic WMIC Commands

###Viewing System Informatio*
- Get General System Information:

```cmd
wmic computersystem get model,name,manufacturer,systemtype
```

- Get BIOS Information:

```cmd
wmic bios get serialnumber
```

- List All Installed Software:

```cmd
wmic product get name,version
```

## Managing Processes

- List All Running Processes:

```cmd
wmic process list brief
```

- Terminate a Process by ID:

```cmd
wmic process where processid='Process_ID' delete
```
*Replace 'Process_ID' with the actual ID of the process you want to terminate.*

- Terminate a Process by Name:

```cmd
wmic process where name='Process_Name' delete
```
*Replace 'Process_Name' with the name of the process.*

## Managing Services

- List All Services:

```cmd
wmic service list brief
```

- Start a Service:

```cmd
wmic service where name='Service_Name' call startservice
```

- Stop a Service:

```cmd
wmic service where name='Service_Name' call stopservice
```

## Working with Disks and Partitions

- List All Disks:

```cmd
wmic diskdrive get name,size,model
```

- List All Partitions:

```cmd
wmic partition get name,type,size
```

## Advanced Use Cases

WMIC also allows for more complex queries and operations, such as:

- Finding Users' Login Time:

```cmd
wmic netlogin get name,lastlogon
```

- Changing the Process Priority:

```cmd
wmic process where name='Process_Name' call setpriority Priority_Level
```
*Replace Priority_Level with the desired priority.*

- Getting Network Adapter Configurations:

```cmd
wmic nicconfig get macaddress, ipaddress
```

## Exporting Query Results
You can export the results of any WMIC query to a file format such as TXT, CSV, or HTML. For example:

- Export to Text File:

```cmd
wmic process list brief > C:\processes.txt
```

- Export to CSV:

```cmd
wmic process list brief /format:csv > C:\processes.csv
```

Exiting WMIC
To exit the WMIC interactive shell, simply type exit and press Enter.

> Tips for Using WMIC
> Always run Command Prompt as an administrator to ensure full access to WMIC functionalities.
> Use the /format:list switch to make the output more readable, especially when the default output is cluttered.
> The WMIC tool is very powerful. Always double-check the commands before executing them to avoid unintended system changes.
