---
creation date: 2023-06-02 19:12:43
last modified date: 2024-07-14 00:09:43
---

# [git_repos](git_repos.md)

## Syntax

```yml
git_repos:
  - { path: "<path/to/dest dir>", dir_name: "<dest dir>", repo: "<repo url>" }
```

## Example

```yml
git_repos:
  - { path: "/opt", dir_name: "dirsearch", repo: "https://github.com/maurosoria/dirsearch.git" }
  - { path: "/usr/local/share/seclists", dir_name: "fuzzdb", repo: "https://github.com/fuzzdb-project/fuzzdb.git" }
```

## Default Value

```yml
empty
```