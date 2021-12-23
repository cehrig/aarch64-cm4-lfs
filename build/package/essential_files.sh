#!/bin/bash

cat > "$LFS"/etc/hosts << EOF
127.0.0.1  localhost cloudflare-teams
::1        localhost
EOF

cat > "$LFS"/etc/passwd << "EOF"
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/dev/null:/bin/false
daemon:x:6:6:Daemon User:/dev/null:/bin/false
messagebus:x:18:18:D-Bus Message Daemon User:/run/dbus:/bin/false
uuidd:x:80:80:UUID Generation Daemon User:/dev/null:/bin/false
nobody:x:99:99:Unprivileged User:/dev/null:/bin/false
EOF

cat > "$LFS"/etc/shadow << "EOF"
root:$6$cYP.F/.zBhx1pkio$/1wUDDAXQYpiGEgVvAeUrxV4oaS02RK9h4FoCaORheBqi3/m5HdWC8pJMjL/d1M.e95ybRJCY5TW1HAeq/JSg0::0:99999:7:::
bin:x:18982:0:99999:7:::
daemon:x:18982:0:99999:7:::
messagebus:x:18982:0:99999:7:::
uuidd:x:18982:0:99999:7:::
nobody:x:18982:0:99999:7:::
EOF

cat > "$LFS"/etc/group << "EOF"
root:x:0:
bin:x:1:daemon
sys:x:2:
kmem:x:3:
tape:x:4:
tty:x:5:
daemon:x:6:
floppy:x:7:
disk:x:8:
lp:x:9:
dialout:x:10:
audio:x:11:
video:x:12:
utmp:x:13:
usb:x:14:
cdrom:x:15:
adm:x:16:
messagebus:x:18:
input:x:24:
mail:x:34:
kvm:x:61:
uuidd:x:80:
wheel:x:97:
nogroup:x:99:
users:x:999:
EOF

cat > "$LFS"/etc/inittab << "EOF"
# Begin /etc/inittab

id:3:initdefault:

l0:0:wait:/etc/rc 0
l1:S1:wait:/etc/rc 1
l2:2:wait:/etc/rc 2
l3:3:wait:/etc/rc 3
l4:4:wait:/etc/rc 4
l5:5:wait:/etc/rc 5
#l6:6:wait:/etc/rc 6

ca:12345:ctrlaltdel:/sbin/shutdown -t1 -a -r now

su:S016:once:/sbin/sulogin

1:2345:respawn:/sbin/agetty --noclear tty1 9600
2:2345:respawn:/sbin/agetty tty2 9600
3:2345:respawn:/sbin/agetty tty3 9600

# End /etc/inittab
EOF

cat > "$LFS"/etc/rc << "EOF"
#!/bin/sh

echo runlevel $1

if [ $1 = "3" ]; then
  mount -o remount,rw /
  mount --all
fi
EOF

chmod +x "$LFS"/etc/rc

cat > "$LFS"/etc/fstab << "EOF"
none            /proc proc  defaults  0 0
/dev/mmcblk0p1  /               ext4            noatime         0 1
/dev/mmcblk0p2  /boot           ext4            defaults        0 1
EOF

touch "$LFS"/var/log/{btmp,lastlog,faillog,wtmp}
chgrp -v +13 "$LFS"/var/log/lastlog
chmod -v 664  "$LFS"/var/log/lastlog
chmod -v 600  "$LFS"/var/log/btmp

cp /usr/bin/qemu-aarch64-static "$LFS"/usr/bin/
chroot "$LFS" qemu-aarch64-static /bin/bash -c 'ldconfig'

# shadowed user passwords
chroot "$LFS" qemu-aarch64-static /bin/bash -c 'pwconv'

# shadowed group passwords
chroot "$LFS" qemu-aarch64-static /bin/bash -c 'grpconv'
