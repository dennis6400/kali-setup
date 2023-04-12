# Tags
Some tasks are tagged in the playbook for speeding up the deployment. The tags make it possible to execute only single parts of the playbook or to skip single parts  whiel executing the playbook. Overview of availible tags:

|Tag|Description|
|-|-|
|`install-apt-tools`|Installation of apt tools (role "Tools").|
|`install-git-tools`|Installation of git tools (role "Tools").|
|`install-further-tools`|Installation of further tools (e.g. Sublime Merge/Text) (role "Tools").|
|`install-desktop`|Install desktop (role "Desktop").|
|`setup-desktop,`|Setup desktop (role "Desktop Customization").|
|`basic-setup`|Basic setup.|
|`setup-shell-profile`|Setup shell profiles.|
|`setup-shell-aliases`|Setup shell aliases.|
|`setup-misc`|Miscellaneous customization.|
|`setup-secrets`|Setup secrests (e.g. SSH keys).|

The param `-t` makes it possible to only execute tasks with the corresponding tag:

```shell
ansible-playbook -i development --ask-become-pass -t 'install-apt-tools, install-git-tools' site.yml
```

Task can be skipped with the param `--skip-tags`: 

```shell
ansible-playbook -i development --ask-become-pass --skip-tags 'install-desktop, setup-desktop' site.yml
```