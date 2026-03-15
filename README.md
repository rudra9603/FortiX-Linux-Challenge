# **FortiX-Linux-Challenge 🛡️**

Welcome to the **FortiX-Linux-Challenge**, a comprehensive, hands-on project designed to bridge the gap between running automated security tools and understanding the core mechanics of Linux Privilege Escalation.

Built for the FortiXai community and offensive security engineers, this project focuses on a ground-up approach to VAPT.

## **🎯 Project Overview**

To truly master privilege escalation, you have to engineer the exploits and the vulnerable environments yourself. This repository is divided into three core phases:

### **1\. FortiX-Enum (The Scripter's Path) ✅**

A custom, lightweight Bash script designed to automate local enumeration. FortiX-Enum is built from scratch to understand exactly what is being queried under the hood.

* **Sudo Privileges:** Detects sudo \-l entries (e.g., NOPASSWD).  
* **SUID Binaries:** Locates files with the SUID bit set.  
* **Cron Jobs:** Enumerates scheduled tasks and world-writable scripts.  
* **Binary Capabilities:** Scans for misconfigured Linux capabilities (getcap).  
* **PATH Check:** Checks for writable directories in the user's $PATH.

### **2\. The Vulnerable Sandbox (The Builder's Path) ✅**

A vulnerable-by-design Docker environment. This sandbox features a multi-layered privilege escalation path:

* **Level 1 ➔ Level 2:** Insecure Cron Job permissions.  
* **Level 2 ➔ Level 3:** SUID Binary exploitation (Vim).  
* **Level 3 ➔ Root:** Sudoers misconfiguration (Awk).

### **3\. The Teaching Playbook (The Teacher's Path) \- *Active Development***

A complete documentation guide detailing the "Why" and the "Fix." Check the /Exploits directory for detailed reports on each escalation vector.

## **🚀 Getting Started**

### **1\. Run the Vulnerable Sandbox**

You will need Docker installed on your host (Kali/Ubuntu).

cd Docker-Sandbox  
sudo docker build \-t fortix-sandbox .  
sudo docker run \-d \-p 2222:22 \--name my-fortix-box fortix-sandbox

### **2\. Access the Target**

Connect as the lowest-privileged user:

* **User:** level1  
* **Pass:** fortix

ssh level1@localhost \-p 2222

### **3\. Use FortiX-Enum**

To run the enumeration script inside the target:

\# From your host machine  
scp \-P 2222 ./enum.sh level1@localhost:/tmp/enum.sh

\# Inside the SSH session  
chmod \+x /tmp/enum.sh  
/tmp/enum.sh

## **⚠️ Disclaimer**

This repository and its contents are for educational purposes and authorized Vulnerability Assessment and Penetration Testing (VAPT) only. Do not run these scripts or exploits against systems you do not own or have explicit permission to test.
