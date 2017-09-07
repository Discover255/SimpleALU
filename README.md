# SimpleALU

### 简介
SimpleALU是一个十分简单的ALU，部分设计参考74181，使用Verilog HDL编写，这是它的主程序<a href="https://github.com/Justdoitonetwothree/SimpleALU/blob/master/SimpleALU/simpleALU.v">SimpleALU.v</a>，以及<a href="https://justdoitonetwothree.github.io/SimpleALU/">项目主页</a>

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