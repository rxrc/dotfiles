# Manual Configuration Notes

## ScreenCloud

Set local name to `%F-%T%z`.

## Redshift

Must add to this to `/etc/geoclue/geoclue.conf`

```
[redshift]
allowed=true
system=false
users=
```

## Qt

Use `qtconfig-qt4` to customize Qt apps.

## Firefox

### about:config

```
browser.urlbar.trimURLs = false
```

#### Gungnir

```
layout.css.devPixelsPerPx = 2
```

Set this in Thunderbird too.
