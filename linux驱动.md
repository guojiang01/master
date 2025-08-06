我的环境：

开发环境：ubuntu 14.04

linux源码版本：linux-4.9.229

busybox源码版本：busybox-1.30.0

qemu-system-x86_64版本：2.0.0

本文教你完成下列过程：

1.下载linux并编译linux内核源码

2.编译busybox

3.制作一个最小的根文件系统

4.qemu启动你编译好的内核和根文件系统


linux源码下载地址：

https://mirrors.edge.kernel.org/pub/linux/kernel/

我选择的版本是：4.9.229

https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.9.229.tar.xz

下载到本地，解压，然后进入linux-4.9.229目录：

1.指定硬件体系架构。

为了减少安装编译器的过程，我在本例中使用的是x86，因为我的开发环境就是x86。如果你要编译arm的内核，则指定ARCH=arm且需要安装交叉编译器。

```shell 
# export ARCH=x86
```

2.配置board config,此处配置为 x86_64_defconfig。好了，我们点好菜了，菜单就是x86_64_defconfig

``` shell 
# make  x86_64_defconfig
```

3.配置内核

这一步其实是对第2步的菜单进行微调，我们需要内核支持ramdisk驱动，所以需要选中如下配置：

``` shell 
General setup  --->
	----> [*] Initial RAM filesystem and RAM disk (initramfs/initrd) support

	Device Drivers  --->

   [*] Block devices  --->

           <*>   RAM block device support

           (65536) Default RAM disk size (kbytes)
```

4.编译内核

``` shell 
# make
```

编译成功后的内核位于：arch/x86_64/boot/bzImage


下载buysbox源码，下载地址：

https://busybox.net/downloads/

我使用的版本是busybox-1.30.0

1.解压buysbox源码

```shell
# tar xvf busybox-1.30.0.tar.bz2
```

2.配置buysbox源码

在这里我们把busybox配置为静态编译，这样busybox在运行的时候就不需要额外的动态链接库了。

```shell
# make menuconfig
Busybox Settings  --->
      Build Options  --->
            [*] Build BusyBox as a static binary (no shared libs)
```

3.编译和安装

```shell
#make && make install
```

4.编译完成后的busybox就安装在源码根目录下的_install目录了，我们进入_install目录，补充一些必要的文件或目录，相关的shell命令如下：

``` shell
# mkdir etc dev mnt
# mkdir -p proc sys tmp mnt
# mkdir -p etc/init.d/
# vim etc/fstab
	proc        /proc           proc         defaults        0        0
	tmpfs       /tmp            tmpfs    　　defaults        0        0
	sysfs       /sys            sysfs        defaults        0        0
# vim etc/init.d/rcS
	echo -e "Welcome to tinyLinux"
	/bin/mount -a
	echo -e "Remounting the root filesystem"
	mount  -o  remount,rw  /
	mkdir -p /dev/pts
	mount -t devpts devpts /dev/pts
	echo /sbin/mdev > /proc/sys/kernel/hotplug
	mdev -s
# chmod 755 etc/init.d/rcS
# vim etc/inittab
	::sysinit:/etc/init.d/rcS
	::respawn:-/bin/sh
	::askfirst:-/bin/sh
	::ctrlaltdel:/bin/umount -a -r
# chmod 755 etc/inittab
# cd dev
# mknod console c 5 1
# mknod null c 1 3
# mknod tty1 c 4 1
```

这样一个最小的、完整的可以被内核启动的文件系统就齐活啦。


制作根文件系统镜像文件。

思路：

1.先制作一个空的镜像文件；

2.然后把此镜像文件格式化为ext3格式；

3.然后把此镜像文件挂载，并把根文件系统复制到挂载目录；

4.卸载该镜像文件。

5.打成gzip包。

```shell
#!/bin/bash
rm -rf rootfs.ext3
rm -rf fs
dd if=/dev/zero of=./rootfs.ext3 bs=1M count=32
mkfs.ext3 rootfs.ext3
mkdir fs
mount -o loop rootfs.ext3 ./fs
cp -rf ./_install/* ./fs
umount ./fs
gzip --best -c rootfs.ext3 > rootfs.img.gz
```

最终生成的文件系统镜像名字为：rootfs.img.gz

准备好了内核和文件系统镜像，幸福的一刻马上来临了：


通过qemu模拟器启动我们自己编译的内核和文件系统：

```shell 
qemu-system-x86_64 \
  -kernel ./linux-4.9.229/arch/x86_64/boot/bzImage  \
  -initrd ./busybox-1.30.0/rootfs.img.gz   \
  -append "root=/dev/ram init=/linuxrc"  \
  -serial file:output.txt
```


这样一个完整的最小linux系统就起来啦：


好了，经过以上的步骤，你可以自己编译一个内核和文件系统。有了这样的基础，你在之后就可以自由地修改linux内核代码并run起来进行验证啦。