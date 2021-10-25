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

   