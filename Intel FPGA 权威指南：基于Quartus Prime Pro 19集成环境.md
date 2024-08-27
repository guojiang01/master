# Intel FPGA 权威指南：基于Quartus Prime Pro 19集成环境 9787121382444

1. 高级综合设置：Compiler setting->Advanced setting(synthsis)...->advanced analysis & syhthesis settings.高级分析和综合设置的选项

   | 选项                                                         | 功能描述                                                     |
   | ------------------------------------------------------------ | ------------------------------------------------------------ |
   | Allow Any RAM Size for Recognition                           | 允许编译器推断任何大小的 RAM，即使 RAM 不满足当前对大小的最低要求 |
   | Allow Any ROM Size for Recognition                           | 允许编译器推断任何大小的 ROM，即使 ROM 不满足当前对大小的最低要求 |
   | Allow Any Shift Register Size for Recognition                | 允许编译器推断任何大小的移位寄存器，即使它们不满足当前对大小的最低要求 |
   | Allow Register Duplication                                   | 控制编译器是否赋值寄存器以提高设计的性能。 当使能该选项时，编译器执行优化，创建寄存器的第二个副本并将其扇出的一部分移到这个新的节点。这个技术改善了布线能力，降低了要求布线一个网络所需要的总的布线数量。如果禁止该选项，则也会禁止重定时寄存器<br/>注：不适用于 Stratix 10 器件 |
   | Allow Register Merging                                       | 控制编译器是否去掉（合并）相同的寄存器。当使能该选项时，在两个寄存器生成相同逻辑时，编译器可能会刷除一个寄存器，并且将剩余寄存器的扇出挪到己扇出寄存器的目标位置。如果要阻止编译器删除设计者故意使用的重复寄存器时，则该选项很有用。当禁止时，也会禁用重定时优化<br/>注：不适用于 Stratix 10 器件 |
   | Allow Shift Register Merging across Hierarchies              | 允许编译器从不同层次的结构中获取移位寄存器，并将寄存器放到同一个 RAM 中 |
   | Allow Synchronous Control Signals                            | 允许编译器在正常模式逻辑单元中使用同步清除和同步加载信号。启用该选项将有助于减少设计中使用的逻辑单元总数，但会对适配产生负面影响。当一个 LAB中的所有逻辑单元共享同步控制信号时，会产生这种负面影响 |
   | Analysis & Synthesis Message Level                           | 指定编译器显示的 Analysis & Synthesis（分析和综合）消息类型。选择 Low，仅显示最重要的分析和综合消息；选择 Medium，显示绝大部分消息，但隐藏详细消息；选择High，显示所有消息 |
   | Auto Clock Enable Replacement                                | 允许编译器定位连接一个寄存器的逻辑，并且将逻辑移到寄存器的时钟使能揄入端口 |
   | Auto DSP Block Replacement                                   | 允许编译器找到乘和累加功能或乘和加功能，它们可以用 DSP 块代替 |
   | Auto Gated Clock Conversion                                  | 自动转换门控时钟以使用时钟使能引脚。时钟门控逻辑包含 AND、OR、MUX 和<br/>NOT 门。使能该选项，可能会增加存储器的使用和整体的运行时间。设计者必须使用时序分析工具（Timing Analyzer）用于时序分析，必须以 Synopsys设计约束格式(Synopsys Design Constraints, SDC)定义所有的基本时钟 |
   | Auto Open-Drain Pins                                         | 允许编译器自动将一个带有强低数据输入的三态缓冲区转换为等效的开漏缓冲区 |
   | Auto RAM Replacement                                         | 允许编译器识别可以用 altsyncram 或 lpm_ram_dp IP 核替换的寄存器和逻辑集合。使能该选项，可能会改变设计的功能 |
   | Auto ROM Replacement                                         | 允许编译器识别可以用 altsyncram 或 lpm_rom_dp IP 核替换的逻辑。使能该选项，可能会改变设计的上电状态 |
   | Auto Resource Sharing                                        | 允许编译器在 HDL 源码中许多类似但互斥的操作之间共享硬件资源。如果使能该选项，则编译器会合并兼容的加法、减法和乘法运算。合并操作会减少设计所使用的面积。因为资源共享在每个共享资源上引入了额外的多路复用和控制逻辑，所以它可能会对设计最终的设计时钟 （fmax）产生负面影响 |
   | Auto Shift Register Placement                                | 允许编译器找到一组长度相同的移位奇存器，可以用 altshift taps IP 核替换。移位奇存器必须全部使用相同的时钟和时钟使能信号。寄存器不能有其他第二级信号。寄存器必须有等间隔的抽头，这些抽头至少间隔3个寄存器 |
   | Automatic Parallel Synthesis                                 | 该选项用于使能/禁止自动并行综合。使用这个选项，通过使用多个可用的处理器来加速综合编译时间 |
   | Block Design Naming                                          | 为块设计指定命名方案。如果设计者将该选项分配给除设计实体外的其他选项，编译器将忽略该选项 |
   | Clock MUX Protection                                         | 使时钟网络中的多路复用器分解为 2：1多路选择器树。编译器保护这些树不与逻辑合并或转换到其他逻辑。这个选项帮助 Timing Analyzer 分析时钟行为 |
   | DSP Block Balancing                                          | 在DSP 块平衡期间，允许设计者控制某些 DSP 块切片的转换<br/>   |
   | Disable DSP Negate Interface                                 | 允许设计者指定是否在推断的 DSP 块上使用否定端口              |
   | Disable Register Merging Across Hierarchies                  | 指定纷译器是否允许对处于不同层次的结构而具有相同输入的奇存器进行-合并 |
   | Enable Formal Verification Support                           | 使能编译器为使用 OneSpin*形式的验证工具编写脚本              |
   | Enable State Machines Inference                              | 允许编译器从 VHDL 或 Veilog HDL设计文件中推断状态机。编译器优化状态机以减少面积并提高性能。如果设置为off，则编译器将VHDL或Verilog设计文件中的状态机提取并优化为常规逻辑 |
   | Force Use of Synchronous<br/>Clear Signals                   | 强制编译器在正常模式逻辑单元中使用同步清除信号。使能该选项有助于减少设计中使用的逻辑单元的总数，但是对适配器会产生负面影响，在LAB内的所有逻辑单元共享同步控制信号 |
   | Fractal Synthesis                                            | 打开该选型，指导编译器将墨迹打包应用于算术块，从而算术密集型设计最大限度地减少设计面积 |
   | HDL Message Level                                            | 指定要查看 HDL 消息的类型，包含在HDL源代码中显示处理错误的消息。Level1 只显示最重要的 HDL 消息：level2 显示大多数的 HDL 消息，包含警告和基于信息的消息：Level3 显示所有的 HDL 消息，包括基于警告和信息的消息，以及有关潜在设计问题或 lint 错误的警报 |
   | Ignore GLOBAL Buffers                                        | 忽略设计中的全局缓冲区。如果将该选项应用于单个全局缓冲区或包含全局缓冲区的设计实体以外的任何内容，则编译器将忽略该选项 |
   | Ignore LCELL Buffers                                         | 在设计中忽略 LCELL 缓冲区。如果将这个选项用于单个 LCELL 缓冲区或包含LCELL 缓冲区的设计实体以外的任何其他选项，编译器将忽略该选项 |
   | Ignore Maximum Fan-out Assignments                           | 指导编译器忽略在一个节点、一个实体或整个设计的最大扇出分配   |
   | Ignore SOFT Buffers                                          | 忽略设计中的软（SOFT）缓冲区。如果将该选项应用于除单个软缓冲区或包含软缓冲区的设计实体以外的任何其他选项，则编译器将忽略该选项 |
   | Ignore translate off and synthesis off Directives            | 忽略 Verilog HDL 和 VHDL 设计文件中的所有 translate_ off/synthesis off 综合命令。使用该选项可以禁止这些综合命令，并在详细描述（Elaboration）过程中包含先前忽略的代码 |
   | Infer RAMs from Raw Logic                                    | 从寄存器和多路复用器推断 RAM。编译器最初将一些不同于 RAM 模板的 HDL 模式转换为逻辑。然而，这些结构用作 RAM。因此，当启用该选项时，在后面的阶段，编译器可能会为它们替换 altsyncramIP 核实例。当使能该分配后，编译器可能会使用更多的 RAM 资源和更少的 LAB |
   | Iteration Limit for Constant Verilog Loops                   | 为带有循环条件的 verilog 循环定义迭代限制，它在每次循环迭代时评估为编译时常量。这个限制主要用于在一个真正的无限循环中，在它们耗尽存储器或陷入软件之前识别潜在的无限循环 |
   | Iteration Limit for non-Constant Verilog Loops               | 带有循环系件的 verilog 循环定义迭代限制，它在每次循环选代时不会评估为编译时常量。这个限制主要用于在一个真正的无限循环中，在它们耗尽存储器或陷入软件之前识别潜在的无限循环 |
   | Maximum DSP Block Usage                                      | 指定 DSP 块平衡器假定在当前器件中用于每个分区的 DSP 块最大数量。这个选项覆盖在当前器件支持最大DSP块数量的常用方法 |
   | Maximum Number of LABs                                       | 这个选项覆指定分析和综合 (Analysis & Synthesis)应尝试用于器件的LAB 最大数量。当该值为非负且小于当前器件可用的最大LAB数量时，该选项将覆盖使用当前设备支持的最大LAB数量的常用方法 |
   | Maximum Number of M4K/M9K/M20K/M10K memory Blocks            | 指定编译器用于器件最大M4K/M9K/M20K/M10K存储器块的数量。当值为非负且小于当前器件可用的M4K/M9K/M20K/M10K存储器块的最大数量时，这个选项将覆盖使用当前器件的最大M4K/M9K/M20K/M10K存储器块的常用方法 |
   | Maximum Number of Registers Created from Uninferred RAMs     | 指定分析和综合 (Analysis & Synthesis) 用于转换未推断 RAM 的最大寄存器数量。通过在分区根的实例名字上没置分配，可以将该选项用作项目范围选项或指定分区。在个分区上的分配会覆盖该特定分区的全局分配 （如果有)。当很多寄存器用于未推断的 RAM 时，这个选项阻止综合工具导致较长的编译和运行时存储器溢出。Quartus 软件不会继续编译，而是会发出错误并退出 |
   | Not Gate Push-Back                                           | 允编译器通过一个奇存器将反转（非门）退回，并且在该寄存器的数据输入上实现。（如果在设计时，这是必要的）。当打开该选项时，寄存器可能上电到一个活动的高状态，并且可能需要在器件初始化操作期间明确清除。如果将其应用于除单个寄存器或包含寄存器设计实体以外的其他内容，编译器将忽略该选项。当把该选项用于有寄存器直按馈送的输出引脚时，分配会自动转移到该寄存器 |
   | Number of Inverted Registers Reported in Synthesis Report    | 指定在综合报告中显示的反转奇存器的最大数量                   |
   | Number of Protected Registers Reported in Synthesis Report   | 指定在综合报告中显示的被保护各存器的最大数量                 |
   | Number of Removed Registers Reported in Synthesis Migration Checks | 指定在综合迁移检查（Synthesis Migration Check）报告中显示的最大行数 |
   | Number of Swept Nodes Reported in Synthesis Report           | 指定在综合报告中豆示的最大扫描节点数。扫描节点是从设计者的设计中删除的任何节点，因为编译器发现该节点是不必要的 |
   | Number of Rows Reported in Synthesis Report                  | 指定在综合报告中显示的最大行数<br/>注：该选项不适用于 Stratix 10 器件 |
   | Optimization Technique                                       | 为分析和综合 (Analysis & Synthesis）指定总体优化目标。指定平衡 (Balanced）策略，或针对性能、面积、布线能力、功耗或编译时间进行优化。编译器以设计者指定的优化目标为目标 |
   | Perform WYSIWYG Primitive Resynthesis                        | 指定在综合期间是否执行 wYSIWYG 原语重新综合。这个选项使用在优化技术逻辑选项 (Optimization Technique Logic）中指定的设置 |
   | Power-Up Don't Cares                                         | 导致没有上电电平逻辑选项设置的寄存器使用无关逻辑电平（X）上电。当使能该选项时，编译器确定何时更改寄存器的上电电平以最小化设计区域是有益的。除非有直接的面积优势，否则编译器会将上电状态保持为零 |
   | Power Optimization During Synthesis                          | 控制分析和综合 (Analysis & Synthesis）的功耗驱动编译设置。该选项决定分析和综合如何积极优化电源设计。当该选项为 Off 时，编译器不执行任何功耗优化；当该选项为 Normal compilation 时，执行功耗优化，前提是它们不会降低设计的性能：当该选项为 Extra effort 时，执行额外的功耗优化，这可能降低设计的性能 |
   | Remove Duplicate Registers                                   | 如果寄存器与另一个寄存器相同，则州除该寄存器。如果两个寄存器生成相同的逻辑，则编译器将刪除重复的寄存器。第一个实例扇出到重复的目的位置。此外，如果删除的寄存器包含不同的逻辑选项分配，编译器将忽略这些选项。如果要阻止编译器删除有意重复的寄存器，则该选项很有用。如果将该选项用于个别寄存器或者包含寄存器的设计实体以外的任何其他地方，则忽略该选项 |
   | Remove Redundant Logic Cells                                 | 删除冗余的LCELL 原语或 WYSIWYG 原语。启用该选项可优化电路的面积和速度。如果将该选项应用于设计实体以外的任何其他内容，编译器将忽略该选项 |
   | Report Parameter Settings                                    | 指定综合报告是不是包含在 Parameter Settings by Entity Instance 文件夹中的报告 |
   | Report PR Initial Value as Errors                            | 允许你将在PR 分区中找到的显式定义的初始值编辑为错误而不是瞥告 |
   | Report Source Assignments                                    | 指定综合报告是不是包含 在 Source Assignments 文件夹中的报告  |
   | Resource Aware Inference for Block RAM                       | 指定 RAM、ROM 和移位寄存器推断是否应考虑设计和器件资源       |
   | Restructure Multiplexers                                     | 减少设计中实现多路复用器所需要的逻辑元件的数量。如果设计中包含碎片化的多路复用器件，则该选项很有用，该选项可用为面积更高效地重新打包多路复用器。该选项可用为面积更高效地重新打包多路复用器，从而允许设计使用减少数量的逻辑元件实现多路复用器。当选项为on时，将设计面积最小化，但是可能会对设计时钟产生负面影响。当选项为off时，禁止多路选择器时，自动允许软件确定是否应启用多路复用器重组。自动设置会降低逻辑单元的使用。但是可能会对时钟产生负面影响。 |
   | SDC Constraint Protection                                    | 在奇存器合并中验证：.sdc 约束。该选项有助于通过编译维护 sdc 约束的有效性 |
   | Safe State Machine                                           | 该选项实现状态机可以从非法状态恢复。当选择 Auto 选项（用于 Stratix 10 设计）时，只要编译器确定该设计在 6个或更少状态的状态机中有利，这个默认设置就使能安全状态机。该设置有助于允许不期望的初始条件。对于 Arria 10和 Cyclone 10 GX，该设置与 Never 相同。当选择 On 选项时，指导编译器总是使用安全状态机。当选择 Never选项时，从不使用安全状态机 |
   | Shift Register Replacement-Allow Asynchronous Clear Signal   | 允许编译器找到一组长度相同的位移寄存器，可用sltshift_taps IP核替代。移位寄存器必须全部使用相同的aclr信号，不能有任何其他辅助信号，必须有相同间隔的抽头，它至少需要有3个寄存器间隔。要使用该选项，必须打开Auto shift register replacement logic选项 |
   | Size of the Latch Report                                     | 允许指定综合报告中应显示最多的锁存器数量                     |
   | Size of the PR Initial Conditions Report                     | 允许指定 PR 初始条件报告中应显示的最大寄存器的数量           |
   | State Machine Processing                                     | 指定编译器用于处理一个状态机的处理类型。设计者可以使用自己的 User-Encoded 类型，或者选择 One- Hot、 Minimal Bits、 Gray、Jobnson、Sequential 或 Auto Encoding (编译器选择) |
   | Strict RAM Replacement                                       | 当打开该选项时，只有在硬件准确匹配设计时编译器才替换 RAM     |
   | Synchronization Register<br/>Chain Length                    | 指定一行中寄存器的最大数量，编译器可看作一个同步链。同步链是具有相同时钟的寄存器序列，它们中间没有扇出，使得第一个寄存器由引脚馈送，或由另一个时钟城的逻辑馈送。编译器将这些寄存器看作亚稳态分析。编译器阻止对这些寄存器的优化，如重定时。当使能门级重定时时，编译器不会删除这些寄存器。默认长度设置为 2 |
   | Synthesis Effort                                             | 控制综合在编译速度、性能和面积之问进行权衡。默认为 Auto。可以选择 Fast 以获取更快的编译速度，但是需要以牺牲性能和面积为代价 |
   | Synthesis Migration Check for Stratix 10                     | 支持 Arria 10 到Stratix 10 设计迁移的综合检查                |
   | Timing-Driven Synthesis                                      | 该选项影响以下优化技术选项。<br/>对对于 Arria 10 和 Cyolone 10 Gx 的设计，允许综合使用时序信息来更好地优化设计。<br/>	•	﻿0pdtmizaion Technigue Speed-以增加面积 （迎辑和奇存器利用率）为代价，优化设计的时序关键部分以提高性能<br/>	•	﻿﻿Optmizanion Tectnique Balanced-也优化设计中的时序头键部分以提高性能，但该选项仅允许有限的面积增加<br/>•Optimization Technique Area-仅针对面积优化设计 |


2. I/O规则检查示例

   | 规则                                | 描述                                                         | HDL要求 |
   | ----------------------------------- | ------------------------------------------------------------ | ------- |
   | I/O组容量                           | 根据I/O组中允许的引脚数量检查分配给I/O组的引脚数             | 否      |
   | I/O组VCCIO电压兼容性                | 检查分配给I/O组的引脚要求没有一个超过VCCIO                   | 否      |
   | I/O组VREF电压兼容性                 | 检查分配给I/O组的引脚要求没有超过一个VREF                    | 否      |
   | I/O标准的位置冲突                   | 检查引脚位置是否支持指定的I/O标准                            | 否      |
   | I/O标准的信号方向冲突               | 检查引脚位置是否支持指定的I/O标准和方向。例如，特定引脚位置上的某些I/O标准只能支持输出引脚 | 否      |
   | 差分I/O标准不能打开开漏             | 检查所有带有差分I/O标准的引脚是否关闭开漏极                  | 否      |
   | I/O标准和驱动强度冲突               | 检查驱动强度分配是否符合I/O标准的规范                        | 否      |
   | 驱动强度和位置冲突                  | 检查引脚位置是否支持指定的驱动强度                           | 否      |
   | 总线保持和位置冲突                  | 检查引脚位置是否支持总线保持。例如，专用时钟引脚不支持总线保持 | 否      |
   | 弱上拉和位置冲突                    | 检查引脚位置是否支持弱上拉（例如：专用时钟引脚不支持弱上拉） | 否      |
   | 电子迁移检查                        | 检查连续焊盘的组合驱动强度是否超过一定限度。例如Stratix II器件上10个连续焊盘的总电流驱动不能超过200mA | 否      |
   | PCI_IO钳位二极管、位置和I/O标准冲突 | 检查引脚位置和指定I/O标准是否支持PCI_IO钳位二极管            | 否      |
   | SERDES和I/O引脚位置兼容性检查       | 检查连接到设计中的所有SERDES引脚是否都分配给专用的SERDES引脚位置 | 否      |
   | PLL和I/O引脚位置兼容性检查          | 检查连接到PLL的引脚是否分配给专用PLL引脚位置                 | 否      |

3. 信号切换噪声规则

   | 规则                                        | 描述                                                 | HDL描述 |
   | ------------------------------------------- | ---------------------------------------------------- | ------- |
   | 当DPA存在时，I/O组不能有单端I/O             | 检查在相同的I/O组中没有存在单端I/O引脚作为DPA        | 否      |
   | PLL组不同时支持单端I/O和差分信号            | 当存在差分信号时，检查PLL I/O组中没有出现单端I/O引脚 | 否      |
   | 单端输出需要与差分I/O引脚相距一定距离       |                                                      | 否      |
   | 单端输出需要与VREF焊盘保持一定距离          |                                                      | 否      |
   | 单端输入要求与差分I/O引脚保持一定距离       |                                                      | 否      |
   | 使用VREF时，VREFGROUP中的输出或双向引脚太多 |                                                      | 否      |
   | VREFGROUP中的输出太多                       |                                                      | 否      |

4. 时序分析的基本概念

   | 术语                                          | 定义                                                         |
   | --------------------------------------------- | ------------------------------------------------------------ |
   | Arrival Time(到达时间)                        | 时序分析器计算数据和时钟到达寄存器引脚的时间与所要求的时间   |
   | Cell(单元)                                    | 器件资源包含LUT、寄存器、DSP块、存储器块或输入/输出元素      |
   | Clock(时钟)                                   | 名门信号表示设计内部或外部的时钟                             |
   | Clock-As-Data Analysis(时钟作为数据分析)      | 针对复杂路径更精确的时序分析，包括与时钟路径的PLL相关的任何相移 |
   | clock hold time(时钟保持时间)                 | 在时钟输入上的一个活动跳变之后，在馈送到一个数据输入或时钟使能输入引脚上的信号必须稳定的最小时间间隔 |
   | clock launch and latch edge(时钟发射和锁存沿) | 发送边沿是从寄存器或者其他时序元素发送数据的时钟沿，它作为发送数据的源。锁存器是在寄存器或其他时序元素的数据端口捕获数据的活动时钟沿 |
   | clock pessimism(时钟悲观)                     | 在静态时序分析期间，使用与公共时钟路径相关的最大(不是最小)延迟 |
   | clock setup(时钟建立)                         | 数据输入端有效信号和时钟输入由低到高跳变的最小时间间隔       |
   | net(网络)                                     | 两个或多个互联元件的集合                                     |
   | node(节点)                                    | 在设计中，表示加载一个在不同逻辑元件之间传播信号的连线，节点是最基本的时序网表单元。用于表示端口、引脚和寄存器 |
   | pin(引脚)                                     | 单元的输入或输出                                             |
   | port(端口)                                    | 顶层模块的输入或输出，例如，一个期间的引脚                   |
   | metastability(亚稳态)                         | 当信号在不相关或异步时钟域中的电路之间传输时，可能发生亚稳态性问题，时序分析器分析设计中潜在的亚稳态，并计算同步寄存器链的MTBF |
   | multicorner analysis(多角分析)                | 慢角和快角的时序分析，用于验证在各种电压、过程和温度操作条件下的设计 |
   | multicycle paths(多周期路径)                  | 一条要求非默认建立或保持关系的数据路径，用于正确的分析       |
   | recovery and removal time(恢复和去除时间)     | 恢复时间是从一个异步控制信号无效到下一个时钟沿的最短时间长度，去除时间是在有效沿之后，一个异步控制信号必须稳定然后无效的最小时间长度 |
   | timing netlist(时序网表)                      | 编译器生成的设计综合的节点和连接列表，时序分析器需要使用这个列表来执行时序分析 |
   | timing path(时序路径)                         | 任意两个节点之间的有线连接，如一个寄存器的输出到另一个寄存器的输入 |

   5. 多角时序分析

      | 模型   | 速度等级               | 电压        | 温度   |
      | ------ | ---------------------- | ----------- | ------ |
      | 慢时序 | 器件密度最慢的速度等级 | VCC最小供电 | 最大TJ |
      | 快时序 | 器件密度最快的速度等级 | VCC最大电压 | 最小TJ |

      在设计中，使用下面的代码可用设置操作条件用于慢时序模型，电压为1100mV，温度为85摄氏度

      ```tcl
      set_operating_conditions -model slow -temperature 85 -voltage 1100
      ```

      也可以使用带有tcl对象设置相同的操作条件

      ```tcl
      set_operating_conditions 3_slow_1100mv_85c
      ```

   6. 支持不同启动引导模式的可编程文件类型

      | 编程文件类型               | 扩展名  | 描述                                                         |
      | -------------------------- | ------- | ------------------------------------------------------------ |
      | 用于SRAM的十六进制输出文件 | .hexout | 包含配置数据，用于intel软件之外使用                          |
      | Jam字节编码文件            | .jbc    | 以二进制形式存储用于对JTAG链中的一个或多个器件进行编程、配置、验证和空白检查的编程数据。jbc转换仅可用于命令行 |
      | JTAG简介配置文件           | .jic    | 专有的intel fpga文件类型<br />通过intel fpga JTAG引脚使能串行flash编程<br />仅适用于active serial配置<br />在对flash编程之前，编程器首先用串行flash帮助器设计来配置fpga |
      | 编程器目标文件             | .pof    | 专有的intel fpga文件类型<br />允许编程到外部flash，如通过jtag头使用PFL IP核对CFI flash编程，或通过active serial头对串行flash编程 |
      | 原始二进制文件             | .rbf    | 将.rbf文件用于被动配置模式，如被动串行(PS)、快速被动串行(FPP)或avalon流模式 |
      | 原始编程数据文件           | .rpd    | 仅用于主动串行配置<br />可用使用任何第三方编程器或intel FPGA IP<br />与输出文件相比，.rpd文件的内容是比特位反转 |
      | 串行向量格式文件           | .svf    | 保存用于在自动化测试设备类型环境中的JTAG链中的一个或多个固定算法器件进行编程、验证核空白检查的编程数据 |
      | 表格文件文本               | .ttf    | 包含配置数据，用于intel软件之外使用                          |

7. 