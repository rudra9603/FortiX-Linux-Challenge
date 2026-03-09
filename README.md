# FortiX-Linux-Challenge 🛡️

Welcome to the **FortiX-Linux-Challenge**, a comprehensive, hands-on project designed to bridge the gap between running automated security tools and understanding the core mechanics of Linux Privilege Escalation. 

Built for the FortiXai community and offensive security engineers, this project focuses on a ground-up approach to VAPT.

## 🎯 Project Overview

To truly master privilege escalation, you have to engineer the exploits and the vulnerable environments yourself. This repository is divided into three core phases:

### 1. FortiX-Enum (The Scripter's Path) - *Active Development*
A custom, lightweight Bash script designed to automate local enumeration. Instead of relying blindly on heavy scripts, `FortiX-Enum` is built from scratch to understand exactly what is being queried under the hood.

**Current Capabilities:**
* **Sudo Privileges:** Detects misconfigured `sudo -l` entries (e.g., `NOPASSWD`).
* **SUID Binaries:** Locates files with the SUID bit set that could be abused.
* **Cron Jobs:** Enumerates scheduled tasks and hunts for world-writable cron scripts.
* **Binary Capabilities:** Scans for misconfigured Linux capabilities (`getcap`) that grant stealthy root privileges.
* *(In Development: Writable PATHs, Wildcard injection vectors)*

### 2. The Vulnerable Sandbox (The Builder's Path) - *Coming Soon*
A vulnerable-by-design environment (Docker/VM). This sandbox will feature multi-layered privilege escalation paths, requiring attackers to chain misconfigurations from a low-privileged user up to root.

### 3. The Teaching Playbook (The Teacher's Path) - *Coming Soon*
A complete documentation guide detailing the "Why" and the "Fix." For every vulnerability targeted in this challenge, this playbook will explain the root cause of the misconfiguration and provide the exact commands required for remediation.

---

## 🚀 Getting Started

### Prerequisites
* A Linux environment (Kali, Parrot, or any standard distribution)
* Basic understanding of Bash scripting

### Usage: FortiX-Enum

1. Clone the repository to your local machine or the target environment:
   ```bash
   git clone [https://github.com/YOUR_USERNAME/FortiX-Linux-Challenge.git](https://github.com/YOUR_USERNAME/FortiX-Linux-Challenge.git)
