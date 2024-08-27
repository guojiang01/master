## Allergo 相关

+ Allegro OrCAD系列：满足主流用户的PCB设计要求
+ Allegro L系列：使用于对成本敏感的小规模到中等规模的设计团队，同时具有随着工艺复杂度增加而伸缩的灵活性
+ Allegro XL/GXL：满足先进的高速、约束驱动的PCB设计，依托Allegro具有鲜明特点的约束管理器解决方案，能够跨设计流程同步管理电气约束，如同一个无缝的过程

| 文件后缀名 | 文件类型                                  |
| ---------- | ----------------------------------------- |
| .brd       | Allegro的PCB文件                          |
| .mdd       | 模块定义文件                              |
| .dra       | 元器件封装的可编辑保存文件                |
| .pad       | 焊盘文件                                  |
| .psm       | 存储元器件封装数据库的库文件              |
| .osm       | 存储各类符号标记的format封装数据的库文件  |
| .bsm       | 存储结构的mechanical封装数据的库文件      |
| .fsm       | 存储用于负片层通孔焊盘的flash数据的库文件 |
| .ssm       | 存储用于不规则焊盘的shape数据库文件       |
| .drl       | 用于数控钻孔的钻带文件                    |
| .txt       | 文本文件，常用于存储参数定义              |
| .scr       | 脚本和宏文件                              |
| .log       | 临时信息文件，此文件包含了命令过程的数据  |
| .art       | 光绘文件，用于生产制造                    |
| .jrl       | 包含了事件记录的文件                      |

##  PCB 基本术语

1. PCB(Printed Circuit Board)：印刷电路板
2. Single-Sided Boards：单面板
3. Double-Sided Boards：双面板
4. Multi-Layer Boards：多层板
5. Top层：PCB板表面层（也称器件层：Component Side）
6. Bottom层：PCB板地面层（也称焊接层：Solder Side）
7. 内层：包括内布线层、Power电源层、GND地层
8. Text：丝印，也称文字
9. SilkScreen：丝印层
10. Soldmask：阻焊层
11. Pastmask：钢网层
12. Assembly：装配层
13. PadStack：焊盘，有表贴与通孔两种
14. SMT：表面焊接技术
15. Plated：金属化
16. Non-Plated：非金属化
17. Pin：元器件引脚
18. Symbol：元器件
19. Package：元器件PCB封装
20. Etch：电气连接线，用于元器件引脚连接以实现物理电路功能
21. Rats：飞线，指示各元器件引脚之间连接关系的虚线
22. Spacing：安全间距，不同设计对象之间的距离
23. Via：过孔，有通孔(Through)、埋孔(Buried)、盲孔(Blind)
24. Shape：铜箔
25. Artwork：光绘底片

### setup -> user Preferences Editor -> Paths ->library

devpath：定义寻找device文件的目录路径，主要用于第三方网表文件调入

padpath：定义寻找padstack文件的目录路径

pampath：定义寻找symbol文件的目录路径

### setup -> user Preferences Editor -> Route -> Connect 

acon_no_width_override_retain：当执行add connect 命令时，默认保留修改后的线宽参数设置，下次执行该命令时，会继续使用此线宽，若勾选此选项，则不会保留修改后的线宽参数设置，而以约束规则管理器中设置的线宽为准，建议勾选

acon_oldhlt：当执行add connect命令时，选中某个网络之后所有引脚是否高亮；对于设置了电源电压的网络只会高亮当前引脚，建议设置为all

acon_route_on_active_subcluss：勾选此选项，当使用add connect命令时，需要先设置工作层面进行布线；若不选择该项，当使用add connect命令时，可以用鼠标在设计区域选择某个层面的对象进行布线，建议不勾选

allegro_dynam_timing：建议选择on，若该网络设置了长度约束，布线时会随鼠标指针实时显示布线长度

allegro_dynam_timing_fixedpos：建议勾选此选项，当allegro_dynam_timing为on时，布线长度条会固定在某一个位置

allegro_etch_length_on：勾选此选项，使用add connect命令时，系统会弹出dynamic gth（当前长度）对话框

## 常用图层功能

