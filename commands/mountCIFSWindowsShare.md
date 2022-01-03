# Mount CIFS windows share.

## Command:
```
sudo mount -t cifs -o username=<username>,password='<password>' //WIN_SHARE_IP/<share_name> /mnt/win_share
```

If a domain, user id, or file permissions is required:
```
sudo mount -t cifs -o domain=<domain>,username=<username>,password='<password>',dir_mode=0777,file_mode=0777,uid=<uid> //WIN_SHARE_IP/<share_name> /mnt/win_share
```
