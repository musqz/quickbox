# Quickbox

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
sudo cp quickbox /usr/local/bin/
sudo chmod +x /usr/local/bin/quickbox
sudo cp quickbox.desktop /usr/share/applications/
```

## Uninstallation

```bash
sudo ./uninstall.sh
```

Or manually remove:

```bash
sudo rm /usr/local/bin/quickbox
sudo rm /usr/share/applications/quickbox.desktop
```

## Usage

Command line or Alt-F2:

```bash
quickbox
```

## Configuration

Config stored in ~/.config/quickbox/quickbox.conf

Default VM directory: ~/emu/

## License

MIT - Copyright (c) 2026 Musqz
