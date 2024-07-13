---
creation date: 2024-07-06 20:10:45
last modified date: 2024-07-14 00:01:05
---

# [Makefile](Makefile.md)

The project contains a Makefile with common modes for configuring Kali. Make will be basically use as "wrapper" for the most common ansible commands. 

The Makefile is in the **root directory** of the project. You have to **navigate to this directory** for running any make command and (of course) make must be installed:

```shell
make <command>
```

*<u>Example</u>:* 

```shell
make help
```

The following make commands are available:

|Command|Description|
|-|-|
|`inv`|Check inventory|
|`deploy`|Deploy playbook comletely (tools, desktop, etc.)|
|`tools`|Install only tools|
|`skip-tools`|Skip installing tools|
|`obsidian`|Install/update only Obsidian|
|`sublime`|Install/update only Sublime Text & Sublime Merge|
|`burpsuite`|Install/update only Burp Suite|
|`1password`|Install/update only 1Password|
|`ansible`|Install/update only Ansible|
|`chrome`|Install/update only Google Chrome|
|`force-deploy-gnome`|Install and setup only GNOME desktop environment|
|`desktop`|Install and setup the choosen desktop environment|
|`skip-desktop`|Skip installing and customizing any desktop environment|
|`basic-setup`|Setup only keyboard, timezone, etc.|
|`shell`|Setup only shell profile & aliases|
|`shell-aliases`|Setup only shell aliases|
|`hosts`|Setup only hosts file|
|`secrets`|Setup only secrets (e.g. SSH, VPN)|
|`skip-secrets`|Skip setting up secrets (e.g. SSH, VPN)|
|`remove-secrets`|Remove all secrets|
|`remove-ssh`|Remove SSH keys|
|`remove-vpn`|Remove VPN configurations & keys|
|`misc`|Deploy the basic setup (e.g. timezone, keyboard layout, etc.|
|`tags`|Show ansible tags|
|`git`|Show git configuration file|
|`help`|Show the Makefile with all available make commands|

The Makefile contains the variable `INVENTORY`. This variable contains the respetive ansible inventory file with the target hosts, on which the Kali wille be configured. If you **not** use the default inventory you have to ajust this variable.