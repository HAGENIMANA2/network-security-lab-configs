# Make executable
chmod +x log-rotation.sh

# Run manually
sudo ./log-rotation.sh

# Schedule weekly
0 1 * * 0 /path/to/log-rotation.sh
