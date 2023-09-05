# BASH-FedoraPyQt6NvidiaSetup
This script automates the initial setup of a Fedora system with a focus on setting up PyQt6, Python, Nvidia drivers, and various security updates.
  
## Features

- **System Update**: Updates all packages to their latest version.
- **Nvidia Driver Setup**: Adds the RPM Fusion repository and installs Nvidia drivers.
- **Python & PyQt6 Setup**: Installs Python3, pip, PyQt6, and associated development tools.
- **Qt6 Development Tools**: Installs development libraries for Qt6.
- **Visual Studio Code**: Sets up Visual Studio Code repository and installs the editor.
- **Basic Security Configurations**:
  - Firewall setup using `firewalld`.
  - SELinux mode set to enforcing.
  - `fail2ban` installation and setup to protect against brute force attacks.

## Usage

1. Clone this repository or download the script.
2. Make the script executable: `chmod +x <script-name>.sh`
3. Run the script: `./<script-name>.sh`
4. After completion, consider rebooting the system to ensure all changes take effect.

## Notes

- The script will generate a `setup_log.txt` file which will capture all the outputs. This is useful for debugging or verifying the operations.
- Remember to always check scripts from the internet before running them to ensure they are safe and meet your requirements.

## Contributions

Feel free to fork, improve, and submit pull requests. Any feedback or suggestions are welcome!


