---
creation date: 2024-07-06 20:10:45
last modified date: 2024-07-14 00:02:54
---

# [Custom Variables](Custom%20Variables.md)

### Special Ansible Variables

|Variable|Description|
|-|-|
|`ansible_user`|The user ansible ‘logs in’ as. For more information, see [here](https://docs.ansible.com/ansible/latest/reference_appendices/special_variables.html)!||
|`ansible_connection`|Define connection type (`ssh` or `local`).|
|`ansible_python_interpreter`|Define explicitly the python version which should be used (e.g. `python3`). For more information, see [here](https://docs.ansible.com/ansible/latest/reference_appendices/python_3_support.html)!|

See also [here](https://docs.ansible.com/ansible/latest/reference_appendices/special_variables.html)!

### Global

|Variable|Default Value|Description|
|-|-|-|
|`user`|`"kali"`|Target user.|
|`group`|`"{{ user }}"`|Target group.|
|`home_dir`|`"/home/{{ user }}"`|Home directory of the target user.|
|`apt_cached_updated`|`no`|Flag which will be automatically set after the first `apt update` for avoiding updating the package repository multiple times while running the playbook.|

### Role - Tools

|Variable|Default Value|Description|
|-|-|-|
|`apt_packages`|[[apt_packages#Default Value]]|List of tools which will be installed during the deployment.|
|`git_repos`|[[git_repos#Default Value]]|List of git repos which will be cloned during the deployment.|
|`symlinks`|[[symlinks#Default Value]]|Define sources and destination for the symlinks.|
|`install_ansible`|`no`|Install Ansible.|
|`install_sublime_text`|`no`|Install Sublime Text.|
|`install_sublime_merge`|`no`|Install Sublime Merge.|
|`install_obsidian`|`no`|Install Obsidian.|
|`obsidian_appimage_dest`|`"/opt/obsidian"`|Setup destination directory for Obsidian.|
|`obsidian_version`|`1.6.5`|Define target version of Obsidian|
|`install_oracle_instant_client`|`no`|Install Oracle client.|
|`oracle_root`|` "/opt/oracle"`|Setup oracle root directory.|
|`oracle_home`|`"{{ oracle_root }}/instantclient_21_1"`|Setup oracle home directory.|
|`oracle_instant_client_version`|`"21.1.0.0.0"`|Define target version of the Oracle client.|
|`install_burpsuite`|`no`|Install Burp Suite.|
|`burpsuite_edition`|`pro`|Define target edition of Burp Suite.|
|`burpsuite_installer_version`|`2024.1.1.6`|Define target version of Burp Suite.|
|`install_1password`|`no`|Install 1Password.|
|`onepassword_arm_dest`|`/opt/1Password`|Setup destination directory for 1Password (ARM version).|
|`onepassword_arm_version`|`8.10.36`|Define target version of 1Password (ARM version).|
|`install_chrome`|`no`|Install Google Chrome.|
|`setup_terminator`|`no`|Deploy custom terminator settings.|
|`terminator_template`|`"terminator-config.j2"`|Source template file for terminator settings.|
|`setup_git`|`no`|Deploy custom git settings (e.g. git aliases).|
|`git_template`|`"gitconfig.j2"`|Source template file for git settings.|

### Role - Desktop

|Variable|Default Value|Description|
|-|-|-|
|`install_desktop`|`none`|Install desktop environment.<br><br><u>Available values</u>:<br>`none`: Skip installing any desktop environment<br>`all`: Install all (configured) desktop environments<br>`only-gnome`: Install only GNOME desktop environment|

### Role - Desktop  Customization

|Variable|Default Value|Description|
|-|-|-|
|`setup_desktop`|`none`|Setup the installed desktop environment.<br><br><u>Available values</u>:<br>`none`: Skip setting up installed desktop environment(s)<br>`all`: Setup all installed desktop environments<br>`only-gnome`: Setup only GNOME desktop environment|
|`setup_gnome_settings`|`no`|Setup GNOME desktop environment.|
|`gnome_settings`|[[gnome_settings#Default Value]]|Setup GNOME desktop with specified settings. For more details, refer to [[gnome_settings]].|
|`gnome_background`|`""`|Set path to the background picture for the GNOME desktop.|
|`gnome_dock_position`|`""`|Setup position of the dock.<br><br><u>Available values</u>:`BOTTOM`, `LEFT`, `RIGHT`, `TOP`|
|`setup_gnome_favorite_apps`|`no`|Setup favorite apps for the dock.|
|`gnome_favorite_apps`|[[gnome_favorite_apps#Default Value]]|Refer to [[gnome_favorite_apps]].||
|`setup_gnome_extensions`|`no`|Setup GNOME extensions.|
|`gnome_extensions`|[[gnome_extensions#Default Value]]|Refer to [[gnome_extensions]].||

### Role - Services

|Variable|Default Value|Description|
|-|-|-|
|`setup_ssh_server`|`yes`|Install and setup the SSH server.|
|`setup_ftp_server`|`no`|Install and setup the FTP server (Pure-FTPd).|
|`setup_tftp_server`|`no`|Install and setup the TFTP server.|

### Role - Basic Customization

|Variable|Default Value|Description|
|-|-|-|
|`setup_german_keyboard`|`no`|Setup German keyboard layout (system-wide).|
|`setup_german_locales`|`no`|Setup German locales.|
|`setup_german_timezone`|`no`|Setup German timezone.|
|`setup_bluetooth`|`no`|Enable bluetooth service and make this one bootsafe.|

### Role - Special Customization

|Variable|Default Value|Description|
|-|-|-|
|`setup_hosts`|`no`|Setup hosts file.|
|`hosts_template`|`"hosts.j2"`|Define hosts file, which will be deployed.|
|`setup_shell`|`no`|Setup shell (***rc* file**).|
|`setup_shell_aliases`|`no`|Setup shell aliases.|
|`shell_alias_files`|[[shell_alias_files#Default Value]]|Define alias files (as list), which will be deployed.|
|`shell_profile_template`|`""`|Define shell profile file, which will be deployed.|
|`setup_root_shell`|`no`|Apply shell configuration also for **root**.|
|`shell`|`"bash"`|Define target shell environment.<br><br><u>Available values</u>:<br>`"bash"`: Setup bash and make bash as default shell for the correponding user.|
|`vmware_vm`|`yes`|Kali runs in a VMware VM.|
|`setup_sudoers`|`no`|Setup sudoers file. The file can be only deployed if the value of `vmware_vm` is `yes`.|
|`setup_cron`|`no`|Setup (system-wide) cron file. The file can be only deployed if the value of `vmware_vm` is `yes`.|
|`setup_eicar`|`no`|Setup eicar files.|
|`eicar_dest`|`{{ home_dir }}/Documents/eicar`|Set location for the eicar files.|

### Misc Customization

|Variable|Default Value|Description|
|-|-|-|
|`setup_misc`|`no`|Rollout misc Customization.|
|`project_root_dir`|`"{{ home_dir }}/projects"`|Define path for the project root directory.|
|`project_local_dir`|`"{{ project_root_dir }}/local"`|Define path for local projects.|
|`setup_engangement_dir`|`no`|Create engagement directory.|
|`engangement_dir`|`"{{ home_dir }}/engagements"`|Define path for the engagement directory.|
|`setup_symlinks_host_dirs`|`no`|Create symlinks for several directories.|
|`symlinks_host_dirs`|See [[symlinks_host_dirs]]|Define source and destination directories for the symlinks. The file can be only deployed if the value of `vmware_vm` is `yes`. For more details, refer to [[symlinks_host_dirs]].|
|`custom_utils`|`no`|Setup security utils.|
|`custom_utils_home`|`"{{ project_local_dir }}/tools-development/secutils`|Define path for security utils.|
|`custom_lists`|`no`|Setup security lists.|
|`custom_lists_home`|`"{{ project_local_dir }}/tools-development/secutils`|Define path for security lists.|

### Role - Secrets

|Variable|Default Value|Description|
|-|-|-|
|`setup_ssh`|`no`|Setup SSH keys.|
|`ssh_dir`|`"{{ home_dir }}/.ssh"`|Define and create directory for SSH keys.|
|`ssh_keys`|[[ssh_keys#Default Value]]|Define SSH keys for the deployment.|
|`setup_vpn`|`no`|Setup VPN configurations.|
|`vpn_dir`|`"{{ home_dir }}/.vpn"`|Define and create directory for VPN configurations.|
|`vpn_configs`|[[vpn_configs#Default Value]]|Define VPN configurations for the deployment.|