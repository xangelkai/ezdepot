# ezdepot
🎮 DepotDownloader Interactive Bash Wrapper
---

## 🛠 Features

- ✅ Interactive CLI for downloading:
  - Regular Steam depots
  - Workshop items by `pubfile` or `UGC ID`
- ✅ Automatic subfolder creation based on AppID
- ✅ Password input is hidden
- ✅ Saves downloads in a custom directory (default: `/mnt/hdd1/downloads/APPID`)
- ✅ Logs the last used command to `~/depotdownloader_last.log`

---

## 📦 Requirements

- [DepotDownloader](https://github.com/SteamRE/DepotDownloader) installed and added to your system `PATH`
- Bash-compatible environment (Linux, macOS, WSL, etc.)

---
## Usage
clone this repo
`chmod +x depot_downloader.sh`
`./depot_downloader.sh`

---

Downloads will be saved in:
/mnt/hdd1/downloads/<AppID>/
You can change the default path by editing this line at the top of the script:
BASE_DOWNLOAD_DIR="/mnt/hdd1/downloads"
