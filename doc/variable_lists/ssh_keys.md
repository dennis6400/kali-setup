---
creation date: 2024-06-24 23:17:49
last modified date: 2024-07-14 00:06:18
---

# [ssh_keys](ssh_keys.md)

## Syntax

```yml
ssh_keys:
  - { key: "<private or public SSH key>", mode: '<mode>'}
```

** Modes:**
- private SSH keys: 0600
- public SSH keys: 0644

## Example

```yml
ssh_keys:
  - { key: "example-key", mode: '0600'}
  - { key: "example-key.pub", mode: '0644'}
```

## Default Value

```yml
empty
```