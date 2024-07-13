---
creation date: 2024-07-06 20:10:45
last modified date: 2024-07-13 23:59:53
---

# [Setup Git](Setup%20Git.md)

**Step 01 -** Create a custom configuration file for git:

```shell
touch roles/tools/templates/gitconfig-custom.j2
```

**Step 02 -** Edit the created file and add your specific git settings into this file:

```shell
nano roles/tools/templates/gitconfig-custom.j2
```

*A default configuration can be found in the following template:*

```shell
cat roles/tools/templates/gitconfig.j2
```

**Step 03 -** Edit the file `kali-default.yml`and make the following changes:

```shell
nano group_vars/kali-default.yml
```

```yml
setup_git: yes
git_template: "gitconfig.j2"
```

*For more information about the variables, refer to [Custom Variables](Custom%20Variables.md).*

**Step 04 -** Now the custom hosts file  must be deployed: 

```shell
. profiles/default-hosts.profile && make hosts
```

---
Related articles: [Setup Shell](Setup%20Shell.md), [Setup Hosts File](Setup%20Hosts%20File.md)