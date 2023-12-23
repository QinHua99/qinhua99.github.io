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
# Hugo下载与安装
- 到[Github](https://github.com/gohugoio/hugo/releases/tag/v0.121.1)下载[Hugo](https://gohugo.io/getting-started/quick-start/)的二进制文件，解压到合适位置。
  {{< fancybox_figure align=center src="Hugo-1.png" >}}   
- 在电脑中添加**环境变量**。“环境变量”-“Path”-"编辑环境变量"-“新建”-“D:\Application\hugo”，确定即可
  {{< fancybox_figure align=center src="Hugo-2.png" >}}   
  {{< fancybox_figure align=center src="Hugo-3.png" >}}   
- 验证其是否安装成功，在终端中输入`hugo serson`，出现版本号即可
  {{< fancybox_figure align=center src="Hugo-4.png" >}}   
**注**：下载安装的方法并不唯一，比如通过包管理器（如 Homebrew 或 Chocolatey）安装的 Hugo也是可以的   
# 创建GitHub-Blog仓库
在[Github](https://github.com/)创建新的仓库，**仓库名称为用户名.github.io**，也可添加`README file`，创建后可克隆到本地。
# Hugo_Blog创建
- 创建Hugo网站，并进入网站目录   
  ```bash
  hugo new site blog_name 
  cd blog_name
  ```
- 站点目录结构如下：
  - `hugo.yaml`(`hugo.toml`)：Hugo 的配置文件，其中包含你可以设置和自定义的站点配置选项。(原本为hugo.toml，可以改为hugo.yaml格式的，方便编辑)
  - `content/`：该目录通常包含你的站点的内容，如文章、页面和资源文件。你可以根据自己的需要在此目录下创建子目录和文件。
  - `data/`：该目录用于存放数据文件，你可以在 Hugo 模板中使用这些数据文件来生成动态内容。
  - `archetypes/`：该目录包含用于创建新内容的模板文件。当你使用 hugo new 命令创建新的内容时，Hugo 将基于这些模板文件生成新的文件。
  - `layouts/`：该目录包含 Hugo 网站的布局模板文件，用于定义站点的整体结构和样式
  - `static/`：该目录用于存放静态文件，如图像、CSS 和 JavaScript 文件。这些文件会直接复制到生成的网站中，而无需经过 Hugo 的处理。
  - `themes/`：如果你使用了一个或多个主题，它们将被放置在此目录下。主题包含布局文件、样式和其他资源，可以覆盖站点的默认设置。
  - `public/`（默认输出目录）：Hugo 生成的最终网站文件将存放在此目录下。该目录包含完整的 HTML 文件和其他生成的资源。(本站将输出改为了`docs/`)
- 添加主题[PaperMod](https://github.com/adityatelange/hugo-PaperMod/wiki/Installation)
  ```shell
  git init
  git submodule add --depth=1 https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod
  ```
  在`hugo.yaml`中添加`theme: PaperMod`即可   
- 本地预览，运行Hugo服务器，访问http://localhost:1313进行预览
  ```bash
  hugo server -D
  hugo server -D -F --cleanDestinationDir
  ```   
  以上两个命令选择其一即可，`--cleanDestinationDir`可以清除过去的重新生产网站
- 创建文章
  ```shell
  hugo new posts/Hello_world.md
  ```
  {{< fancybox_figure align=center src="Hugo-posts.png" >}}  
  使用markdown语法进行编辑即可，对于文章也可以在posts目录下直接创建或复制已写好的文章
# 主题配置

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

  # Reference 