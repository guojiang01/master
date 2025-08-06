# Yocto构建运行于NXP的imx6ull平台上的嵌入式Linux系统

1. fsl-release-yocto文件
   + imx-setup-release.sh 该脚本用于初始化Yocto构建嵌入式Linux系统工作环境
   + setup-environment: 该脚本根据运行imx-setup-release.sh脚本时输入的参数，设置Yocto工作环境。
   + sources文件夹：在该文件夹下存放了很多文件，源码以及编译工具，用于构建嵌入式linux系统。
     + base:该文件夹下主要存放了bblayers.cnof和setup-environment，构建yocto工作环境时用到。
     + meta-clang：c语言家族前端和LLVM编译器后端
     + meta-freescalse-3rdparty:第三方板卡支持软件
     + meta-browser：提供了几种浏览器，如gnome、Mozilla
     + meta-freescale：提供了一些基于Freescale ARM官方参考版的基础支持软件
     + meta-imx:
       + meta-bsp- meta-fsl-arm,poky,meta-openembedded层的一些更新软件
       + mata-sdk- meta-freescale-distros以及发行版的一些更新软件
       + meta-ml：机器学习相关的软件
     + meta-freescale-distro:官方提供的一些嵌入式linux发行版
     + meta-nxp-demo-experience:NXP官方提供一些demo
     + meta-python2:python2相关软件
     + meta-rust：rust相关软件
     + meta-openembedded：OE内核的一些集合，定义了构建了yocto使用到的一些工具软件
     + meta-qt5:QT5相关软件
     + meta-timesys：提供vigiles工具来查看和通知BSP漏洞
     + poky：yocto的基础发行版，在此版本基础上进行构建自己的嵌入式linux发行版
   + 对于i.mx板卡的配置，主要是在meta-imx以及meta-freescale中定义的，包括linux内核、uboot以及一些板级硬件配置信息。

2. 初始化Yocto构建目录

   ```shell
   DISTRO=fsl-imx-fb MACHINE=imx6ull14x14evk source imx-setup-release.sh -b build
   bitbake imx-image-multimedia
   ```

运行之后生成build目录，生成conf文件夹。conf文件夹里面有两个重要文件：bblayer.conf和local.conf

+ /conf/bblayer.conf该配置文件定义了构建嵌入式linux系统发行版所需要实用的metalayers
+ /conf/local.conf该配置文件定义了MACHINE和DISTRO的配置项。

3. 安装依赖项

   ```shell
   sudo apt-get install gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat libsdl1.2-dev xterm zstd lz4 python2
   ```

   

4. fsl-imx-fb对应linux发行版本，imx6ull14x14evk对应linux硬件平台，分别的路径位于/source/meta-imx路径下的meta-sdk/conf/distro下fsl-imx-fb.conf以及meta-bsp/conf/machine/imx6ull14x14evk.conf。因此需要在这两个文件的基础上通过修改一定的设置，用于构建定制化的嵌入式linux系统。
5. 新建souces/meta-bird-imx6ull路径下，创建conf文件夹，用于存放配置文件，在conf文件夹下，依次创建distro和machine文件夹。meta-bsp/conf路径下的layer.conf文件拷贝至meta-bird-imx6ull/conf路径下，并且进行修改。layer.conf中修改BBFILE_COLLECTIONS及相关文件名
