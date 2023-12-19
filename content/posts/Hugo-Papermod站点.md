---
title : 'Hugo-Papermod站点'
date : 2023-12-18T23:52:20+08:00
draft : false
categories:
- Hugo
math: true #启动公式
ShowWordCounts : true #统计字数
showToc: true # 显示目录
TocOpen: true # 自动展开目录
---
1    
{{< fancybox_figure align=center src="Hugo-1.png" >}}     
2    
{{< figure align=center src="Hugo-1.png" caption="test">}}     
3   
![aaa](Hugo-1.png)    
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