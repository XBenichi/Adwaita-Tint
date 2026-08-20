#!/usr/bin/env bash
# Adwaita Tint Installer

set -e

echo "=== Adwaita Tint Installer ==="

GTK_DIR="$HOME/.config/gtk-4.0"
mkdir -p "$GTK_DIR"
cp gtk-theme/gtk.css "$GTK_DIR/gtk.css"
echo "[success] Adwaita Tinted installed to $GTK_DIR/gtk.css"

# Shell watcher script
mkdir -p "$HOME/.local/bin"
cp shell-theme/adwaita-tint-watch.py "$HOME/.local/bin/adwaita-tint-watch.py"
chmod +x "$HOME/.local/bin/adwaita-tint-watch.py"
echo "[success] Shell watcher installed to ~/.local/bin/adwaita-tint-watch.py"

# Systemd service
mkdir -p "$HOME/.config/systemd/user"
cp shell-theme/adwaita-tint-watch.service "$HOME/.config/systemd/user/adwaita-tint-watch.service"
echo "[success] Systemd service installed"

# Enable User Themes extension
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com 2>/dev/null || \
    echo "ALERT!! Could not enable User Themes extension. make sure it's installed."

# Start service
systemctl --user daemon-reload
systemctl --user enable adwaita-tint-watch.service
systemctl --user start adwaita-tint-watch.service
echo "[success] Service started"

echo ""
echo "Done! Log out and back in to enjoy Adwaita Tint!"
echo "if User Themes extension is enabled, the shell theme will now update automatically"
echo "when you change your accent color or switch between light and dark mode."
