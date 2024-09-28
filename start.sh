#!/bin/bash

# start.sh - Script to set SELinux contexts for Docker Compose projects

# Function to print error messages and exit
error_exit() {
    echo "[ERROR] $1"
    exit 1
}

# Print start message
echo "[INFO] Starting SELinux context configuration for ~/docker_compose..."

# Change SELinux context recursively
sudo chcon -Rt svirt_sandbox_file_t ~/docker_compose || error_exit "Failed to change SELinux context."

# Add SELinux file context
sudo semanage fcontext -a -t svirt_sandbox_file_t '/home/tumanggors/docker_compose(/.*)?' || error_exit "Failed to add SELinux file context."

# Restore SELinux context
sudo restorecon -Rv ~/docker_compose || error_exit "Failed to restore SELinux context."

# Print success message
echo "[INFO] SELinux context configuration completed successfully."
