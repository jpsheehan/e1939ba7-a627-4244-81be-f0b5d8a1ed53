#! /bin/sh -

# terraform-update.sh
#
# Downloads the latest version of Hashicorp's Terraform tool and places it in
# the /usr/bin directory. The user must have write access to /usr/bin and it
# is assumed that the system is running 64-bit Linux and that the `curl' and
# `unzip' utilities are present in $PATH. This script makes no attempt to
# detect or recover from errors.

URL=https://releases.hashicorp.com
DST_PATH=/usr/bin/terraform

# step 1: grab the path to the page that has the latest terraform version
all_versions_url=$URL/terraform/
version_path=$(\
	curl -s $all_versions_url \
	| grep -m 1 -Eo "terraform\/[0-9]+\.[0-9]+\.[0-9]\/")

# step 2: grab the URL of the archive of the latest version
latest_version_url=$URL/$version_path
archive_url=$(\
	curl -s $latest_version_url \
	| grep -m 1 "data-os=\"linux\" data-arch=\"amd64\"" \
	| grep -Eo "https://[^\"]*")

# step 3: download the latest version to a temporary file
TEMP_FILE=/tmp/terraform.zip
curl -o $TEMP_FILE $archive_url

# step 4: extract the contents of the zip archive to a temporary directory
TEMP_DIR=/tmp/terraform
unzip $TEMP_FILE -d $TEMP_DIR

# step 5: copy the binary to the output location
SRC_PATH=$TEMP_DIR/terraform
cp $SRC_PATH $DST_PATH

# step 6: cleanup
rm -f $TEMP_FILE
rm -Rf $TEMP_DIR/*
