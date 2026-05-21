# Quickbox GUI

GTK3-based GUI for managing QEMU virtual machines with quickemu integration.

## Features

VM creation, deletion, start/stop, SSH port management, snapshots, migration, cloning, ISO management, boot order control, 

UEFI/BIOS support, distro updates. Quickget to get the latest updated distro's. In GUI a refresh button.

![advanced](images/advanced.jpg)

![quickget](images/quickget.jpg)

## Requirements

- Python 3.6+
- GTK3 (python3-gi, gobject-introspection)
- quickemu (quickget inside)

## Installation

Easiest method using install script:

```bash
sudo ./install.sh
```

Manual installation as root:

```bash
sudo cp quickbox-gui /usr/local/bin/
sudo chmod +x /usr/local/bin/quickbox-gui
sudo cp quickbox-gui.desktop /usr/share/applications/
```

Optional - Alt-F2 launcher support:

```bash
sudo cp quickbox-launch /usr/local/bin/
sudo chmod +x /usr/local/bin/quickbox-launch
```

## Uninstallation

```bash
sudo ./uninstall.sh
```

Or manually remove:

```bash
sudo rm /usr/local/bin/quickbox-gui
sudo rm /usr/local/bin/quickbox-launch (if installed)
sudo rm /usr/share/applications/quickbox-gui.desktop
```

## Usage

Command line:

```bash
quickbox-gui
```

## Configuration

Config stored in ~/.config/quickbox/quickbox-gui.conf

Default VM directory: ~/emu/

## License

MIT - Copyright (c) 2026 Musqz
