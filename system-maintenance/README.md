# 🧰 Daily System Maintenance Script

This Bash script automates daily system maintenance for Debian-based systems. It performs:

- `apt update` — fetches the latest package lists
- `apt upgrade` — installs package updates
- `apt full-upgrade` — handles dependencies cleanly
- `apt autoremove` — clears orphaned packages
- `apt autoclean` — cleans old cached files

## 📋 Usage

```bash
chmod +x daily-update.sh
sudo ./daily-update.sh
