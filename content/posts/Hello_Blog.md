---
title : 'Hello_Blog'
date : 2023-12-14T17:11:24+08:00
lastmod : 2023-12-15T12:00:24+08:00
draft : false
ShowToc : true
TocOpen : true
math : true 
ShowWordCounts : true
categories :
- Blog
tags:
- abx
- test
summary : "立于好于"
---

# 你好！
> "IMC(Inter-Module Communication)是Neptus系统中模块之间通信的一种协议或机制。"
- IMC是一种轻量级的，消息封装式的通信协议。
- IMC定义了一系列的消息类型(Message)，每个消息都包含消息头和消息体。消息头包含源、目标、时间戳等元信息，消息体为实际的数据。
- 通过IMC，可以实现相互模块之间的收发。
## 二级标题
- IMC支持点对点通信和发布-订阅两种模式。
- IMC基于UDP通信，提供了比较高效和实时的消息传递。
- Neptus系统中的控制器、控制面板、计划执行器等模块都通过IMC进行交互。新模块可以通过实现IMC来加入系统。
- IMC为Neptus系统提供了一个可扩展和灵活的内部通信机制,大大减少了模块间的耦合,也方便新增模块。
# 哈哈哈
```SQL
  <!-- neptus地址 -->
  <arg name="neptus_addr" default="172.22.179.105"/>
  <!-- ros端地址 -->
  <arg name="bridge_addr" default="172.22.49.214"/>
  <arg name="bridge_port" default="6002"/>
```

```c++
#include <iostream>
class Solution {
public:
    int findPeakElement(vector<int>& nums) {
        int n = nums.size();
        int idx = rand() % n;

        // 辅助函数，输入下标 i，返回一个二元组 (0/1, nums[i])
        // 方便处理 nums[-1] 以及 nums[n] 的边界情况
        auto get = [&](int i) -> pair<int, int> {
            if (i == -1 || i == n) {
                return {0, 0};
            }
            return {1, nums[i]};
        };

        while (!(get(idx - 1) < get(idx) && get(idx) > get(idx + 1))) {
            if (get(idx) < get(idx + 1)) {
                idx += 1;
            }
            else {
                idx -= 1;
            }
        }
        
        return idx;
    }
};

```
`hugo -F --cleanDestinationDir`

![](潜艇.png)
![](图8-a.png)

![](https://cdn.jsdelivr.net/gh/qinhua99/picture@main/img/%E6%BD%9C%E8%89%87.png)

{{< figure align=center src="euler-lauv.png" >}}
# math
math公式$\tilde{a}$    

$$
\begin{matrix}
   a & b \\\ 
   c & d
\end{matrix}
$$

$$
y = \int_{0}^{1} x^{2}dx
$$
$$
\begin{bmatrix}
  a& b  \\\
  c&d
\end{bmatrix}
$$
$$
\def\arraystretch{1.5}
   \begin{array}{c:c:c}
   a & b & c \\\ \hline
   d & e & f \\\
   \hdashline
   g & h & i
\end{array}
$$