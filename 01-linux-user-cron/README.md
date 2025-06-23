# 🔐 Project 01 - Linux User Management & Cron Automation

## 📌 Objectives
- Automate the creation of users and groups
- Schedule automatic backups using `cron`
- Use scripts to ensure repeatable and auditable admin tasks

## 📂 Structure

| Path | Description |
|------|-------------|
| `scripts/create_users.sh` | Bash script to add users from a list |
| `scripts/backup_cronjob.sh` | Script to back up `/home/projects` to `/var/backups` |
| `cronjobs/daily_backup.cron` | Crontab entry for scheduling backup |
| `docs/architecture.md` | Design and logic behind the scripts |

## 🔧 Requirements
- Ubuntu Server
- Root or sudo privileges

## 🚀 Run the project
```bash
sudo bash scripts/create_users.sh
crontab cronjobs/daily_backup.cron


---

## 🔧 `create_users.sh` – Add Multiple Users

```bash
#!/bin/bash
# scripts/create_users.sh

USER_LIST=("devuser1" "devuser2" "testuser1")

for USER in "${USER_LIST[@]}"; do
    if id "$USER" &>/dev/null; then
        echo "User $USER already exists."
    else
        sudo useradd -m -s /bin/bash "$USER"
        echo "Created user: $USER"
        echo "$USER:Welcome123!" | sudo chpasswd
    fi
done
