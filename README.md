# SimpleALU

### 简介
SimpleALU是一个十分简单的ALU，部分设计参考74181，使用Verilog HDL在Quartus 17上编写，这是它的主程序<a href="https://github.com/Justdoitonetwothree/SimpleALU/blob/master/SimpleALU/simpleALU.v">SimpleALU.v</a>，以及<a href="https://justdoitonetwothree.github.io/SimpleALU/">项目主页</a>

### 结构
- 4位ALU
- 超前进位

### 功能

| m | S1 | S0 | 功能 |
|---|:--:|:--:| ----:|
| 0 |  0 |  0 | A加B |
| 0 |  0 |  1 | A加1 |
| 0 |  1 |  0 | A减B |
| 0 |  1 |  1 | A减1 |
| 1 |  0 |  0 | A与B |
| 0 |  0 |  1 | A或B |
| 0 |  1 |  0 | A非  |
| 0 |  1 |  1 | A异或B |

### 使用指南

使用SimpleALU既可以通过Verilog调用，也可以直接在FPGA上运行

#### 接口解析

SimpleALU拥有12个输入，A和B是两个4bit二进制数，Ci是进位，另外三个接口如功能表
拥有7个输出，F是一个4bit二进制数，Co是输出的进位，P和G分别是进位传播信号和进位产生信号，可用于调试，也可用于多ALU间并联。

### FPGA上的运行

SimpleALU是在Altera CycloneIV E EP4CE6E22C8上调试的。提交的工程已经为19个接口分配了引脚。以下是引脚图</br>
    ![image](https://justdoitonetwothree.github.io/SimpleALU/pin.png)
</br>
FPGA在开发板上的引脚图，由多个JTAG引出</br>
    ![image](https://justdoitonetwothree.github.io/SimpleALU/fpgapin.png)
在开发板上使用键盘和LED进行输入和输出，我自己制作的键盘LED的PCB的用于测试的verilog程序也上传至~/testPCB