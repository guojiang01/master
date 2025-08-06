# AMD FPGA设计优化宝典：面向Vivado/SystemVerilog

1. 1985年，XC2064。2001年150nm工艺Virtex-II。2002年，130nm工艺Virtex-II Pro。2004年90nm Virtex_4。2006年65nm Virtex-5。2009年40nm Virtex-6和45nm Spartan-6。2011年28nm的7系列，Virtex-7系统性能比较苛刻的场合，Kintex-7最佳性价比，Artix-7低功耗高速收发器。2017年Spartan-7。2011年发布zynq-7000系列soc。2014年20nm UltraScale，包括kintex和virtex。2016年16nm UltraScale+，Artix(2021年)、Kintex、Virtex(HBM high bandwith memory)、zynqMPsoc和zynq RFsoc。2019年7nm Versal，自适应加速平台而不是FPGA。
2. 一个“LUT+一根走线”的延迟为0.5ns，使用于7系列。假定寄存器时钟周期为T，那么该路径所能承载的最大逻辑级数为T/0.5，也就是2T。如果逻辑级数大于2T，而时序又未能收敛，就可以怀疑时序违例与逻辑级数较高有关。
3. case语句隐含地对首先解码的选项赋予较高的优先级，但当各分支选项互斥时，综合工具会将其综合为一个MUX，而不是优先结构。
4. 尽管当if-else-if语句的每个分支是用互斥条件指定时，其功能和case语句等效，将被综合为mux，不再具有优先级，但仍然建议此时采用case语句描述更为合理，不仅增强了代码的可读性，也便于代码的管理和维护。
5. 采用if语句描述组合逻辑时，对于不完备的if语句，即缺少else分支的if语句，要格外关注，因为工具会将其推断为锁存器。
6. 采用case语句描述组合逻辑时，要格外关注缺少default分支的case语句，这可能会导致工具推断出锁存器，
7. 对于RTL代码中有未知状态x的情形，要分别进行行为及仿真和综合后的功能仿真，要确定是否可接受
8. 注意casex和casez的区别，casex将条件分支及对应的执行语句中的x和z都视为无关态，而casez仅将z视为无关态。在条件分支中，对于高阻态，可以使用z来表示，也可以使用？表示
9. 对于有优先级的编码器，建议使用if-else-if语句描述，不要采用case或case的变种
10. 在一个进程always_comb中的多个顺序if语句，若条件变量不同，则它们是有优先级的，最后一条if语句的优先级最高，若条件变量相同，则综合后的电路不再有优先级。
11. 在可综合systemverilog代码中使用函数时，应将其声明为automatic（默认为static），这样在每次调用时，系统会给函数分配新的内存空间。
12. 两个N位二进制数相加，为防止溢出，和应设置为N+1位。
13. 优化触发器
    1. 用RTL代码描述D触发器时，始终遵循SR优先级高于CE，应避免既复位又置位。
    2. 在设计中应尽量避免使用锁存器，可将其转化为带时钟使能信号的D触发器。
    3. 在设计中应始终保持触发器时钟采样极性一致
    4. 对于多位宽数据信号的跨时钟域，应使用FIFO进行隔离
    5. 控制集个数占总控制集7.5%时，是可以接受的。介于7.5%-15%建议降低控制集。大于15%时，必须降低
    6. 如果设计中确实需要复位信号，应优先选择使用同步复位
    7. 对于异步复位，应将其通过复位桥展宽并同步化到相应的时钟域下，以保证异步复位同步释放
    8. 对于全局复位信号，应采用复位树的方式降低扇出，使其变为局部的复位信号
    9. 如果复位信号仅仅扮演的是上电复位的角色，那么应从设计中移除这样的复位信号
    10. 将需要复位的信号和不需要复位的信号分开写在不同的进程里


14. 异步复位可以同步化，以保证该异步复位信号最终能在时钟clk下同步释放。

    ```systemverilog
    //file : rst_bridge.s
    module rst_bridge
        #(parameter=4) //不超过8
        (input logic clk,
        input logic aset,
         output logic srst);
        (*ASYNC_REG="TRUE"*) logic[N-1:0] bridge='0';
        (*ASYNC_REG="TRUE"*) logic[1:0] bridge_dly='0';
        always_comb begin
            srst=bridge_dly[1];
        end
        always_ff@(posedge clk,posedge aset) begin
            if(aset)begin
                bridge <='1';
            end else begin
                bridge <={bridge[N-2:0],1'b0};
            end
        end
        always_ff@(posedge clk) begin
            bridge_dly[0]<=bridge[n-1];
            bridge_dly[1]<=bridge_dly[0];
        end
    endmodule
    ```
    
    