#! /bin/sh -

# terraform-backup.sh
# 
# Creates a backup of the currently installed Terraform binary. It is assumed
# that the user will have write permissions to the directory where the
# Terraform binary is located. The full path to the backed up file will be
# written to the standard output. This script makes no attempt to detect or
# recover from errors.

TERRAFORM=$(which terraform)

# extract the version number from the Terraform binary
version=$($TERRAFORM --version | grep -Eo "[0-9]+\.[0-9]+\.[0-9]+")
versioned_filename=$TERRAFORM-$version

# create a backup
cp $TERRAFORM $versioned_filename

# print the full filename out
echo $versioned_filename

