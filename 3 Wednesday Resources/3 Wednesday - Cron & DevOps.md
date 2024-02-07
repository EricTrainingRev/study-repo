- [Good article on Cron](https://linuxiac.com/how-to-use-cron-and-crontab-on-linux/)
- [DevOps In-Depth](https://www.baeldung.com/ops/devops-overview)
- [Jenkins Tutorials](https://www.jenkins.io/doc/tutorials/)

## Unix: Cron
Cron is a scheduling tool that comes with most unix like OS's by default. It follows a standard time convention that allows you to have fine tune control over how often a job is automatically executed. The format is as follows: 
```bash
{minute} {hour} {day} {month} {weekday} {command}
```
- minute: goes from 0-59
- hour: goes from 0-23
- day: goes from 1-31
- month: goes from 1-12
- weekday: goes from 0-6 or SUN-SAT
- command: can be a script or a hardcoded command

some example cron jobs:
```bash
# Run a script every day at 3:30 AM: 
30 3 * * * /path/to/script.sh

# Run a script every 15 minutes: 
*/15 * * * * /path/to/script.sh

# Run a script every Monday at 4:30 AM: 
30 4 * * 1 /path/to/script.sh

# Run a script on the 15th of every month at 2:15 AM: 
15 2 15 * * /path/to/script.sh

# Run a script every hour on weekdays: 
0 * * * 1-5 /path/to/script.sh

# Run a script every 5 minutes on weekdays: 
*/5 * * * 1-5 /path/to/script.sh

# Run a script every 10 minutes on weekends: 
*/10 * * * 6,0 /path/to/script.sh

```

By default, Cron wants to email the output of any triggered jobs need to either set the value MAILTO to an empty string or redirect output to dev/null via * * * * * /path/to/script.sh >/dev/null 2>&1

# DevOps
- CI
    - consistently pushing and pulling code from a remote repository
- CD (Delivery)
    - automating some of the process of exposing your app to your customers
- CD (Deployment)
    - automating all of the process of exposing your app to your customer