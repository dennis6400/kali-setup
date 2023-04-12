# ssh_keys

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