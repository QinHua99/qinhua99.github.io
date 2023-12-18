---
title : 'Hugo-PaperMod'
date : 2023-12-18T17:11:24+08:00
lastmod : 2023-12-18T22:00:24+08:00
draft : false
ShowToc : true
TocOpen : true
math : true 
ShowWordCounts : true
categories :
- Hugo

---
# Hugo下载与安装
- 到[Github](https://github.com/gohugoio/hugo/releases/tag/v0.121.1)下载[Hugo](https://gohugo.io/getting-started/quick-start/)的二进制文件，解压到合适位置。
  {{< fancybox_figure align=center src="Hugo-1.png.png" >}}   
- 在电脑中添加**环境变量**。“环境变量”-“Path”-"编辑环境变量"-“新建”-“D:\Application\hugo”，确定即可
  {{< fancybox_figure align=center src="Hugo-2.png.png" >}}   
  {{< fancybox_figure align=center src="Hugo-3.png.png" >}}   
- 验证其是否安装成功，在终端中输入`hugo serson`，出现版本号即可
  {{< fancybox_figure align=center src="Hugo-4.png.png" >}}   
**注**：下载安装的方法并不唯一，比如通过包管理器（如 Homebrew 或 Chocolatey）安装的 Hugo也是可以的   
# 创建GitHub-Blog仓库   


- 自定义字体和代码   
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

这是一个例子<sup>1</sup>。

# Reference
1. [Hugo + PaperMod搭建技术博客](https://kyxie.github.io/zh/blog/tech/papermod/#%e4%bf%ae%e6%94%b9%e5%85%a8%e5%b1%80%e5%ad%97%e4%bd%93)
1. [Hugo使用自定义字体-晓寒轻](https://zhuanlan.zhihu.com/p/627444050)
1. [Fancybox Getting Started](https://fancyapps.com/fancybox/getting-started/)
2. [Hugo 博客自定义优化ANY_ME](https://shishuochen.gitee.io/2020/uffick8u1/)  
[1]: https://en.wikipedia.org/wiki/Hobbit#Lifestyle