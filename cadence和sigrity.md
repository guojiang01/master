# cadence和sigrity 

pcb封装位置C:\Cadence\SPB_23.1\share\pcb\pcb_lib\symbols
DEHDL文件夹位置C:\Cadence\SPB_23.1\share\library\standard

START /W "" "allegro.exe" -s builder.scr.txt 更改为C:\Cadence\SPB_23.1\tools\bin\



PCB信号表层延时 140ps/inch 内层166ps/inch  或 6mil/ps
单位长度走线电容值 3.5pF/inch 电感值 9nH/inch



1. PDN的频域分析

   电源噪声本质上是个时域事件，只能在时域中观察。

   $\Delta V_{droppand drop}=\underbrace{IR_{loop}(DC)}_{直流 IR-drop}+\underbrace{L_{loop}\frac{di}{dt}(AC)}_{交流AC瞬态电压}$ 

   负载端能观察到的最大噪声幅度包括直流部分的$IR-Drop$和交流部分的$Delta-I$噪声，由于交流噪声是电流变化了$(\frac{di}{dt})$和函数，后者与负载工作时的电流激励特征密切相关，所以不同电流特征会激起不同程度的电源噪声。

   目标阻抗法：该方法将PDN网络分为器件和系统两个部分，从器件看向系统的目标阻抗被定义为$Z_{target}=\frac{\Delta V_{voltage tolerance}}{I}$,其中$\Delta V_{voltage tolerance}$为电源噪声容限，I为器件工作电流。通常器件电流取值有$I=I_{max}\times 50\%$(保守) ，$I=I_{max}\times 30\%$(典型)  