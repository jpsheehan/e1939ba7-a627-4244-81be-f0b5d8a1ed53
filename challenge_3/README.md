# Challenge 3

## Specification

Keep a backup of the previous terraform binary should we need to do a quick rollback

- Backups should have the version of terraform in their filename/path

## Solution

The shell script can be found at [terraform-backup.sh](./terraform-backup.sh).
Again, there are several lines of documentation at the top of the file describing the assumptions and limitations of this script.
They are repeated here:

- a POSIX-compliant shell is executing the script,
- the user has permission to write to the same directory that contains the Terraform binary (in this case, `/usr/bin`), and
- that the backup file should be placed in the same directory as the Terraform binary.

There is really only 4 lines of code in this script.
It performs the following commands:

1. Extract the version number from the Terraform binary.
1. Copy the Terraform binary to its new location.
1. Print the path of the backup to the standard output.

Again, for simplicity, no attempt has been made to detect or recover from errors.
