# Adwaita Tint
![preview](https://github.com/XBenichi/Adwaita-Tint/blob/main/rubbishExample.png?raw=true "Preview")
A minimal GTK4 theme that tints the UI and Shell based on the accent color and dark/light mode, making it more pleasing and lively while retaining libadwaita's visual identity.


## Requirements
- GNOME 47 or higher
- User Themes Extension (https://extensions.gnome.org/extension/19/user-themes/)
- Python 3

## Optional, but Recommended
- Accent Icons Extension for accent-adapting icon colors (https://extensions.gnome.org/extension/7535/accent-directories/)
- Auto Accent Colour Extension for automatic accent color changes based on the wallpaper (https://extensions.gnome.org/extension/7502/auto-accent-colour/)

## Installation

IMPORTANT! Make sure to back up your existing gtk-4.0 theme if you have one before you run this, as the process will override what's in `~/.config/gtk-4.0`

```bash
chmod +x install.sh
./install.sh
```

## Directory Guide
| File | Destination |
|------|-------------|
| `gtk-theme/gtk.css` | `~/.config/gtk-4.0/gtk.css` |
| `shell-theme/adwaita-tint-watch.py` | `~/.local/bin/adwaita-tint-watch.py` |
| `shell-theme/adwaita-tint-watch.service` | `~/.config/systemd/user/adwaita-tint-watch.service` |

## File Guide
- **gtk.css** contains the heart of the styling.
- **adwaita-tint-watch & adwaita-tint-watch.service** monitors `org.gnome.desktop.interface` for accent/mode changes, and regenerates `~/.local/share/themes/AdwaitaTint/gnome-shell/gnome-shell.css` automatically.

## Uninstallation
```bash
systemctl --user stop adwaita-tint-watch.service
systemctl --user disable adwaita-tint-watch.service
rm ~/.config/systemd/user/adwaita-tint-watch.service
rm ~/.local/bin/adwaita-tint-watch.py
rm ~/.config/gtk-4.0/gtk.css
gsettings set org.gnome.shell.extensions.user-theme name ''
```

