## Linux相关

1. linux下的二进制文件包括可执行文件、静态库和动态库等，均采用ELF(Executable and Linkable Format)格式存储，目标文件的格式也不例外，也采用ELF格式存储。

2. 对于32位的ELF文件来说，其最前部是文件头部信息，描述了整个文件的基本属性，除了包括该文件运行在什么操作系统中、运行在什么硬件体系结构上、程序入口地址是什么等基本信息外，最重要的是记录了两个表格的相关信息，如表格所在的位置、其中包括的条目数等。这两个表格一个是Section Header Table,主要是供编译时链接使用的，表格中定义了各个段的位置、长度、属性等信息；另外一个是Program Header Table，主要是供内核和动态加载器从磁盘加载ELF文件到内存时使用。

3. ELF头占用了52个字节，通过ELF头可见该文件是32位的ELF文件；使用"little endian"字节序存储字节；ABI遵循UNIX-System V标准；运行在类UNIX系统上；文件是一个"REL(Relocatable file)"类型的文件，通常，可执行文件的类型是"EXEC(Executable file)",动态共享库的类型是"DYN(Shared object file)",静态库和目标文件库的类型是"REL"；该目标文件是为IA32架构编译的；因为是目标文件，不存在执行的概念，所以程序入口"Entry point address"在这里不适用(同样道理，Program Header Table也不适用)。

4. 在文件头信息后，就是各个段了。毫不夸张的说，ELF文件就是段的组合。大体上，段可以分为如下几类：一类是存储指令的，通常称为代码段；第二类是存储数据的，通常称为数据段。但是存储数据的又细分为两个段，已经初始化的全局数据存放在".data"段中，未初始化的全局数据存储在".bss"段。

5. objdump hexdump readelf ar grep nm ld strip objcopy 

6. 链接：分为两个阶段。第一阶段是将多个文件合并为一个单独的文件，对于可执行文件，还需要为指令及符号分配运行时的地址。第二阶段进行符号重定位。

7. GNU工具链：Binntils、GCC、Glibc

   + Binutils:GNU将凡是与二进制文件相关的工具都包括在软件包Binutils中。其中主要包括生成目标文件的汇编器(as)，链接目标文件的连接器(ld)以及若干处理二进制文件的工具
   + GCC：GNU将编译器包含在GCC中，包括C编译器、C++编译器、Fortran编译器、Ada编译器。
   + Glibc：C库包含在Glibc中。除了C库外，动态链接器也包含在这个包中。另外这个包中还提供了C的启动文件。事实上，有很多C库的实现，比如适用于Linux桌面系统的Glibc、EGlibc、uClibc。

8. kbuild p63

