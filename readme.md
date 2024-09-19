# BASH SCRIPTS
This repository is home to scripts that can be used to automate monotonous tasks.
## WoL and SSH automation
This script is useful if you want to ssh into a machine, but the machine is turned off. What this bash script will allow you to do is wake the machine up (pre-requsities will be mentionned), then after a delay, it will attempt to ssh into this machine.
Open the script using your favourite text editor, and change the values to suit your machine.
Run the script by doing:
`./script_for_wol_and_ssh.sh`
*important*
You will need to ensure that your machine is setup for Wake on Lan, have a look at this article for more information:
- [[https://uk.pcmag.com/networking/137906/how-to-turn-on-your-computer-from-across-the-house-with-wake-on-lan][Link]]
You will also need to ensure that your devices have an SSH client (in other words they can use the ssh command).
