## FPGA学习笔记

1. 10个要点
   1. 不要太多的if-else嵌套
   2. 不要编写过于庞大的状态机
   3. 复杂的状态机，可以采用2段式以上的实现
   4. 尽量使用时序逻辑完成编程
   5. 使用组合逻辑不要过于庞大
   6. 复杂代码拆分简单模块
   7. 复杂计算，增加流水线设计
   8. 高速模块和低速模块搭配使用
   9. case语句一定有default
   10. 组合逻辑有if必须有else防止产生锁存器，锁存器容易出毛刺

2. 压缩程序，好处：下载速度快，占用FLASH更小的体积，加载速度更快，通过配置FLASH为4线加载。加入以下代码

   ```tcl
   set_property CFGBVS VCCO [current_design]
   set_property CONFIG_VOLTAGE 3.3 [current_design]
   set_property BITSTREAM.GENERAL.COMPRESS true [current_design]
   set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]
   set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
   set_property BITSTREAM.CONFIG.SPI_FALL_EDGE Yes [current_design]
   ```

   如果是ZYNQ的FPGA，由于ZYNQ 的FLASH 不是通过FPGA 加载的，而是通过ARM,那么只要以下几行代码：

   ```tcl
   set_property CFGBVS VCCO [current_design]
   set_property CONFIG_VOLTAGE 3.3 [current_design]
   set_property BITSTREAM.GENERAL.COMPRESS true [current_design]
   ```

   如果你是ZYNQ UltarScale+ 的FPGA，那么只要以下几行代码：

   ```tcl
   set_property BITSTREAM.GENERAL.COMPRESS true [current_design]
   ```

   1. CFGBVS 参数：
      当CFGBVS 连接至Bank 0 的VCCO 时，Bank 0 的VCCO 必须为2.5V 或3.3V。如果Bank 14 或15 的
      I/O 用于配置，则这些Bank（14 和15）的VCCO 也必须为2.5V 或3.3V。在CFGBVS 连接至GND 时，Bank
      0 的VCCO 应为1.8V。如果Bank 14 或15 的I/O 用于配置，那么这些Bank（14 和15）的VCCO 也必须为
      1.8V。
   2. CONFIG_VOLTAGE
      设置为对应配置电压我们这里是3.3V
   3. BITSTREAM.GENERAL.COMPRESS
      压缩BIT 文件
   4. BITSTREAM.CONFIG.CONFIGRATE
      设置FLASH 配置速度，仅纯FPGA 有作用，对于ZYNQ 不支持
   5. BITSTREAM.CONFIG.SPI_BUSWIDTH
      设置FLASH 配置的位宽, 仅纯FPGA 有作用，对于ZYNQ 不支持
   6. BITSTREAM.CONFIG.SPI_FALL_EDGE
      设置FLASH 接口的时钟加载沿, 仅纯FPGA 有作用，对于ZYNQ 不支持

