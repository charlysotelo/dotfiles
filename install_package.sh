#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to check if a package is installed
is_package_installed() {
    local package=$1
    if command_exists dpkg; then
        dpkg -l | grep -qw "$package"
    elif command_exists rpm; then
        rpm -q "$package" >/dev/null 2>&1
    elif command_exists pacman; then
        pacman -Q "$package" >/dev/null 2>&1
    elif command_exists brew; then
        brew list --formula | grep -qw "$package"
    else
        return 1
    fi
}

# Display usage
usage() {
    echo "Usage: $0 [-f] <package1> [package2] ..."
    echo "  -f: Allow script to succeed even if a package is not installed"
    exit 1
}

# Parse arguments
FORCE_SUCCESS=0
PACKAGES=()

while [[ $# -gt 0 ]]; do
    case $1 in
        -f)
            FORCE_SUCCESS=1
            shift
            ;;
        -*)
            echo "Unknown option: $1"
            usage
            ;;
        *)
            PACKAGES+=("$1")
            shift
            ;;
    esac
done

# Ensure at least one package is specified
if [[ ${#PACKAGES[@]} -eq 0 ]]; then
    usage
fi

# Check for package manager and install packages
for PACKAGE_NAME in "${PACKAGES[@]}"; do
    echo "Processing package: $PACKAGE_NAME"

    if is_package_installed "$PACKAGE_NAME"; then
        echo "Package '$PACKAGE_NAME' is already installed. Skipping."
        continue
    fi

    if command_exists apt; then
        echo "Detected apt package manager"
        sudo apt update
        sudo apt install -y "$PACKAGE_NAME"
    elif command_exists yum; then
        echo "Detected yum package manager"
        sudo yum install -y "$PACKAGE_NAME"
    elif command_exists dnf; then
        echo "Detected dnf package manager"
        sudo dnf install -y "$PACKAGE_NAME"
    elif command_exists zypper; then
        echo "Detected zypper package manager"
        sudo zypper install -y "$PACKAGE_NAME"
    elif command_exists pacman; then
        echo "Detected pacman package manager"
        sudo pacman -S --noconfirm "$PACKAGE_NAME"
    elif command_exists brew; then
        echo "Detected Homebrew"
        brew install "$PACKAGE_NAME"
    else
        echo "No supported package manager found! Cannot install '$PACKAGE_NAME'."
        if [[ $FORCE_SUCCESS -ne 1 ]]; then
            exit 1
        fi
    fi

    # Confirm installation
    if is_package_installed "$PACKAGE_NAME"; then
        echo "Package '$PACKAGE_NAME' installed successfully!"
    else
        echo "Failed to install '$PACKAGE_NAME'."
        if [[ $FORCE_SUCCESS -ne 1 ]]; then
            exit 1
        fi
    fi
done

echo "All packages processed."
