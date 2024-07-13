---
creation date: 2024-07-06 20:10:45
last modified date: 2024-07-14 00:09:15
---

# [gnome_settings](gnome_settings.md)

## Syntax

```yml
gnome_settings:
  - { schema: "<schema>", key: "<key>", value: "value" }
```

## Example

```yml
gnome_settings:
  - { schema: "org.gnome.desktop.interface", key: "clock-format", value: "'24h'" }
  - { schema: "org.gnome.desktop.interface", key: "clock-show-date", value: "true" }
  - { schema: "org.gnome.desktop.interface", key: "clock-show-seconds", value: }
```

## Default Value

```yml
empty
```