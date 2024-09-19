# BASH SCRIPTS

This repository contains scripts designed to automate monotonous tasks.

## WoL and SSH Automation

This script is useful if you want to SSH into a machine that is turned off. The bash script will wake the machine up (provided that the necessary prerequisites are met) and then, after a delay, attempt to SSH into it.

To use the script:

1. Open the script in your favorite text editor and adjust the values to suit your machine.

2. Make the script executable by running:

   ```bash
   sudo chmod +x script_for_wol_and_ssh.sh
   ```

3. Then run the script with:

   ```bash
   ./script_for_wol_and_ssh.sh
   ```

*Important*

- Ensure that your machine is set up for Wake on LAN (WoL). Refer to this guide for more information:

  - [WoL Guide](https://uk.pcmag.com/networking/137906/how-to-turn-on-your-computer-from-across-the-house-with-wake-on-lan)

- Make sure that your devices have an SSH client installed and can use the `ssh` command.