| Class                                    | Subclass                                                     | 用途                                                   |
| ---------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------ |
| Pin、Via、Etch、Drc、Anti Etch、Boundary | Top                                                          | 顶层电气层所有对象，包括引脚、过孔、走线、DRC等        |
|                                          | Bottom                                                       | 底层电气层所有对象，包括引脚、过孔、走线、DRC等        |
| Pin、Via、Drc                            | Soldermask_Top                                               | 顶层阻焊、由新建封装时定义的引脚、过孔阻焊，以及DRC    |
|                                          | Soldermask_Bottom                                            | 底层阻焊、由新建封装时定义的引脚、过孔阻焊，以及DRC    |
|                                          | Pastmask_Top                                                 | 顶层钢网、由新建封装时定义的引脚、过孔阻焊，以及DRC    |
|                                          | Pastmask_Bottom                                              | 底层钢网、由新建封装时定义的引脚、过孔阻焊，以及DRC    |
| Drc                                      | Package_Top                                                  | 顶层零件干涉所产生的DRC                                |
|                                          | Package_Bottom                                               | 底层零件干涉所产生的DRC                                |
| Etch                                     | ——                                                           | 电气线、铜箔                                           |
| Drc                                      | ——                                                           | 因不符合规则设置参数而给出的提示符号                   |
| Anit Etch                                | ——                                                           | 分割线，常用于负片层不同电源、地区域的隔离             |
| Boundary                                 | ——                                                           | 轮廓线，用于描述动态铜箔外形                           |
| Consraints Region                        | Top、Bottom、<br />Inner_Plane_Layers、<br />Inner_Signal_Layers、<br />Outer_Layers、<br />Through All | 规则区域，用于特定区域定义不同约束规则                 |
| Route KO                                 |                                                              | 走线禁布区域，同时对过孔禁布                           |
| Via KO                                   |                                                              | 过孔禁布区，但允许布线                                 |
| Package KO                               |                                                              | 零件禁布区，允许一定高度的零件放置                     |
| package KI                               |                                                              | 零件放置区，不允许放置到区域外                         |
| Route KI                                 |                                                              | 布线区、不允许走线、过孔、铜箔到区域外                 |
| Board Geometry                           | Dimension                                                    | 标注层，用于标注板框尺寸、工艺说明等信息               |
|                                          | Outline                                                      | 板框层，用于放置板框图形                               |
|                                          | Silkscreen_Top                                               | 顶层丝印，用于放置额外手写的文字、指示线等非电气丝印   |
|                                          | Silkscreen_Bottom                                            | 底层丝印，用于放置额外手写的文字、指示线等非电气丝印   |
|                                          | Soldermask_Top                                               | 顶层阻焊，用于放置额外要求的文字、指示阻焊图形         |
|                                          | Soldermask_Bottom                                            | 底层阻焊，用于放置额外要求的文字、指示阻焊图形         |
| Package Geometry                         | Assembly_Top                                                 | 顶层装配图形，由封装中定义                             |
|                                          | Assembly_Bottom                                              | 底层装配图形，由封装中定义                             |
|                                          | Pastmask_Top                                                 | 顶层钢网，由封装中定义                                 |
|                                          | Pastmask_Bottom                                              | 底层钢网，由封装中定义                                 |
|                                          | Pin_Number                                                   | 引脚编号                                               |
|                                          | Place_Bound_Top                                              | 顶层零件实体大小                                       |
|                                          | Place_Bound_Bottom                                           | 底层零件实体大小                                       |
|                                          | Silkscreen_Top                                               | 顶层丝印，用于放置额外手写的文字、指示线等非电气丝印   |
|                                          | Silkscreen_Bottom                                            | 底层丝印，用于放置额外手写的文字、指示线等非电气丝印   |
|                                          | Soldermask_Top                                               | 顶层阻焊，用于放置额外要求的文字、指示阻焊图形         |
|                                          | Soldermask_Bottom                                            | 底层阻焊，用于放置额外要求的文字、指示阻焊图形         |
| CmpVal（Component）RefDes                | Assembly_Top                                                 | 顶层装配编号，由封装中定义                             |
|                                          | Assembly_Bottom                                              | 底层装配编号，由封装中定义                             |
|                                          | Silkscreen_Top                                               | 顶层丝印编号，由封装中定义                             |
|                                          | Silkscreen_Bottom                                            | 底层丝印编号，由封装中定义                             |
| Manufacturing                            | Ncdrill_figure                                               | 15.x版本使用的钻孔标记层                               |
|                                          | Ncdrill_Legend                                               | 15.x版本使用的钻孔表格层                               |
|                                          | Nclegend -1-6                                                | 16.x版本使用的钻孔标记和表格层，不同层数的数字会不一样 |
|                                          | Photoplot_Outline                                            | 设置光绘输出区域，区域以外的图形不会生成光绘           |
|                                          | Probe_Top                                                    | 顶层ICT测试区域                                        |
|                                          | Probe_Bottom                                                 | 底层ICT测试区域                                        |

### PCB阻抗

+ USB 2.0 90 $\Omega$, USB 3.0 100 $\Omega$ 
+ PCI $60 - 65 \Omega$ 
+ VGA 75 $\Omega$ 
+ SDI 单线$75\Omega$,差分线$150\Omega$
+ RS-485 $120\Omega$ 
+ DDR3 单线 $40-50 \Omega$，差分$80-100\Omega$ 

