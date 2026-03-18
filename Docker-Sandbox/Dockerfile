# Use a standard, stable base image
FROM ubuntu:20.04

# Avoid user interaction during apt installations
ENV DEBIAN_FRONTEND=noninteractive

# Install essential tools: sudo, cron, ssh, python3, vim
RUN apt-get update && apt-get install -y \
    sudo \
    cron \
    openssh-server \
    python3 \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Set up SSH directory
RUN mkdir /var/run/sshd

# ---------------------------------------------------------
# USER CREATION
# ---------------------------------------------------------
# Create level1, level2, and level3 with the password "fortix"
RUN useradd -m -s /bin/bash level1 && echo "level1:fortix" | chpasswd
RUN useradd -m -s /bin/bash level2 && echo "level2:fortix" | chpasswd
RUN useradd -m -s /bin/bash level3 && echo "level3:fortix" | chpasswd

# ---------------------------------------------------------
# VULNERABILITY 1: Writable Cron Job (Level 1 -> Level 2)
# ---------------------------------------------------------
# Create a script owned by level2, but writable by level1
RUN echo '#!/bin/bash\necho "Cleanup running..." > /dev/null' > /opt/cleanup.sh
RUN chown level2:level2 /opt/cleanup.sh
RUN chmod 777 /opt/cleanup.sh

# Add the cron job for level2 to run this script every minute
RUN echo "* * * * * level2 /opt/cleanup.sh" >> /etc/crontab

# ---------------------------------------------------------
# VULNERABILITY 2: SUID Binary (Level 2 -> Level 3)
# ---------------------------------------------------------
# Copy vim, make it owned by level3, and set the SUID bit
RUN cp /usr/bin/vim /home/level2/vim-suid
RUN chown level3:level3 /home/level2/vim-suid
RUN chmod 4755 /home/level2/vim-suid

# ---------------------------------------------------------
# VULNERABILITY 3: Sudo Misconfiguration (Level 3 -> Root)
# ---------------------------------------------------------
# Allow level3 to run 'awk' as root without a password
RUN echo "level3 ALL=(root) NOPASSWD: /usr/bin/awk" >> /etc/sudoers

# ---------------------------------------------------------
# STARTUP CONFIGURATION
# ---------------------------------------------------------
# Start cron and ssh services, then keep the container alive
CMD service cron start && /usr/sbin/sshd -D
