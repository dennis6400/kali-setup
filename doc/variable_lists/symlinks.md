---
creation date: 2024-07-06 20:10:45
last modified date: 2024-07-14 00:05:50
---

# [symlinks](symlinks.md)

## Syntax

```yml
symlinks:
  - { src: "<source file/directory>", dest: "<destination link>" }
```

## Example

```yml
symlinks:
  - { src: "/opt/dirsearch/dirsearch.py", dest: "/usr/local/bin/dirsearch" }
```

## Default Value

```yml
empty
```