---
title : 'Hugo-Papermod'
date : 2023-12-18T22:52:20+08:00
draft : false
categories:
- Hugo
math: true #启动公式
ShowWordCounts : true #统计字数
showToc: true # 显示目录
TocOpen: true # 自动展开目录
---
{{< fancybox_figure align=center src="Hugo-3.png.png" >}}  
# 自定义字体和代码   
  字体选择的是[LXGW WenKai/霞鹜文楷](https://github.com/lxgw/LxgwWenKai)，参考其[网页嵌入](https://github.com/lxgw/LxgwWenKai/issues/24)实现<sup>1,2</sup>，在`layouts/partials/extend_head.html`中插入HTML代码
  ```html
  <link rel="stylesheet" href="https://cdn.staticfile.org/lxgw-wenkai-screen-webfont/1.6.0/style.css" />
  ```
  在`assets/css/extended/blank.css`中插入CCS即可，`Consolas`是本博客采用的字体   
  ```ccs
   /*字体*/
   body {
     font-family: "LXGW WenKai Screen", sans-serif !important;
    }

   code {
     font-family: "LXGW WenKai Screen", sans-serif;
    }
   /*code*/
   .post-content pre, code {
    font-family: 'Consolas', sans-serif;
    max-height: 40rem;
    }
  ```

这是一个测试    
啦啦啦啦啦    
珂珂珂珂    
水水水    
她她     
啊
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

