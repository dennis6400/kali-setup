---
creation date: 2024-07-06 20:10:45
last modified date: 2024-07-14 00:08:37
---

# [shell_alias_files](shell_alias_files.md)

## Syntax

```yml
shell_alias_files:
  - { template: "<alias template 1>.j2", dest: "<alias file 1>" }
  - { template: "<alias template 2>.j2", dest: "<alias file 2>" }
  - { template: "<alias template n>.j2", dest: "<alias file n>" }
```

## Example

```yml
shell_alias_files: 
  - { template: "bash_aliases.j2", dest: ".bash_aliases" }
```

## Default Value

```yml
shell_alias_files: 
  - { template: "{{ shell }}_aliases.j2", dest: ".{{ shell }}_aliases" }
  - { template: "{{ shell }}_ssh_aliases.j2", dest: ".{{ shell }}_ssh_aliases" }
  - { template: "{{ shell }}_vpn_aliases.j2", dest: ".{{ shell }}_vpn_aliases" }
```