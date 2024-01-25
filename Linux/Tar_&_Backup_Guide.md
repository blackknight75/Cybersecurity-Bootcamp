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
tar cvvf --checkpoint --checkpoint-action=echo=Checkpoint\ reached archive_name.tar /path/to/directory
```
  
### Compressing and Restoring
---
## Compressing a Tar File with Gzip

- Create and compress an archive with gzip, which reduces the size of the archive.

```sh
tar cvzf archive_name.tar.gz /path/to/directory
```

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




