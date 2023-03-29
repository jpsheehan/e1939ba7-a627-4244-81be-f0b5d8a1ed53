# Challenge 4

## Specification

Instead of running the script directly on the machine we’d like you to run it via AWS Systems Manager.
Describe how you would achieve this.

## Solution

First, a couple of assumptions:

- I have access to Systems Manager in the AWS web console, and
- the machine(s) that we want to run the script on is a managed node (such as an EC2 instance configured for Systems Manager).

I would likely reach for the [Run Command](https://docs.aws.amazon.com/systems-manager/latest/userguide/run-command.html) facility under Node Management.

Specifically, there is a Run Document named "[AWS-RunShellScript](https://ap-southeast-2.console.aws.amazon.com/systems-manager/documents/AWS-RunShellScript/description?region=ap-southeast-2)" that looks like it would fit the bill.
However, this Run Document would require either the script to exist on the machine already, or it would require us to paste the entire contents of the script into the web console.
Both of these approaches would work just fine for a one-off job.

But, if this were not just a one-off job and instead was a task that is required to be done often, then it might be better to use the "[AWS-RunRemoteScript](https://ap-southeast-2.console.aws.amazon.com/systems-manager/documents/AWS-RunRemoteScript/description?region=ap-southeast-2)" Run Document.
This allows the script to be loaded directly from GitHub or S3.
Personally, I like this approach since it can work with source control systems.
