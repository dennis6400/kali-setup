# symlinks_host_dirs

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