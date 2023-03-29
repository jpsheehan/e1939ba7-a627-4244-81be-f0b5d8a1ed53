# Challenge 2

## Specification

Describe or implement a system for scheduling the script to run weekly on Monday at 9am NZST
- Our deployment servers time zone is set to UTC

## Solution

Since I am assuming a modern Linux system, I would choose the `cron` daemon to schedule the script to run.
Configuring cron to run a job on a schedule simply involves editing its configuration file (usually `/etc/crontab`).
This solution requires the script from the first challenge to be placed in the `/root/bin` directory (that is the `bin` directory in the superuser's home directory).

Unfortunately, there's no way to specify a different timezone in cron's configuration file; we will have to factor that in manually.
Usually, one could use the command `date -d "09:00 NZST"` on a system that has UTC as its system timezone to find out what the absolute time would be in UTC.
However, because NZDT is in effect (until April 3rd), this isn't a valid date as far as the `date` program is concerned.
But, I do know that NZST is exactly 12 hours ahead of UTC so we can use that instead.

Knowing that Monday 9am NZST is equivalent to 9pm UTC the previous day means that we can run `crontab -e` as a superuser (because our script must be run with write permissions to `/usr/bin`) and add the configuration line that follows this paragraph.
It reads: "Every Sunday at 9:00pm run the program `/root/bin/terraform-update.sh`, discarding any output written to its standard output and standard error streams".

```cron
0 21 * * SUN /root/bin/terraform-update.sh > /dev/null 2>&1
```
