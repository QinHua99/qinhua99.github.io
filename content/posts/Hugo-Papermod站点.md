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
- **注**：下载安装的方法并不唯一，比如通过包管理器（如 Homebrew 或 Chocolatey）安装的 Hugo也是可以的   
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
本站的主题配置如下，大部分的配置只需要参考[官网说明](https://adityatelange.github.io/hugo-PaperMod/)即可   
```yaml
# baseURL: 'https://qinghuair.top'
baseURL: 'https://qinhua99.github.io'
languageCode: zh-cn # languageCode: en-us
title: QingHua's Blog
theme: PaperMod

paginate: 10  # 首页每页显示的文章数    
enableInlineShortcodes: true  # 是否启用内联短代码解析
enableRobotsTXT: true  # 是否启用或禁用自动生成 robots.txt 文件
buildDrafts: false  # 用于构建并生成包括草稿（drafts）在内的所有内容
buildFuture: false  # 用于构建并生成未来（future）日期的内容
buildExpired: false  # 用于构建并生成过期（expired）的内容
enableEmoji: true  # 启动emoji
pygmentsUseClasses: true  # 用于控制代码语法高亮所使用的 CSS 类
publishDir: docs  # 生产目录名
minify:
    disableXML: true  # 对 XML 文件进行最小化处理
    # minifyOutput: true
menu: # 导航栏
  main:
      - identifier: archive
        name: 📰Posts
        url: /archives/
        weight: 10
      - identifier: categories
        name: 📁Categories
        url: /categories/
        weight: 15
      - identifier: about
        name: 👨‍🚀
        url: /about/
        weight: 20
      - identifier: search
        name: 🔍
        url: /search/
        weight: 30

markup: # 代码高亮
    goldmark:
        renderer:
            unsafe: true # HUGO 默认转义 Markdown 文件中的 HTML 代码，如需开启的话
    highlight:
        # anchorLineNos: true     
        codeFences: true  # 代码围栏功能     
        guessSyntax: true # 猜测语法
        lineNos: true # 行号
        style: fruity
outputs:
    home:
        - HTML
        - RSS
        - JSON # is necessary
# 这个要在最后
params:
    env: production # to enable google analytics, opengraph, twitter-cards and schema.
    description: "The  flow of ideas usually starts after you get started"
    # author: Hua
    # 设置默认主题颜色方案 auto system auto-dark auto-light dark light 
    defaultTheme: auto
    # disableThemeToggle: true  # 静止主题切换功能  
    ShowShareButtons: false  # 是否显示分享按钮
    ShareButtons: ["facebook", "telegram"] # To customize which share buttons to be enabled on page 
    ShowReadingTime: true  # 是否显示阅读时间
    math: true  # 数学公式
    # disableSpecial1stPost: true  # 禁用特殊的第一篇文章样式  
    displayFullLangName: true  # 是否显示完整的语言名称   
    ShowPostNavLinks: true  # 是否显示文章导航链接   
    ShowBreadCrumbs: true  # 是否显示面包屑导航 ，例如 “Home > Category > Subcategory > Page”   
    ShowCodeCopyButtons: true  # 是否显示代码复制按钮 
    ShowRssButtonInSectionTermList: false  # 是否在网站的特定区块（section）和分类（term）列表中显示 RSS 订阅按钮    
    ShowWordCounts: true  # 文章字数统计 未显示？？？    
    ShowToc: true  # 是否显示文章的目录（Table of Contents，简称 TOC）    
    TocOpen: true  # 自动展开目录
    # comments: false
    # images: ["papermod-cover.png"]
    enableInlineShortcodes : true  # 启动公式
    timezone: "Asia/Shanghai"  # 设置时区  
    assets:  # 网站头像  路径/static/images
      favicon: "images/favicon.ico"
      favicon16x16:  "images/favicon-16x16.png"
      favicon32x32:  "images/favicon-32x32.png"
      apple_touch_icon:  "images/apple-touch-icon.png"
      safari_pinned_tab:  "images/apple-touch-icon.png"
      disableFingerprinting: true        
    DateFormat: "2006-01-02"  # 日期格式
    StartYear: 2020 # 底部开始年份
    ShowLastMod: true  # 显示修改时间
    # 不蒜子统计 https://zhuanlan.zhihu.com/p/649952987
    busuanzi:
      enable: false
    # 左上角内容
    label:
      text: "🌏"
      # icon: images/apple-touch-icon.png
      iconHeight: 35
    # 设置封面图片的隐藏属性
    cover:      
      hidden: true # 这将在结构化数据中显示封面图片，但在其他地方隐藏它      
      hiddenInList: true # 这将在列表页和首页上隐藏封面图片      
      hiddenInSingle: true # 这将在单独的页面上隐藏封面图片    
    # 搜索相关
    fuseOpts:
      isCaseSensitive: false
      shouldSort: true
      location: 0
      distance: 1000
      threshold: 0.4
      minMatchCharLength: 0
      keys: ["title", "permalink", "summary", "content"]    
  
    # 主题配置
    homeInfoParams:
        Title: "👋 Welcome Stranger!"
        Content: >
            - 深自缄默，如云漂泊
            - ***Deeply silent, Drifting like a cloud*** 
            - ***"立于皓月之边,不弱星光之势"***
    socialIcons:
      - name: "Github"
        url: "https://github.com/QinHua99"
      - name: "email"
        url: "https://ran_qinghua@163.com"
      - name: "zhihu"
        url: "https://www.zhihu.com/people/jiu-meng-zhu-96"
```
- 目录放在侧面<sup>x</sup>
  对`layouts/partials/toc.html`文件代码替换如如下代码
  ```html
  {{- $headers := findRE "<h[1-6].*?>(.|\n])+?</h[1-6]>" .Content -}}
  {{- $has_headers := ge (len $headers) 1 -}}
  {{- if $has_headers -}}
  <aside id="toc-container" class="toc-container wide">
      <div class="toc">
          <details {{if (.Param "TocOpen") }} open{{ end }}>
              <summary accesskey="c" title="(Alt + C)">
                  <span class="details">{{- i18n "toc" | default "Table of Contents" }}</span>
              </summary>

              <div class="inner">
                  {{- $largest := 6 -}}
                  {{- range $headers -}}
                  {{- $headerLevel := index (findRE "[1-6]" . 1) 0 -}}
                  {{- $headerLevel := len (seq $headerLevel) -}}
                  {{- if lt $headerLevel $largest -}}
                  {{- $largest = $headerLevel -}}
                  {{- end -}}
                  {{- end -}}

                  {{- $firstHeaderLevel := len (seq (index (findRE "[1-6]" (index $headers 0) 1) 0)) -}}

                  {{- $.Scratch.Set "bareul" slice -}}
                  <ul>
                      {{- range seq (sub $firstHeaderLevel $largest) -}}
                      <ul>
                          {{- $.Scratch.Add "bareul" (sub (add $largest .) 1) -}}
                          {{- end -}}
                          {{- range $i, $header := $headers -}}
                          {{- $headerLevel := index (findRE "[1-6]" . 1) 0 -}}
                          {{- $headerLevel := len (seq $headerLevel) -}}

                          {{/* get id="xyz" */}}
                          {{- $id := index (findRE "(id=\"(.*?)\")" $header 9) 0 }}

                          {{- /* strip id="" to leave xyz, no way to get regex capturing groups in hugo */ -}}
                          {{- $cleanedID := replace (replace $id "id=\"" "") "\"" "" }}
                          {{- $header := replaceRE "<h[1-6].*?>((.|\n])+?)</h[1-6]>" "$1" $header -}}

                          {{- if ne $i 0 -}}
                          {{- $prevHeaderLevel := index (findRE "[1-6]" (index $headers (sub $i 1)) 1) 0 -}}
                          {{- $prevHeaderLevel := len (seq $prevHeaderLevel) -}}
                          {{- if gt $headerLevel $prevHeaderLevel -}}
                          {{- range seq $prevHeaderLevel (sub $headerLevel 1) -}}
                          <ul>
                              {{/* the first should not be recorded */}}
                              {{- if ne $prevHeaderLevel . -}}
                              {{- $.Scratch.Add "bareul" . -}}
                              {{- end -}}
                              {{- end -}}
                              {{- else -}}
                              </li>
                              {{- if lt $headerLevel $prevHeaderLevel -}}
                              {{- range seq (sub $prevHeaderLevel 1) -1 $headerLevel -}}
                              {{- if in ($.Scratch.Get "bareul") . -}}
                          </ul>
                          {{/* manually do pop item */}}
                          {{- $tmp := $.Scratch.Get "bareul" -}}
                          {{- $.Scratch.Delete "bareul" -}}
                          {{- $.Scratch.Set "bareul" slice}}
                          {{- range seq (sub (len $tmp) 1) -}}
                          {{- $.Scratch.Add "bareul" (index $tmp (sub . 1)) -}}
                          {{- end -}}
                          {{- else -}}
                      </ul>
                      </li>
                      {{- end -}}
                      {{- end -}}
                      {{- end -}}
                      {{- end }}
                      <li>
                          <a href="#{{- $cleanedID -}}" aria-label="{{- $header | plainify -}}">{{- $header | safeHTML -}}</a>
                          {{- else }}
                      <li>
                          <a href="#{{- $cleanedID -}}" aria-label="{{- $header | plainify -}}">{{- $header | safeHTML -}}</a>
                          {{- end -}}
                          {{- end -}}
                          <!-- {{- $firstHeaderLevel := len (seq (index (findRE "[1-6]" (index $headers 0) 1) 0)) -}} -->
                          {{- $firstHeaderLevel := $largest }}
                          {{- $lastHeaderLevel := len (seq (index (findRE "[1-6]" (index $headers (sub (len $headers) 1)) 1) 0)) }}
                      </li>
                      {{- range seq (sub $lastHeaderLevel $firstHeaderLevel) -}}
                      {{- if in ($.Scratch.Get "bareul") (add . $firstHeaderLevel) }}
                  </ul>
                  {{- else }}
                  </ul>
                  </li>
                  {{- end -}}
                  {{- end }}
                  </ul>
              </div>
          </details>
      </div>
  </aside>
  <script>
      let activeElement;
      let elements;
      window.addEventListener('DOMContentLoaded', function (event) {
          checkTocPosition();

          elements = document.querySelectorAll('h1[id],h2[id],h3[id],h4[id],h5[id],h6[id]');
          // Make the first header active
          activeElement = elements[0];
          const id = encodeURI(activeElement.getAttribute('id')).toLowerCase();
          document.querySelector(`.inner ul li a[href="#${id}"]`).classList.add('active');
      }, false);

      window.addEventListener('resize', function(event) {
          checkTocPosition();
      }, false);

      window.addEventListener('scroll', () => {
          // Check if there is an object in the top half of the screen or keep the last item active
          activeElement = Array.from(elements).find((element) => {
              if ((getOffsetTop(element) - window.pageYOffset) > 0 && 
                  (getOffsetTop(element) - window.pageYOffset) < window.innerHeight/2) {
                  return element;
              }
          }) || activeElement

          elements.forEach(element => {
              const id = encodeURI(element.getAttribute('id')).toLowerCase();
              if (element === activeElement){
                  document.querySelector(`.inner ul li a[href="#${id}"]`).classList.add('active');
              } else {
                  document.querySelector(`.inner ul li a[href="#${id}"]`).classList.remove('active');
              }
          })
      }, false);

      const main = parseInt(getComputedStyle(document.body).getPropertyValue('--article-width'), 10);
      const toc = parseInt(getComputedStyle(document.body).getPropertyValue('--toc-width'), 10);
      const gap = parseInt(getComputedStyle(document.body).getPropertyValue('--gap'), 10);

      function checkTocPosition() {
          const width = document.body.scrollWidth;

          if (width - main - (toc * 2) - (gap * 4) > 0) {
              document.getElementById("toc-container").classList.add("wide");
          } else {
              document.getElementById("toc-container").classList.remove("wide");
          }
      }

      function getOffsetTop(element) {
          if (!element.getClientRects().length) {
              return 0;
          }
          let rect = element.getBoundingClientRect();
          let win = element.ownerDocument.defaultView;
          return rect.top + win.pageYOffset;   
      }
  </script>
  {{- end }}  
  ```
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