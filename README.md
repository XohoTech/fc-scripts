## fc-scripts
Scripts to help keep Firecracker VMs running. As of 2019-09-17, requires the
latest master build of firecracker. To use these, the following directory
structure is expected:

```
/opt/fc
  /bin
    firecracker
    jailer
    start-jailer.sh (in this repo)
  /vm
    /<vm-name>
      /disk.img
      /config.json
```

Each VM directory is treated as an "image" as far as `firecracker@.service` is
concerned, and the `disk.img` and `config.json` files will be added to the
chroot when the service is used.
