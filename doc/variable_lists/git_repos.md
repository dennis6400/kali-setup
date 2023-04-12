# git_repos

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