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


## Org File Chooser for Emacs

See **Important** at the bottom before proceeding.

This script simplifies the process of opening Org files in Emacs by providing a menu where you can select which file to open. It can handle multiple files, and you can dynamically add new files to the selection. Additionally, it ensures persistent storage of the files added to the menu for future use (if second script is used).

### Features:

- **Dynamic File Menu**: A list of Org files is presented to the user, and they can choose which one to open.
- **Persistent Storage**: The script keeps track of files in an external list, ensuring that added files remain available across sessions (for the second script only)
- **Open All Option**: Users can open all files listed at once in separate Emacs instances.
- **Error Handling**: The script checks if a file exists before attempting to open it.

### To use the script:

1. Edit the script to specify the location of your file list. Use your text editor to edit those parts that have the #EDIT# sign next to it.
   
2. Make the script executable by running:

   ```bash
   sudo chmod +x emacs_orgfile_bash_chooser.sh
   sudo chmod +x emacs_orgfile_bash_chooser_2.sh
   ```

3. Run the script:

   ```bash
   ./emacs_orgfile_bash_chooser.sh
   ./emacs_orgfile_bash_chooser_2.sh
   ```

4. Follow the menu prompts to open files in Emacs, add new files, or exit.

When you add a new file in the second script, the new file will be appended to the `file_list.txt` and be available next time you run the script.

*Important*
- Ensure that you have Emacs installed and available via the `emacs` command. See below for a link to the official emacs webpage.
  
- There are two scripts, one is a simpler version that doesnt store added filepaths and is fixed to three only, whilst the second (emacs_orgfile_bash_chooser_2.sh) saves the filepaths to a txt file.

  - [Emacs guide](https://www.gnu.org/software/emacs/)

## Git pull on multiple projects:

A really simple script to automate pulling from git; useful if working with multiple projects or frontend/backend applications.

   ```bash
   ./git_pull.sh
   ```

## Automatic insertion to org file from txt files:

As the name suggests, this file will look for changes in a desired directory. It will scan files (I personally use `org` files, but `txt` will also work) and notice if anything has been added to them, if that is the case, it will attempt to append/edit the `MASTER_TL` file that you have chosen; essentially allowing you to have a full list of all the contents stored in multiple files.

### Requirement

You must have installed inotify-tools via: 

```bash
sudo apt install inotify-tools
```

### Use case

The way I wanted to set the workflow is to have a weekly org file that will be created every mondays (I could have a `crontab` to do this but that would require the machine to be on at the time it needs to be created - not feasibile unless you have a 24/7 server running), and I would append the `YYYY-weekly-DD` file using the second level org header `**` as the first is used for checking purposes by the script. Now once I have added the entries I need to add, It will append/edit to the master-tl.org, which contains every `TODO` entry I have ever made - this is useful in case I want to look back and see the thing I have been working on. 

An example of what a weekly org would look like: 

```org

** DONE Agda revision (1h)
** DONE Agda exam practice
** DONE Hospital hearing aids
** TODO 1h on FYP
** TODO Read about ISE coursework.

** DONE Update the bash script for auto org.
** DONE AFP Lecture


```
