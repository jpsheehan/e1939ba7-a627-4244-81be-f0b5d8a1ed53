# Challenge 1

## Specification

Create a script/program that automatically updates the terraform executable from the command-line

- Terraform Releases can be found here: https://releases.hashicorp.com/terraform/
- We are only interested in the latest stable release of terraform
- The terraform executable should have the following full path:
    - Windows: C:/program files/terraform/terraform.exe
    - Linux: /usr/bin/terraform
- Your script will need elevated privileges to copy to these locations
- This challenge does not require you to get terraform working, having it copied into the target folder is enough

## Solution

The shell script can be found at [terraform-update.sh](./terraform-update.sh).
There are several lines of documentation at the top of the file stating the assumptions that the script relies on.
The assumptions are:

- a POSIX-compliant shell is executing the script,
- the `curl` and `unzip` utilities are available in the `$PATH`, and
- the user is running an AMD64 Linux system (in theory, the script could be adjusted fetch the correct architecture's binary dynamically but it felt a bit overkill for this).

Overall, there are only 14 lines of actual code.
I have expanded some lines for readability and added documentation where I felt it a good idea.
The script works in 6 steps:

1. Download the HTML page found at the URL in the problem specification and extract the relative path of the latest version.
1. Download the HTML page found at the relative URL from the previous step and extract the absolute path of the binary archive file.
1. Download the binary archive file to a temporary location.
1. Extract the contents of the archive file to another temporary location.
1. Copy the binary file to the specified location.
1. Clean up all temporary files and directories.

I make heavy use of `curl` to download files from the internet and `grep` to parse the contents of the HTML files.

Note that no attempt has been made to detect or recover from errors.
Although error checking could be added if required.
