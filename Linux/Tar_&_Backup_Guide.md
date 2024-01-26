# Tar Command Usage

The `tar` command in Linux is a standard tool used to create, view, or extract files from an archive file, known as a tarball.

## Tar Syntax and Options

```sh
tar [options] [archive-file] [files or directories]
```

`tar`: The command itself. 
  
`[options]`: Control flags that define the operation to be performed.  
  
`[archive-file]`: The name of the archive file you want to create or manipulate.  
  
`[files or directories]`: The files or directories to include in the archive.  
  

## Options:
`-c`: Create a new archive. 
  
`-v`: Verbose mode, shows the progress in the terminal.  
  
`-W`: Used for verifying an archive after it is written.  
  
`-f`: Specify the filename of the archive.   
  
`-t`: List the contents of an archive.  
  
`-z`: Compress the archive with gzip.  
  
`-x`: Extract files from an archive.  
  
`--listed-incremental`: Used for creating or updating an incremental archive.  
  
`--checkpoint`: Display progress messages at each checkpoint.  
  
`--checkpoint-action`: Define an action to execute at each checkpoint.  

## Creating a Tar File With Verbose Output and Verified Data

 - This command creates a new tar archive with verbose output and verifies the data archived, listing all files as they are added.

```sh
tar cvvWf archive_name.tar /path/to/directory
```

## Importance Of Verifying Tar Viles When Creating

The purpose of verifying data with the `tar` command, typically using the `-W` option, is to ensure the integrity of the files being archived or extracted. When creating an archive, `tar` can compare the files being written to the archive with the files on the filesystem to ensure they are the same. This verification process can detect issues like file corruption or read errors, which could occur due to hardware faults, filesystem errors, or other unexpected problems.

Using data verification is crucial when archiving critical data for backups or transfers across systems. It ensures that the data has not been altered or damaged during the archiving process, adding a layer of reliability crucial for data integrity and consistency.

#### `-W` Command

The `-W` option in the tar command for Linux is used for verifying an archive after it is written. When using this option during the creation of a tar archive (tar -c), tar will write the archive and then read it back, comparing its contents against the files that were archived. This process ensures that the archive was written correctly and that the files contained within it match the original files. It's a form of integrity check, useful for confirming that the archive has not been corrupted during the creation process.

### Scenarios of Risk Without Data Verification

- Data Corruption During Backup

  > Imagine backing up important company data to a tarball for offsite storage. Without verifying the data during tarball creation, file corruption due to disk errors might go unnoticed. Later, when restoring from the backup, critical files could be unusable, leading to data loss and significant recovery costs.

- Transfer Errors in Data Migration

  > Consider migrating data from an old server to a new one using tarballs. If you don't verify the data, some files might not be read correctly due to hardware issues or network problems. As a result, the tarball on the new server could contain incomplete or corrupted data, potentially causing system failures or inaccurate data processing.

## Creating a Tar File With `--incremental`

This command creates a new tar archive with verbose output and uses an incremental approach, only archiving changes since the last snapshot.

```sh
tar --create --verbose --listed-incremental=/path/to/snapshot.snar --level=0 --file=backup.tar /path/to/directory
```
### In this command:

`--create` or `-c`: Create a new archive.  
  
`--verbose` or `-v`: Verbose mode, to list files processed.  
  
`--listed-incremental=/path/to/snapshot.snar`: Specifies the snapshot file to use for incremental backup.  
  
`--level=0`: Indicates a full backup.  
  
`--file=backup.tar` or `-f backup.tar`: The name of the archive file.  
  
`/path/to/directory`: The directory to back up.  
  
This command creates a full backup of the specified directory, recording the state of each file in the snapshot file. For subsequent incremental backups, you would use the same command without `--level=0`, which would then only back up files that have changed since the last backup recorded in the snapshot file.

## Viewing a Tar File Contents

- List the contents of an archive with verbose output, which is useful to verify the contents of a tarball.

```sh
tar tvf archive_name.tar
```

## Creating Backup Checkpoints

- Create an archive with checkpoints, allowing you to monitor the progress and ensure that it's being created as expected.

```sh
tar cvvWf --checkpoint --checkpoint-action=echo=Checkpoint\ reached archive_name.tar /path/to/directory
```
  
### Compressing and Restoring
---
## Compressing a Tar File with Gzip

- Create and compress an archive with gzip, which reduces the size of the archive.

```sh
tar cvzWf archive_name.tar.gz /path/to/directory
```

## Exclude Files With Tar
- To create a `.tar` file while excluding certain files or directories, you can use the tar command with the `--exclude` option. This option allows you to specify files or directories that should not be included in the archive.

```sh
tar -cvvWf archive_name.tar --exclude='file_or_directory_to_exclude' directory_to_tar
```

### In this command:

`-c` stands for create.  
  
`-v` stands for verbose, showing the progress.  
  
`-f` specifies the filename of the archive.  
  
`--exclude` is followed by the name of the file or directory to exclude.  
  
`directory_to_tar` is the directory you want to compress.  

### To exclude multiple files or directories, you can repeat the --exclude option:

```sh
tar -cvvWf archive_name.tar --exclude='file1' --exclude='directory1' directory_to_tar
```

- For example, to create a .tar archive of a directory named mydir, excluding a file named file.txt and a directory named dir, the command would be:
```sh
tar -cvvWf mydir.tar --exclude='file.txt' --exclude='dir' mydir
```
*This command will create a tar archive named mydir.tar containing everything in mydir except for file.txt and the directory dir.*

### Exclude Deep Dive
When using the `--exclude` option with the tar command, it's important to understand how tar interprets the paths you provide for exclusion. The key point is that the paths are considered relative to the "root" of what you're archiving, not your current working directory. This concept is best explained with an example.

