# 🎥 Yotube Live Watcher

`yt_live_watcher` is a bash script that monitors a YouTube live stream and automatically downloads it once it ends using `yt-dlp`.  
It logs each download attempt and installs `yt-dlp` if it's not already installed on your system.

---

## ✅ Features

- 📥 Automatically downloads a YouTube live video when it becomes available.
- 🔁 Retries at a user-defined interval until the download succeeds.
- 📝 Logs each attempt with timestamps.
- 🔧 Auto-installs `yt-dlp` (via Homebrew or direct binary download).
- ✅ Works on macOS and Linux.

---

## 🛠️ Requirements

- Bash shell (default on macOS/Linux)
- `curl` installed
- macOS or Linux (not tested on Windows)

---

## 🚀 How to Use

1. **Download or clone the script**  
   Save the file as `yt_live_watcher.sh`.

2. **Make it executable**
   ```bash
   chmod +x yt_live_watcher.sh
   
---

## 📃 License

This project is licensed under the MIT License.

---

## 👨‍💻 Author

Developed by \[Manny]

Contributions, issues, and feature requests are welcome!

---
