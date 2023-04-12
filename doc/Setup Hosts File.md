# Setup Hosts File
**Step 01 -** Create a custom hosts file:

```shell
touch roles/special-customization/templates/hosts-custom.j2
```

**Step 02 -** Edit the created hosts file and add your specific settings into this file:

```shell
nano roles/special-customization/templates/hosts-custom.j2
```

*A default configuration can be found in the following template:*

```shell
cat roles/special-customization/templates/hosts.j2
```

**Step 03 -** Edit the file `kali-default.yml`and make the following changes:

```shell
nano group_vars/kali-default.yml
```

```yml
# Setup hosts file
setup_hosts: yes
hosts_template: "hosts-custom.j2"
```

*For more information about the variables, refer to [Custom Variables](Custom%20Variables.md).*

**Step 04 -** Now the custom hosts file  must be deployed: 

```shell
. profiles/kali-default-hosts.profile && make hosts
```

---
Related articles: [Setup Shell](Setup%20Shell.md), [Setup Git](Setup%20Git.md)