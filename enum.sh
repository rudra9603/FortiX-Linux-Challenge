#!/bin/bash

# FortiX-Enum: Lightweight Linux Privilege Escalation Enumeration Script
# Part of the FortiXai Linux Challenge

echo "=========================================="
echo "      FortiX-Enum: Local Enum Script      "
echo "=========================================="
echo ""

# 1. Check for Sudo Privileges
echo "[*] CHECKING SUDO PRIVILEGES (sudo -l)..."
# We pipe errors to /dev/null so the output stays clean if the user doesn't have sudo access
sudo -l 2>/dev/null
echo "------------------------------------------"
echo ""

# 2. Check for SUID Binaries
echo "[*] CHECKING FOR SUID BINARIES..."
# Finding files starting from root (/), with the SUID bit set (-perm -u=s), that are files (-type f)
find / -perm -u=s -type f 2>/dev/null
echo "------------------------------------------"
echo ""
# 3. Check for Cron Jobs
echo "[*] CHECKING CRON JOBS (/etc/crontab)..."
# Displaying the system-wide crontab
cat /etc/crontab 2>/dev/null
echo "------------------------------------------"
echo ""

# Optional but powerful: Find world-writable files in common cron directories
echo "[*] CHECKING FOR WRITABLE CRON SCRIPTS..."
find /etc/cron* -type f -perm -0002 2>/dev/null
echo "------------------------------------------"
echo ""
# 4. Check for Binary Capabilities
echo "[*] CHECKING BINARY CAPABILITIES..."
# Recursively checking all files from the root directory for capabilities
getcap -r / 2>/dev/null
echo "------------------------------------------"
echo ""
# 5. Check for Writable $PATH Directories
echo "[*] CHECKING \$PATH FOR WRITABLE DIRECTORIES..."
# Split the PATH variable by colons and check each directory for write permissions
IFS=':' read -ra PATH_DIRS <<< "$PATH"
for dir in "${PATH_DIRS[@]}"; do
    if [ -d "$dir" ] && [ -w "$dir" ]; then
        echo "[!] WARNING: Directory '$dir' in your PATH is writable!"
    fi
done
echo "------------------------------------------"
echo "[+] FortiX-Enum complete. Happy hunting!"
echo "=========================================="
