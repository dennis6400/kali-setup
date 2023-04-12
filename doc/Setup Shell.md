# Setup Shell
With the playbook a **bash** can be configured automatically. The playbook contains examples for a bash configuration: 
- Bash profie: `roles/special-customization/templates/bashrc-example.j2`
- Bash aliases: `roles/special-customization/templates/bash_aliases-example.j2`

For creating a cutom bash configuration, it is recommended to create seperate files within the custom bash settings:

**Step 01 -** Create a custom file for the bash profile and the aliases:

```shell
touch roles/special-customization/templates/bashrc-custom.j2 && touch roles/special-customization/templates/bash_aliases-custom.j2
```

**Step 02 -** Edit both files and add your personal bash settings ans aliases in the respective files:

```shell
nano roles/special-customization/templates/bashrc-custom.j2
```

```shell
nano  roles/special-customization/templates/bash_aliases-custom.j2
```

**Step 03 -** Edit the file `kali-default.yml`and make the following changes:

```shell
nano group_vars/kali-default.yml
```

```yml
# Setup Shell
setup_shell: yes
setup_shell_aliases: yes
setup_root_shell: yes
shell: "bash"
shell_profile_template: "bashrc-custom.j2"
shell_alias_files: 
  - { template: "bash_aliases-custom.j2", dest: ".bash_aliases" }
```

*For more information about the variables, refer to [Custom Variables](Custom%20Variables.md).*

**Step 04 -** Now the custom bash configuration must be deployed: 

```shell
. profiles/kali-default-hosts.profile && make shell
```

---
Related articles: [Setup Hosts File](Setup%20Hosts%20File.md), [Setup Git](Setup%20Git.md)