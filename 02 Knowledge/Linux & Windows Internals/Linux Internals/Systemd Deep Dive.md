---
tags: [linux, internals, systemd, services]
type: note
---

# systemd Deep Dive

systemd is the init system (PID 1) on most modern Linux distributions.

---

## Service Management

Check service:
```bash
systemctl status nginx
```
Start/Stop:

```bash
systemctl start nginx systemctl stop nginx
```
Enable at boot:

```bash
systemctl enable nginx
```

---

## Service Unit Files

Locations:

- /etc/systemd/system/
    
- /lib/systemd/system/
    

Example:

```ini
[Unit]
Description=Nginx Web Server

[Service]
ExecStart=/usr/sbin/nginx
Restart=always

[Install]
WantedBy=multi-user.target

```
Reload after changes:

```
bash
systemctl daemon-reload
```
---

## Targets (Replacement for Runlevels)

Common targets:

- multi-user.target
    
- graphical.target
    
- rescue.target
    

Check default target:

```bash
systemctl get-default
```

Change default:

```bash
systemctl set-default multi-user.target
```

---

## Troubleshooting

View logs:

```bash
journalctl -u nginx
journalctl -xe
```

Analyze boot:

```bash
systemd-analyze 
systemd-analyze blame
```

