## Linux相关

1. linux下的二进制文件包括可执行文件、静态库和动态库等，均采用ELF(Executable and Linkable Format)格式存储，目标文件的格式也不例外，也采用ELF格式存储。
2. 对于32位的ELF文件来说，其最前部是文件头部信息，描述了整个文件的基本属性，除了包括该文件运行在什么操作系统中、运行在什么硬件体系结构上、程序入口地址是什么等基本信息外，最重要的是记录了两个表格的相关信息，如表格所在的位置、其中包括的条目数等。这两个表格一个是Section Header Table,主要是供编译时链接使用的，表格中定义了各个段的位置、长度、属性等信息；另外一个是Program Header Table，主要是供内核和动态加载器从磁盘加载ELF文件到内存时使用。
3. ELF头占用了52个字节，通过ELF头可见该文件是32位的ELF文件；使用"little endian"字节序存储字节；ABI遵循UNIX-System V标准；运行在类UNIX系统上；文件是一个"REL(Relocatable file)"类型的文件，通常，可执行文件的类型是"EXEC(Executable file)",动态共享库的类型是"DYN(Shared object file)",静态库和目标文件库的类型是"REL"；该目标文件是为IA32架构编译的；因为是目标文件，不存在执行的概念，所以程序入口"Entry point address"在这里不适用(同样道理，Program Header Table也不适用)。
4. 在文件头信息后，就是各个段了。毫不夸张的说，ELF文件就是段的组合。大体上，段可以分为如下几类：一类是存储指令的，通常称为代码段；第二类是存储数据的，通常称为数据段。但是存储数据的又细分为两个段，已经初始化的全局数据存放在".data"段中，未初始化的全局数据存储在".bss"段。
5. objdump hexdump readelf