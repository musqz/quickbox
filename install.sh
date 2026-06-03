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

# Install translations
if [[ -d "translations" ]]; then
    echo "Installing translations to /usr/share/quickbox/translations/"
    mkdir -p /usr/share/quickbox/translations
    cp translations/*.json /usr/share/quickbox/translations/
    echo -e "${GREEN}✓ Translations installed${NC}"
fi

# Install version file
if [[ -f "version" ]]; then
    mkdir -p /usr/share/quickbox
    cp version /usr/share/quickbox/version
    echo -e "${GREEN}✓ Version file installed${NC}"
fi

# Install icons
if [[ -d "icons/hicolor" ]]; then
    echo "Installing icons..."
    for size in 16 22 24 32 48 64 96 128 256 512; do
        src="icons/hicolor/${size}x${size}/apps/quickbox.png"
        if [[ -f "$src" ]]; then
            mkdir -p "/usr/share/icons/hicolor/${size}x${size}/apps"
            cp "$src" "/usr/share/icons/hicolor/${size}x${size}/apps/quickbox.png"
        fi
    done
    gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor 2>/dev/null || true
    echo -e "${GREEN}✓ Icons installed${NC}"
fi

echo ""
echo -e "${GREEN}=== Installation Complete ===${NC}"
echo ""
echo "Usage:"
echo "  Command line: quickbox"
echo ""
echo "To uninstall: sudo ./uninstall.sh"
echo ""
