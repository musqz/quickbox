# Quickbox

GTK3-based GUI for managing QEMU virtual machines with quickemu integration.

## Features

VM creation, deletion, start/stop, snapshots, cloning, ISO management, boot order control, UEFI/BIOS support, distro downloads via quickget.

SSH copy-paste helper — auto-assigns a port per VM and gives you the ready-to-use command.

![advanced](images/advanced.jpg)

![quickget](images/quickget.jpg)

## Requirements

- Python 3.6+
- GTK3 (python3-gi, gobject-introspection)
- quickemu (quickget inside)

## Installation

### Debian / Ubuntu (recommended)

Download the latest `.deb` from the [Releases page](https://github.com/musqz/quickbox/releases) and install:

```bash
sudo apt install ./quickbox_1.2.2_all.deb
```

Dependencies (`python3-gi`, `gir1.2-gtk-3.0`, `xclip`) are pulled in automatically.

> **Note:** The `.deb` package has not yet been tested on a live Debian/Ubuntu system. Feedback welcome via [Issues](https://github.com/musqz/quickbox/issues).

### From source

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

### Debian / Ubuntu

```bash
sudo apt remove quickbox
```

### From source

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

---

## Disclaimer

Parts of this tool were built with AI assistance (Claude Sonnet by Anthropic). All code has been reviewed and tested by me.