### 铜厚和最小线宽/间距设计参数

| 基铜厚度                  | 8层以下最小线宽/线间距(mil)    | 8层以上最小线宽/线间距(mil)    |
| ------------------------- | ------------------------------ | ------------------------------ |
| ($oz/Ft^2$)/公制($\mu m$) | 内层\|外层                     | 内层\|外层                     |
|                           | 推荐值\|最小值\|推荐值\|最小值 | 推荐值\|最小值\|推荐值\|最小值 |
| 4/140                     | 9/14.5\|8/13.5\|8/20\|7/19     | 9/13\|7/11\|11/17\|9/15        |
| 3/105                     | 7/9.5\|6/8.5\|8/12\|7/11       | 6.5/8.5\|5/7\|9.5/13.5\|8/12   |
| 2/70                      | 6/6\|5/5.5\|5/8.5\|4/8.5       | 5/6\|4/5\|7/9\|6/8\|           |
| 1/35                      | 4.5/5\|4/4.5\|5/5.7\|4/5.7     | 4/4.5\|3/4\|5/6\|4.5/5         |
| 0.5/18                    | 4.5/4.5\|4/4\|4.5/5\|4/4.5     | 3.5/3.5\|3/3\|4.5/4.5\|4/4     |

### Cadence 软件功能特点

整个软件分为Allegro EDM Products、Allegro Products、Allegro Sigrity Products、Documentation、OrCAD Lite Products、OrCAD Products和Products Utilities七部分，主要包括以下18个功能模块

1. Design Entry HDL：提供了一个原理图输入分析环境。它的功能与扩展模拟（数字电路和模拟电路），以及PCB版图设计解决方案集成在一起，是作为所有与系统和高速设计流程相关的CAE要求的任务中心。
2. Capture CIS：是世界上领先的怎windows操作系统上实现的原理图输入解决方案，直观、简单易用且具有先进的部件搜索机制，是迅速完成设计捕捉的工具。是国际上通用的标准的原理图输入工具，设计快捷、方便，图形美观，与Allegro实现了无缝连接
3. Design Entry HDL Rules Checker:Design Entry HDL的规则检查工具
4. Layout Plus:原OrCAD公司的PCB工具
5. Layout Plus Smart Route Calibrate : Layout Plus 的布线工具
6. Library Explorer：进行数字设计库管理的软件，可以调用Design Entry HDL、PCB Librarian、PCB Designer、Allegro System Architect 等建立的元器件符号和模型。
7. Online Documentation：在线帮助文档。
8. Model Integrity：模型编辑与验证工具
9. Package Designer：芯片和封装的设计分析软件，它把芯片级的I/O可行性和规划功能与业界领先的集成电路封装设计工具组合到一起，形成一种强大的协同设计方法。该产品家族包括一个嵌入式的经过验证的3D场计算器，允许工程师在电气与物理设计要求之间做出折中选择，以满足成本和性能目标的要求。
10. PCB Editor：一个完整的高性能PCB设计软件。通过顶尖的技术，为创建和编辑复杂、多层、高速、高密度的PCB设计提供了一个交互式、约束驱动的设计环境。它允许用户在设计过程的任意阶段定义、管理和验证关键的高速信号，并能抓住最关键的设计问题。
11. PCB Librarian：Allegro库开发，包括焊盘、自定义焊盘形状、封装符号、机械符号、Format符号和Flash符号的开发。
12. PCB Router：CCT布线器。
13. PCB SI：提供一个集成的高速设计与分析环境。它能流水线化完成高速数字PCB系统和高级集成电路封装设计，方便电气工程师在设计周期的所有阶段探究、优化和解决与电气性能相关的问题。约束驱动的设计流程提高了首次成功的概率，并降低了产品的整体成本。
14. Allegro Physical Viewer：Allegro浏览器模块。
15. Project Manager：Design Entry HDL的项目管理器。
16. SigXplorer：网络拓扑的提取和仿真。
17. AMS Simulator：工业标准的模拟、数字及模拟/数字混合信号仿真系统，具有仿真速度快、精度高、功能强大等特点。仿真库内所含元器件种类丰富，数量众多。
18. PCB Editor Utilities ： 包含Pad Designer 、DB Doctor 和Batch
    DRC等工具。

### 快捷键

+ 左右翻转：H
+ 上下翻转：V
+ 旋转90度：R
+ 窗口放大：I
+ 窗口缩小：O
+ 放置电源：F
+ 连线：W
+ 重复操作：F4
+ 删除节点，按住S单击节点按Del
+ 添加节点，J
+ 放置总线：B
+ 总线支线：E
+ 旋转总线支线：P
+ 放置标注：N
+ W连线同时按住“Shift”可绘制斜线
+ 直接拖动，带连接线。按住“Alt”再拖动，可断开连接

