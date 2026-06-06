# 🧹 Directory Cleanup Script (Bash)

A simple Bash script that automates the cleanup of a directory by finding and deleting files that have not been accessed for a specified number of days.

This project is designed for beginners to practice file system operations, Bash scripting, and safe deletion workflows.

---

## 🚀 Features

- Deletes files based on last access time (`atime`)
- Supports both CLI arguments and interactive input
- Validates user input (path + numeric days)
- Shows interactive confirmation before deletion (`rm -iv`)
- Handles empty results safely (no files found case)
- Temporary file handling for processing file list

---

## ⚙️ Options

| Option | Description |
|--------|-------------|
| `-f`   | Path of the directory to clean |
| `-d`   | Maximum age of files (in days based on access time) |

---

## 📦 Requirements

- Linux / macOS environment
- Bash shell
- Standard Unix utilities:
  - `find`
  - `rm`

---

## ▶️ Usage

### Make script executable

```bash
chmod +x cleanup.sh

Run with command-line arguments (recommended)
./cleanup.sh -f /path/to/folder -d 30

This deletes files not accessed in the last 30 days.

Run interactively
./cleanup.sh