9. 内核映像构建过程

   ![内核构建过程.png](https://i.loli.net/2021/10/25/IaOyK9jD8JrtMnz.png) 

10. | 目录   | 通途                                                      |
       | ------ | --------------------------------------------------------- |
       | /      | 虚拟目录的根目录。通常不会在这里存储文件                  |
       | /bin   | 二进制目录，存放许多用户级的GNU工具                       |
       | /boot  | 启动目录，存放启动文件                                    |
       | /dev   | 设备目录，Linux在这里创建设备节点                         |
       | /etc   | 系统配置文件目录                                          |
       | /home  | 主目录，Linux在这里创建用户目录                           |
       | /lib   | 库目录，存放系统和应用程序的库文件                        |
       | /media | 媒体目录，可移动媒体设备的常用挂载点                      |
       | /mnt   | 挂载目录，另一个可移动媒体设备的常用挂载点                |
       | /opt   | 可选目录，常用于存放第三方软件包和数据文件                |
       | /proc  | 进程目录，存放现有硬件及当前进程的相关信息                |
       | /root  | root用户的主目录                                          |
       | /sbin  | 系统二进制目录，存放许多GNU管理员级工具                   |
       | /run   | 运行目录，存放系统运作时的运行时数据                      |
       | /srv   | 服务目录，存放本地服务的相关文件                          |
       | /sys   | 系统目录，存放系统硬件信息的相关文件                      |
       | /tmp   | 临时目录，可以在该目录中创建和删除临时工作文件            |
       | /usr   | 用户二进制目录，大量用户级的GNU工具和数据文件都存储在这里 |
       | /var   | 可变目录，用以存放经常变化的文件，比如日志文件            |

11. 文件权限

    | d    | 目录文件       | -    | 普通文件     |
    | ---- | -------------- | ---- | ------------ |
    | p    | 管理文件       | l    | 链接文件     |
    | b    | 块设备文件     | c    | 字符设备文件 |
    | s    | 套接字文件     |      |              |
    | r    | 表示读权限     | w    | 表示写权限   |
    | x    | 表示可执行权限 | -    | 没有权限     |

    12. tar命令

        | -c   | 创建一个新的打包文件                                         |
        | ---- | ------------------------------------------------------------ |
        | -x   | 对打包文件进行解压缩                                         |
        | -z   | gzip格式进行压缩或解压，与这个参数常结合的有c和x这个参数，如果与c结合，他就是压缩，如果与x结合，他就是解压缩。后缀tar.gz |
        | -j   | 以bzip2的格式进行压缩或者解压。如果与c结合，就是压缩，如果与x结合就是解压缩，后缀tar.bz2 |
        | -f   | 表示要操作的文件，一般放在所有参数最后面                     |
        | -v   | 显示现实正在处理的文件                                       |
        | -C   | 格式-C路径，表示将压缩文件解压缩到指定路径                   |

        13. make 自动化变量

            | $@   | 表示所有目标                                                 |
            | ---- | ------------------------------------------------------------ |
            | $<   | 表示第一个依赖文件，如果依赖模式是%，那么它就表示一系列文件（%为通配符，类似linux上的*） |
            | $^   | 表示所有依赖                                                 |

            var=$(wildcard ./8.c ./test/*.c) 展开指定目录

            var1=$(not dir \$(var))  去掉路径

            var2=$(dir \$(var)) 去除目录

            $(patsubst 源文件，目标文件，文件列表) 替换文件后缀

            $(foreach <var>,<list>,<text>) 把参数<list>中的单词逐一取出放到参数<var>所指定的变量中，然后再执行<text>所包含的表达式。每一次<text>会返回一个字符串

        
        14. vim配置文件shell
        
            ```shell
            #!/bin/bash
            echo "安装将花费一定时间，请耐心等待直到安装完成^_^"
            if which apt-get >/dev/null; then
            	sudo apt-get install -y vim vim-gnome ctags xclip astyle python-setuptools python-dev git
            elif which yum >/dev/null; then
            	sudo yum install -y gcc vim git ctags xclip astyle python-setuptools python-devel	
            fi
            
            ##Add HomeBrew support on  Mac OS
            if which brew >/dev/null;then
                echo "You are using HomeBrew tool"
                brew install vim ctags git astyle
            fi
            
            sudo easy_install -ZU autopep8 
            sudo ln -s /usr/bin/ctags /usr/local/bin/ctags
            mv -f ~/vim ~/vim_old
            cd ~/ && git clone https://github.com/ma6174/vim.git
            mv -f ~/.vim ~/.vim_old
            mv -f ~/vim ~/.vim
            mv -f ~/.vimrc ~/.vimrc_old
            mv -f ~/.vim/.vimrc ~/
            git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
            echo "ma6174正在努力为您安装bundle程序" > ma6174
            echo "安装完毕将自动退出" >> ma6174
            echo "请耐心等待" >> ma6174
            vim ma6174 -c "BundleInstall" -c "q" -c "q"
            rm ma6174
            echo "安装完成"
            ```
        
            保存为sh文件
        
        15. 所有系统调用函数
        
            ```sh
            		System call                Kernel        Notes
                   ───────────────────────────────────────────────────────────────────────────
            
                   _llseek(2)                 1.2
                   _newselect(2)              2.0
                   _sysctl(2)                 2.0
                   accept(2)                  2.0           See notes on socketcall(2)
                   accept4(2)                 2.6.28
                   access(2)                  1.0
                   acct(2)                    1.0
                   add_key(2)                 2.6.11
                   adjtimex(2)                1.0
                   alarm(2)                   1.0
                   alloc_hugepages(2)         2.5.36        Removed in 2.5.44
                   bdflush(2)                 1.2           Deprecated (does nothing)
                                                            since 2.6
                   bind(2)                    2.0           See notes on socketcall(2)
                   bpf(2)                     3.18
                   brk(2)                     1.0
                   cacheflush(2)              1.2           Not on x86
                   capget(2)                  2.2
                   capset(2)                  2.2
                   chdir(2)                   1.0
                   chmod(2)                   1.0
                   chown(2)                   2.2           See chown(2) for
                                                            version details
                   chown32(2)                 2.4
                   chroot(2)                  1.0
                   clock_adjtime(2)           2.6.39
                   clock_getres(2)            2.6
                   clock_gettime(2)           2.6
                   clock_nanosleep(2)         2.6
                   clock_settime(2)           2.6
                   clone(2)                   1.0
                   close(2)                   1.0
                   connect(2)                 2.0           See notes on socketcall(2)
                   creat(2)                   1.0
                   create_module(2)           1.0           Removed in 2.6
                   delete_module(2)           1.0
                   dup(2)                     1.0
                   dup2(2)                    1.0
                   dup3(2)                    2.6.27
                   epoll_create(2)            2.6
                   epoll_create1(2)           2.6.27
                   epoll_ctl(2)               2.6
                   epoll_pwait(2)             2.6.19
                   epoll_wait(2)              2.6
                   eventfd(2)                 2.6.22
                   eventfd2(2)                2.6.27
                   execve(2)                  1.0
                   execveat(2)                3.19
                   exit(2)                    1.0
                   exit_group(2)              2.6
                   faccessat(2)               2.6.16
                   fadvise64(2)               2.6
                   fadvise64_64(2)            2.6
                   fallocate(2)               2.6.23
                   fanotify_init(2)           2.6.37
                   fanotify_mark(2)           2.6.37
                   fchdir(2)                  1.0
                   fchmod(2)                  1.0
                   fchmodat(2)                2.6.16
                   fchown(2)                  1.0
                   fchown32(2)                2.4
                   fchownat(2)                2.6.16
                   fcntl(2)                   1.0
                   fcntl64(2)                 2.4
                   fdatasync(2)               2.0
                   fgetxattr(2)               2.6; 2.4.18
                   finit_module(2)            3.8
                   flistxattr(2)              2.6; 2.4.18
                   flock(2)                   2.0
                   fork(2)                    1.0
                   free_hugepages(2)          2.5.36        Removed in 2.5.44
                   fremovexattr(2)            2.6; 2.4.18
                   fsetxattr(2)               2.6; 2.4.18
                   fstat(2)                   1.0
                   fstat64(2)                 2.4
                   fstatat64(2)               2.6.16
                   fstatfs(2)                 1.0
                   fstatfs64(2)               2.6
                   fsync(2)                   1.0
                   ftruncate(2)               1.0
                   ftruncate64(2)             2.4
                   futex(2)                   2.6
                   futimesat(2)               2.6.16
                   get_kernel_syms(2)         1.0           Removed in 2.6
                   get_mempolicy(2)           2.6.6
                   get_robust_list(2)         2.6.17
                   get_thread_area(2)         2.6
                   getcpu(2)                  2.6.19
                   getcwd(2)                  2.2
                   getdents(2)                2.0
                   getdents64(2)              2.4
                   getegid(2)                 1.0
                   getegid32(2)               2.4
                   geteuid(2)                 1.0
                   geteuid32(2)               2.4
                   getgid(2)                  1.0
                   getgid32(2)                2.4
                   getgroups(2)               1.0
                   getgroups32(2)             2.4
                   getitimer(2)               1.0
                   getpeername(2)             2.0           See notes on socketcall(2)
                   getpagesize(2)             2.0           Not on x86
                   getpgid(2)                 1.0
                   getpgrp(2)                 1.0
                   getpid(2)                  1.0
                   getppid(2)                 1.0
                   getpriority(2)             1.0
                   getrandom(2)               3.17
                   getresgid(2)               2.2
                   getresgid32(2)             2.4
                   getresuid(2)               2.2
                   getresuid32(2)             2.4
                   getrlimit(2)               1.0
                   getrusage(2)               1.0
                   getsid(2)                  2.0
                   getsockname(2)             2.0           See notes on socketcall(2)
                   getsockopt(2)              2.0           See notes on socketcall(2)
                   gettid(2)                  2.4.11
                   gettimeofday(2)            1.0
                   getuid(2)                  1.0
                   getuid32(2)                2.4
                   getxattr(2)                2.6; 2.4.18
                   init_module(2)             1.0
                   inotify_add_watch(2)       2.6.13
                   inotify_init(2)            2.6.13
                   inotify_init1(2)           2.6.27
                   inotify_rm_watch(2)        2.6.13
                   io_cancel(2)               2.6
                   io_destroy(2)              2.6
                   io_getevents(2)            2.6
                   io_setup(2)                2.6
                   io_submit(2)               2.6
                   ioctl(2)                   1.0
                   ioperm(2)                  1.0
                   iopl(2)                    1.0
                   ioprio_get(2)              2.6.13
                   ioprio_set(2)              2.6.13
                   ipc(2)                     1.0
                   kcmp(2)                    3.5
                   kern_features(2)           3.7           Sparc64
                   kexec_file_load(2)         3.17
                   kexec_load(2)              2.6.13
                   keyctl(2)                  2.6.11
                   kill(2)                    1.0
                   lchown(2)                  1.0           See chown(2) for
                                                            version details
                   lchown32(2)                2.4
                   lgetxattr(2)               2.6; 2.4.18
                   link(2)                    1.0
                   linkat(2)                  2.6.16
                   listen(2)                  2.0           See notes on socketcall(2)
                   listxattr(2)               2.6; 2.4.18
                   llistxattr(2)              2.6; 2.4.18
                   lookup_dcookie(2)          2.6
                   lremovexattr(2)            2.6; 2.4.18
                   lseek(2)                   1.0
                   lsetxattr(2)               2.6; 2.4.18
                   lstat(2)                   1.0
                   lstat64(2)                 2.4
                   madvise(2)                 2.4
                   mbind(2)                   2.6.6
                   memfd_create(2)            3.17
                   migrate_pages(2)           2.6.16
                   mincore(2)                 2.4
                   mkdir(2)                   1.0
                   mkdirat(2)                 2.6.16
                   mknod(2)                   1.0
                   mknodat(2)                 2.6.16
                   mlock(2)                   2.0
                   mlock2(2)                  4.4
                   mlockall(2)                2.0
                   mmap(2)                    1.0
                   mmap2(2)                   2.4
                   modify_ldt(2)              1.0
                   mount(2)                   1.0
                   move_pages(2)              2.6.18
                   mprotect(2)                1.0
                   mq_getsetattr(2)           2.6.6
                   mq_notify(2)               2.6.6
                   mq_open(2)                 2.6.6
                   mq_timedreceive(2)         2.6.6
                   mq_timedsend(2)            2.6.6
                   mq_unlink(2)               2.6.6
                   mremap(2)                  2.0
                   msgctl(2)                  2.0           See notes on ipc(2)
                   msgget(2)                  2.0           See notes on ipc(2)
                   msgrcv(2)                  2.0           See notes on ipc(2)
                   msgsnd(2)                  2.0           See notes on ipc(2)
                   msync(2)                   2.0
                   munlock(2)                 2.0
                   munlockall(2)              2.0
                   munmap(2)                  1.0
                   name_to_handle_at(2)       2.6.39
                   nanosleep(2)               2.0
                   nfsservctl(2)              2.2           Removed in 3.1
                   nice(2)                    1.0
                   oldfstat(2)                1.0
                   oldlstat(2)                1.0
                   oldolduname(2)             1.0
                   oldstat(2)                 1.0
                   olduname(2)                1.0
                   open(2)                    1.0
                   open_by_handle_at(2)       2.6.39
                   openat(2)                  2.6.16
                   pause(2)                   1.0
                   pciconfig_iobase(2)        2.2.15; 2.4   Not on x86
                   pciconfig_read(2)          2.0.26; 2.2   Not on x86
                   pciconfig_write(2)         2.0.26; 2.2   Not on x86
                   perf_event_open(2)         2.6.31        Was perf_counter_open() in
                                                            2.6.31; renamed in 2.6.32
                   personality(2)             1.2
                   perfctr(2)                 2.2           Sparc; removed in 2.6.34
                   perfmonctl(2)              2.4           ia64
                   pipe(2)                    1.0
                   pipe2(2)                   2.6.27
                   pivot_root(2)              2.4
                   poll(2)                    2.0.36; 2.2
                   ppc_rtas(2)                2.6.2         PowerPC only
                   ppoll(2)                   2.6.16
                   prctl(2)                   2.2
                   pread64(2)                               Added as "pread" in 2.2;
                                                            renamed "pread64" in 2.6
                   preadv(2)                  2.6.30
                   prlimit64(2)               2.6.36
                   process_vm_readv(2)        3.2
                   process_vm_writev(2)       3.2
                   pselect6(2)                2.6.16
                   ptrace(2)                  1.0
                   pwrite64(2)                              Added as "pwrite" in 2.2;
                                                            renamed "pwrite64" in 2.6
                   pwritev(2)                 2.6.30
                   query_module(2)            2.2           Removed in 2.6
                   quotactl(2)                1.0
                   read(2)                    1.0
                   readahead(2)               2.4.13
                   readdir(2)                 1.0
                   readlink(2)                1.0
                   readlinkat(2)              2.6.16
                   readv(2)                   2.0
                   reboot(2)                  1.0
                   recv(2)                    2.0           See notes on socketcall(2)
                   recvfrom(2)                2.0           See notes on socketcall(2)
                   recvmsg(2)                 2.0           See notes on socketcall(2)
                   recvmmsg(2)                2.6.33
                   remap_file_pages(2)        2.6           Deprecated since 3.16
                   removexattr(2)             2.6; 2.4.18
                   rename(2)                  1.0
                   renameat(2)                2.6.16
                   renameat2(2)               3.15
                   request_key(2)             2.6.11
                   restart_syscall(2)         2.6
                   rmdir(2)                   1.0
                   rt_sigaction(2)            2.2
                   rt_sigpending(2)           2.2
                   rt_sigprocmask(2)          2.2
                   rt_sigqueueinfo(2)         2.2
                   rt_sigreturn(2)            2.2
                   rt_sigsuspend(2)           2.2
                   rt_sigtimedwait(2)         2.2
                   rt_tgsigqueueinfo(2)       2.6.31
                   s390_runtime_instr(2)      3.7           s390 only
                   s390_pci_mmio_read(2)      3.19          s390 only
                   s390_pci_mmio_write(2)     3.19          s390 only
                   sched_get_priority_max(2)  2.0
                   sched_get_priority_min(2)  2.0
                   sched_getaffinity(2)       2.6
                   sched_getattr(2)           3.14
                   sched_getparam(2)          2.0
                   sched_getscheduler(2)      2.0
                   sched_rr_get_interval(2)   2.0
                   sched_setaffinity(2)       2.6
                   sched_setattr(2)           3.14
                   sched_setparam(2)          2.0
                   sched_setscheduler(2)      2.0
                   sched_yield(2)             2.0
                   seccomp(2)                 3.17
                   select(2)                  1.0
                   semctl(2)                  2.0           See notes on ipc(2)
                   semget(2)                  2.0           See notes on ipc(2)
                   semop(2)                   2.0           See notes on ipc(2)
                   semtimedop(2)              2.6; 2.4.22
                   send(2)                    2.0           See notes on socketcall(2)
                   sendfile(2)                2.2
                   sendfile64(2)              2.6; 2.4.19
                   sendmmsg(2)                3.0
                   sendmsg(2)                 2.0           See notes on socketcall(2)
                   sendto(2)                  2.0           See notes on socketcall(2)
                   set_mempolicy(2)           2.6.6
                   set_robust_list(2)         2.6.17
                   set_thread_area(2)         2.6
                   set_tid_address(2)         2.6
                   setdomainname(2)           1.0
                   setfsgid(2)                1.2
                   setfsgid32(2)              2.4
                   setfsuid(2)                1.2
                   setfsuid32(2)              2.4
                   setgid(2)                  1.0
                   setgid32(2)                2.4
                   setgroups(2)               1.0
                   setgroups32(2)             2.4
                   sethostname(2)             1.0
                   setitimer(2)               1.0
                   setns(2)                   3.0
                   setpgid(2)                 1.0
                   setpriority(2)             1.0
                   setregid(2)                1.0
                   setregid32(2)              2.4
                   setresgid(2)               2.2
                   setresgid32(2)             2.4
                   setresuid(2)               2.2
                   setresuid32(2)             2.4
                   setreuid(2)                1.0
                   setreuid32(2)              2.4
                   setrlimit(2)               1.0
                   setsid(2)                  1.0
                   setsockopt(2)              2.0           See notes on socketcall(2)
                   settimeofday(2)            1.0
                   setuid(2)                  1.0
                   setuid32(2)                2.4
                   setup(2)                   1.0           Removed in 2.2
                   setxattr(2)                2.6; 2.4.18
                   sgetmask(2)                1.0
                   shmat(2)                   2.0           See notes on ipc(2)
                   shmctl(2)                  2.0           See notes on ipc(2)
                   shmdt(2)                   2.0           See notes on ipc(2)
                   shmget(2)                  2.0           See notes on ipc(2)
                   shutdown(2)                2.0           See notes on socketcall(2)
                   sigaction(2)               1.0
                   sigaltstack(2)             2.2
                   signal(2)                  1.0
                   signalfd(2)                2.6.22
                   signalfd4(2)               2.6.27
                   sigpending(2)              1.0
                   sigprocmask(2)             1.0
                   sigreturn(2)               1.0
                   sigsuspend(2)              1.0
                   socket(2)                  2.0           See notes on socketcall(2)
                   socketcall(2)              1.0
                   socketpair(2)              2.0           See notes on socketcall(2)
                   splice(2)                  2.6.17
                   spu_create(2)              2.6.16        PowerPC only
                   spu_run(2)                 2.6.16        PowerPC only
                   ssetmask(2)                1.0
                   stat(2)                    1.0
                   stat64(2)                  2.4
                   statfs(2)                  1.0
                   statfs64(2)                2.6
                   stime(2)                   1.0
                   subpage_prot(2)            2.6.25        PowerPC only
                   swapoff(2)                 1.0
                   swapon(2)                  1.0
                   symlink(2)                 1.0
                   symlinkat(2)               2.6.16
                   sync(2)                    1.0
                   sync_file_range(2)         2.6.17
                   sync_file_range2(2)        2.6.22
                   syncfs(2)                  2.6.39
                   sysfs(2)                   1.2
                   sysinfo(2)                 1.0
                   syslog(2)                  1.0
                   tee(2)                     2.6.17
                   tgkill(2)                  2.6
                   time(2)                    1.0
                   timer_create(2)            2.6
                   timer_delete(2)            2.6
                   timer_getoverrun(2)        2.6
                   timer_gettime(2)           2.6
                   timer_settime(2)           2.6
                   timerfd_create(2)          2.6.25
                   timerfd_gettime(2)         2.6.25
                   timerfd_settime(2)         2.6.25
                   times(2)                   1.0
                   tkill(2)                   2.6; 2.4.22
                   truncate(2)                1.0
                   truncate64(2)              2.4
                   ugetrlimit(2)              2.4
                   umask(2)                   1.0
                   umount(2)                  1.0
                   umount2(2)                 2.2
                   uname(2)                   1.0
                   unlink(2)                  1.0
                   unlinkat(2)                2.6.16
                   unshare(2)                 2.6.16
                   uselib(2)                  1.0
                   ustat(2)                   1.0
                   userfaultfd(2)             4.2
                   utime(2)                   1.0
                   utimensat(2)               2.6.22
                   utimes(2)                  2.2
                   utrap_install(2)           2.2           Sparc only
                   vfork(2)                   2.2
                   vhangup(2)                 1.0
                   vm86old(2)                 1.0           Was "vm86"; renamed in 2.0.28/2.2
                   vm86(2)                    2.0.28; 2.2
                   vmsplice(2)                2.6.17
                   wait4(2)                   1.0
                   waitid(2)                  2.6.10
                   waitpid(2)                 1.0
                   write(2)                   1.0
                   writev(2)                  2.0
            ```
        
            