- Imagine you have a directory structure like this:

```bash
/home/user/myproject/
├── subdir/
│   ├── file.txt
│   └── otherfile.txt
└── anotherfile.txt
```

### Example 1: Archiving the Whole myproject Directory
If you want to create a tar archive of the entire myproject directory but exclude `subdir/file.txt`, you will run the command:

```bash
tar -cvf myproject.tar --exclude='subdir/file.txt' -C /home/user myproject
```

Here, `-C /home/user` changes the directory to `/home/user` before starting the archiving process. So, tar considers `myproject` as the root of your archive. Since `file.txt` is located at `/home/user/myproject/subdir/file.txt`, its path relative to the root of the archive `myproject` is `subdir/file.txt`.

### Example 2: Archiving from Inside the myproject Directory
- Now, let's say you cd into myproject:

```bash
cd /home/user/myproject
```

- Your current directory is now /home/user/myproject. If you want to create the same archive as before, your tar command will look like this:

```bash
tar -cvf ../myproject.tar --exclude='subdir/file.txt' .
```
#### In this command:

`.` (dot) at the end tells tar to archive the current directory.  
  
`--exclude='subdir/file.txt'` is still valid because tar now considers . (the current directory, which is `myproject`) as the root of your archive. The path `subdir/file.txt` is still correct relative to this new root.

### Key Takeaway
The path you provide to `--exclude` is always relative to the "root" of what you are archiving, not your current file system location. In both examples, `subdir/file.txt` is correct because, relative to the root of what we're archiving, `myproject`, that is the path to the file.

### Exclude With Absolute Path

Using absolute paths with the `--exclude` option in the `tar` command may be safer and more straightforward, especially in complex scripts or when dealing with intricate directory structures. Absolute paths reduce the ambiguity that might arise from relative path interpretations and make the command more predictable, which is particularly beneficial in automated scripts or environments where the current working directory might vary.
  
Advantages of Using Absolute Paths:

- Clarity and Predictability: Absolute paths clearly specify the location of the directory or file to be excluded, leaving no room for relative path confusion.

- Consistency in Different Contexts: Whether you run the command manually, in a script, or as part of a cron job, the absolute path remains consistent and independent of the current working directory.

- Reduced Errors: Especially in automated tasks, using absolute paths can prevent errors that might arise from running the script in an unintended directory.

*Example Command:*

```bash
tar -cvf myproject.tar --exclude='/home/user/myproject/subdir/file.txt' /home/user/myproject
```
In this command, `--exclude='/home/user/myproject/subdir/file.txt'` specifies the absolute path to the file to be excluded. This path is fully qualified right from the root `/`, ensuring that file.txt in the specified location is excluded, regardless of where the command is executed.

However, it's important to note that while absolute paths provide clarity, they also reduce flexibility. If the directory structure changes or the script is run on a different system where paths differ, you'll need to update the paths accordingly. Relative paths, on the other hand, offer more flexibility in scripts that might be used in different environments or shared between users, as long as the relative relationships of directories and files remain consistent.

The choice between using absolute and relative paths depends on the specific use case, the likelihood of the directory structure changing, and the environment in which the scripts or commands are run.

### Can I Use `~/` When Using `--exclude`?

If the `file.txt` was still included in your tar archive despite using the `--exclude` option with `~/myproject/subdir/file.txt`, it's likely due to the way the shell handles the tilde `~` in the `--exclude` option. The tilde `~` is a special character that the shell typically expands to the path of the current user's home directory, but this expansion doesn't always occur as expected in all contexts, particularly within quotes or in certain script and cron job environments.

Here are a few potential reasons and solutions:

- Tilde Expansion Not Occurring: The tilde `~` might not expand as expected when it's used within quotes in the `--exclude` option. To ensure the correct path, use the full absolute path:

- Relative Path Issue: Ensure that the path in the `--exclude` option correctly corresponds to the structure of the directory you are archiving. If there's a mismatch, tar won't exclude the intended directory.

- Symlinks or Duplicates: Make sure there are no symbolic links (symlinks) or duplicate directories named Java that might be causing the directory to be included in the archive.

- Version of tar: Some versions of tar might handle path specifications differently. Check your tar version and consult its documentation if necessary.

- Running in a Script: If you're running this command in a script, especially a cron job or a script invoked in a way that doesn't load the user's environment, the tilde `~` may not expand as expected. Use full paths to avoid this issue.

## Restoring from a Single Tar File

- Extract all files from a gzip-compressed tarball.

```sh
tar xvzf archive_name.tar.gz
```

## Restoring from Incremental Files

- Restore files from an incremental archive, which is a tarball that contains only the files that changed since the last full backup.

```sh
tar xvzf archive_name.tar.gz --listed-incremental=/path/to/snapshot.file
```

## Monitoring Disk Space While Creating Tar Files

- Note: tar does not have a built-in option for monitoring disk space. You can use external commands like df for this purpose.

However, here is how you might create checkpoints and display the remaining disk space using a shell command with `--checkpoint-action`.

```sh
tar cvvf --checkpoint --checkpoint-action=exec=sh -c 'df -h; sleep 1;' archive_name.tar /path/to/directory
```

This command will execute df -h at each checkpoint to display the remaining disk space on the host system.

### In this command:

`c` is for creating an archive.  
  
`vvf` is for verbose output with the filename of the archive.  
  
`--checkpoint` instructs tar to create checkpoints at regular intervals.  
  
`--checkpoint-action=exec=sh -c 'df -h; sleep 1;'` specifies the action to be executed at each checkpoint. Here, it executes the df -h command to display disk usage in human-readable format and then pauses for 1 second (sleep 1) before proceeding. This action provides an opportunity to monitor the disk space as the archive is being created.




