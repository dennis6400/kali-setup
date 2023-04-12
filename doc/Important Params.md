# Important Params
|Param|Description|
|-|-|
|`-i <inventory file>`|Define invenrory file (e.g. `-i development`)|
|`--ask-become-pass`|Ask for **sudo password**. Important for tasks, which need to be executed with high privileges (e.g. installing tools).|
|`--ask-vault-pass `|Ask for **vault password**. Only needed for rolling out the secrets (e.g. SSH keys).|
|`-t 'example1, example2'`|Only execute the tasks with the corresponding tags.|
|`--skip-tags ''example1, example2''`|Skip executing the tasks with the corresponding tags.|
|`--list-tags`|List available tags.|
|`--extra-vars "var1=value var2=value`|Add extra and/or overwrite exiting variables.|