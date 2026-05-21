#!/bin/bash

# Quickbox Installation Script
# MIT License - Copyright (c) 2026 Musqz

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}=== Quickbox Installer ===${NC}\n"

# Check if running as root
if [[ $EUID -ne 0 ]]; then
   echo -e "${RED}Error: This script must be run as root${NC}"
   echo "Try: sudo ./install.sh"
   exit 1
fi

# Check required files exist
echo "Checking files..."
for file in quickbox quickbox.desktop LICENSE; do
    if [[ ! -f "$file" ]]; then
        echo -e "${RED}Error: $file not found${NC}"
        exit 1
    fi
done

# Install main application
echo "Installing quickbox to /usr/local/bin/"
cp quickbox /usr/local/bin/
chmod +x /usr/local/bin/quickbox
echo -e "${GREEN}✓ quickbox installed${NC}"

# Install desktop file
echo "Installing desktop file to /usr/share/applications/"
cp quickbox.desktop /usr/share/applications/
echo -e "${GREEN}✓ quickbox.desktop installed${NC}"

# Create config directory
echo "Creating config directory..."
mkdir -p /root/.config/quickbox
echo -e "${GREEN}✓ Config directory created${NC}"

echo ""
echo -e "${GREEN}=== Installation Complete ===${NC}"
echo ""
echo "Usage:"
echo "  Command line: quickbox"
echo "  Alt-F2 / run dialog: quickbox"
echo ""
echo "To uninstall: sudo ./uninstall.sh"
