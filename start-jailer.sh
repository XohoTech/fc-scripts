#!/bin/sh
vm_uuid=$(uuidgen)
jailer_root="/srv/jailer"
fc_root="/opt/fc"
## Make the chroot ahead of time so we can link the image and config
mkdir -p "$jailer_root/firecracker/$vm_uuid/root"
link_files=( 'disk.img' 'config.json' )
for to_link in "$link_files"; do
    [ -f "$fc_root/vm/$1/$to_link" ] || (echo "$to_link missing for VM $1" >2; exit 1)
done
## ... then run jailer
exec /opt/fc/bin/jailer --id "$vm_uuid" \
                        --exec-file "$fc_root/bin/firecracker" \
                        --daemonize \
                        -- --vmm-config "/config.json"
