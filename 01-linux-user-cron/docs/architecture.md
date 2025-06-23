# Linux User Management & Cron Job Automation

## Scripts

### `create_users.sh`
- Reads a hardcoded list of usernames
- Adds each user only if not already created
- Sets a default password

### `backup_cronjob.sh`
- Compresses /home/projects to /var/backups
- Adds a timestamp to the filename

## Cron Setup

Crontab schedules the backup job:
```cron
0 2 * * * /bin/bash /home/enoch/devops-projects-portfolio/01-linux-user-cron/scripts/backup_cronjob.sh >> /var/log/backup.log 2>&1

