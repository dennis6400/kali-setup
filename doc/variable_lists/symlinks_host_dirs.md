---
creation date: 2024-07-06 20:10:45
last modified date: 2024-07-14 00:05:02
---

# [symlinks_host_dirs](symlinks_host_dirs.md)

## Syntax

```yml
symlinks_host_dirs:
  - { host_dir: "<source directory>", dest: "<destination directory>" }
```

## Example

```yml
symlinks_host_dirs:
  - { host_dir: "/mnt/hgfs/engagements", dest: "{{ engangement_dir }}" }
  - { host_dir: "/mnt/hgfs/projects", dest: "{{ project_root_dir }}/host" }
```

## Default Value

```yml
empty
```