#!/usr/bin/env bash

# Quickbox Uninstall Script
# MIT License - Copyright (c) 2026 Musqz

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${RED}=== Quickbox Uninstaller ===${NC}\n"

# Check if running as root
if [[ $EUID -ne 0 ]]; then
   echo -e "${RED}Error: This script must be run as root${NC}"
   echo "Try: sudo ./uninstall.sh"
   exit 1
fi

# Confirm uninstall
echo -e "${RED}WARNING: This will remove Quickbox${NC}"
echo "Configuration in ~/.config/quickbox/ will NOT be deleted"
echo ""
read -p "Continue with uninstall? (yes/no): " confirm
if [[ "$confirm" != "yes" ]]; then
    echo "Cancelled."
    exit 0
fi

echo ""
echo "Uninstalling..."

# Remove main application
if [[ -f /usr/local/bin/quickbox ]]; then
    rm /usr/local/bin/quickbox
    echo -e "${GREEN}✓ Removed /usr/local/bin/quickbox${NC}"
fi

# Remove desktop file
if [[ -f /usr/share/applications/quickbox.desktop ]]; then
    rm /usr/share/applications/quickbox.desktop
    echo -e "${GREEN}✓ Removed /usr/share/applications/quickbox.desktop${NC}"
fi

# Remove shared data (translations, version)
if [[ -d /usr/share/quickbox ]]; then
    rm -rf /usr/share/quickbox
    echo -e "${GREEN}✓ Removed /usr/share/quickbox${NC}"
fi

# Remove icon
icon="/usr/share/icons/hicolor/scalable/apps/quickbox.svg"
if [[ -f "$icon" ]]; then
    rm "$icon"
fi
gtk-update-icon-cache -q -t -f /usr/share/icons/hicolor 2>/dev/null || true
echo -e "${GREEN}✓ Icon removed${NC}"

echo ""
echo -e "${GREEN}=== Uninstall Complete ===${NC}"
echo ""
echo "Note: Configuration files in ~/.config/quickbox/ were NOT deleted"
echo "To completely remove: rm -rf ~/.config/quickbox/"
echo ""
