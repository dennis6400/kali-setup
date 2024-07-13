---
creation date: 2024-07-06 20:10:45
last modified date: 2024-07-13 23:57:11
---

# [Tags](Tags.md)

Some tasks are tagged in the playbook for speeding up the deployment. The tags make it possible to execute only single parts of the playbook or to skip single parts  whiel executing the playbook. Overview of availible tags:

|Tag|Description|
|-|-|
|`install-apt-tools`|Installation of apt tools (role "Tools")|
|`install-git-tools`|Installation of git tools (role "Tools")|
|`install-obsidian`|Installation of Obsidian (role "Tools")|
|`install-burpsuite`|Installation of Burp Suite (role "Tools")|
|`install-1password`|Installation of 1Password (role "Tools")|
|`install-ansible`|Installation of Ansible (role "Tools")|
|`install-chrome`|Installation of Google Chrome (role "Tools")|
|`install-sublime`|Installation of Sublime Text & Sublime Merge (role "Tools")|
|`install-obsidian`|Installation of Obsidian (role "Tools")|
|`install-further-tools`|Installation of further tools (e.g. Sublime Merge/Text) (role "Tools")|
|`install-desktop`|Install desktop (role "Desktop")|
|`setup-desktop,`|Setup desktop (role "Desktop Customization")|
|`basic-setup`|Basic setup|
|`setup-shell-profile`|Setup shell profiles|
|`setup-shell-aliases`|Setup shell aliases.´|
|`setup-misc`|Miscellaneous customization|
|`setup-secrets`|Setup secrets (e.g. SSH keys)|
|`remove-secrets`|Remove secrets (e.g. SSH keys)|

The param `-t` makes it possible to only execute tasks with the corresponding tag:

```shell
ansible-playbook -i kali-default-hosts --ask-become-pass -t 'install-apt-tools, install-git-tools' site.yml
```

Task can be skipped with the param `--skip-tags`: 

```shell
ansible-playbook -i kali-default-hosts --ask-become-pass --skip-tags 'install-desktop, setup-desktop' site.yml
```