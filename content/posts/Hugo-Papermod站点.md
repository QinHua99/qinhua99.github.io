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
# Hugo下载与安装<sup>[1](#rf1)</sup>
- 到[Github](https://github.com/gohugoio/hugo/releases/tag/v0.121.1)下载[Hugo](https://gohugo.io/getting-started/quick-start/)的二进制文件，解压到合适位置。
  {{< fancybox_figure align=center src="Hugo-1.png" >}}
- 在电脑中添加**环境变量**。    
  “环境变量”-“Path”-"编辑环境变量"-“新建”-“D:\Application\hugo”，确定即可
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
本站的主题配置如下，大部分的配置只需要参考[官网说明](https://adityatelange.github.io/hugo-PaperMod/)或[前辈们](#reference)的即可   
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
## 公式问题<sup>[9](#rf9)</sup> 
按照[PaperMod官方](https://adityatelange.github.io/hugo-PaperMod/posts/math-typesetting/)的配置后，当插入公式存在无法显示，主要由于换行。   
**解决**：对于换行的`\\`要使用`\\\`来替代即可。   
```latex
x = \begin{cases}
   a &\text{if } b \\\
   c &\text{if } d
\end{cases}
``` 
$$
x = \begin{cases}
   a &\text{if } b \\
   c &\text{if } d
\end{cases}
$$
## 目录放在侧面<sup>[2](#rf2)</sup>   
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
  修改`css/extended/blank.css`，添加如下代码
  ```css
  :root {
      --nav-width: 1380px;
      --article-width: 650px;
      --toc-width: 300px;
  }

  .toc {
      margin: 0 2px 40px 2px;
      border: 1px solid var(--border);
      background: var(--entry);
      border-radius: var(--radius);
      padding: 0.4em;
  }

  .toc-container.wide {
      position: absolute;
      height: 100%;
      border-right: 1px solid var(--border);
      left: calc((var(--toc-width) + var(--gap)) * -1);
      top: calc(var(--gap) * 2);
      width: var(--toc-width);
  }

  .wide .toc {
      position: sticky;
      top: var(--gap);
      border: unset;
      background: unset;
      border-radius: unset;
      width: 100%;
      margin: 0 2px 40px 2px;
  }

  .toc details summary {
      cursor: zoom-in;
      margin-inline-start: 20px;
      padding: 12px 0;
  }

  .toc details[open] summary {
      font-weight: 500;
  }

  .toc-container.wide .toc .inner {
      margin: 0;
  }

  .active {
      font-size: 110%;
      font-weight: 600;
  }

  .toc ul {
      list-style-type: circle;
  }

  .toc .inner {
      margin: 0 0 0 20px;
      padding: 0px 15px 15px 20px;
      font-size: 16px;

      /*目录显示高度*/
      max-height: 83vh;
      overflow-y: auto;
  }

  .toc .inner::-webkit-scrollbar-thumb {  /*滚动条*/                                             
      background: var(--border);
      border: 7px solid var(--theme);
      border-radius: var(--radius);
  }

  .toc li ul {
      margin-inline-start: calc(var(--gap) * 0.5);                                               
      list-style-type: none;
  }

  .toc li {
      list-style: none;
      font-size: 0.95rem;
      padding-bottom: 5px;
  }

  .toc li a:hover {
      color: var(--secondary);
  }
  ```
## 自定义字体和代码<sup>[3](#rf3),[7](#rf7),[8](#rf8)</sup>   
  字体选择的是[LXGW WenKai/霞鹜文楷](https://github.com/lxgw/LxgwWenKai)，参考其[网页嵌入](https://github.com/lxgw/LxgwWenKai/issues/24)实现。   
  在`layouts/partials/extend_head.html`中插入HTML代码
  ```html
  <link rel="stylesheet" href="https://cdn.staticfile.org/lxgw-wenkai-screen-webfont/1.6.0/style.css" />
  ```
  在`assets/css/extended/blank.css`中插入CCS即可，`Consolas`是本博客采用的字体   
  ```css
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
## Fancybox 实现图片灯箱/放大功能  
  根据[官方](https://fancyapps.com/fancybox/getting-started/)的教程和结合大佬<sup>[8](#r8)</sup>的描述得出，在`layouts/partials/footer.html`中加入如下代码   
  ```html
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.4.1/dist/jquery.min.js"></script>

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.css" />
  <script src="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.js"></script>
  ```
  为了方便引用图片，比如给图片居中的属性，则创建`layouts/shortcodes/fancybox_figure.html`，添加代码如下
  ```html
  <figure{{ if or (.Get "class") (eq (.Get "align") "center") }} class="
            {{- if eq (.Get "align") "center" }}align-center {{ end }}
            {{- with .Get "class" }}{{ . }}{{- end }}"
    {{- end -}}>
        <a href="{{ .Get "src" }}" data-fancybox="gallery">
            <img loading="lazy" src="{{ .Get "src" }}{{- if eq (.Get "align") "center" }}#center{{- end }}"
                {{- if or (.Get "alt") (.Get "caption") }}
                alt="{{ with .Get "alt" }}{{ . }}{{ else }}{{ .Get "caption" | markdownify| plainify }}{{ end }}"
                {{- end -}}
                {{- with .Get "width" }} width="{{ . }}"{{ end -}}
                {{- with .Get "height" }} height="{{ . }}"{{ end -}}
            />
        </a>
        {{- if or (or (.Get "title") (.Get "caption")) (.Get "attr") -}}
            <figcaption>
                {{ with (.Get "title") -}}
                    {{ . }}
                {{- end -}}
                {{- if or (.Get "caption") (.Get "attr") -}}<p>
                    {{- .Get "caption" | markdownify -}}
                    {{- with .Get "attrlink" }}
                        <a href="{{ . }}">
                    {{- end -}}
                    {{- .Get "attr" | markdownify -}}
                    {{- if .Get "attrlink" }}</a>{{ end }}</p>
                {{- end }}
            </figcaption>
        {{- end }}
  </figure>
  ```  
  引用：`center`居中（可选），`caption`：描述，`src`：图片
  {{< fancybox_figure align=center src="hugo-picture.png" caption="示例" >}}  
# 部署到Github
将配置的blog文件夹下的内容复制到Github站点文件下（见[创建GitHub-Blog仓库](#创建github-blog仓库)），运行如下代码进行上传，期间需要输入`Github`的用户信息，也可以直接配置`ssh key`
```shell
hugo -F --cleanDestinationDir 
git add .
git commit -m "update %date% %time%"
git push origin main
```
最后在Github对应仓库下，点击`Settings`-`Pages`配置即可，本站生产的在`/docs`下，关于网站生产内容也可以单独开分支上传，方式很多
{{< fancybox_figure align=center src="hugo-github.png" caption="Github-Pages" >}}  
# Reference 
<a id="rf1">[1. 零成本搭建个人博客：hugo安装](https://zhuanlan.zhihu.com/p/440175312)</a>   
<a id="rf2">[2. [置顶] hugo博客搭建 | PaperMod主题 | Sulv's Blog](https://www.sulvblog.cn/posts/blog/build_hugo/)</a>   
<a id="rf3">[3. Hugo + PaperMod搭建技术博客 | Kyrie](https://kyxie.github.io/zh/blog/tech/papermod/#%e5%ae%89%e8%a3%85%e8%bf%87%e7%a8%8b)</a>   
<a id="rf4">[4. PaperMod主题配置|🚀 田少晗的个人博客](https://www.shaohanyun.top/posts/env/blog_build2/#:~:text=PaperMod%E4%B8%BB%E9%A2%98%E9%85%8D%E7%BD%AE%201%20Hugo%E7%9B%AE%E5%BD%95%E7%BB%93%E6%9E%84%20%E6%88%91%E4%BB%AC%E5%85%88%E6%9D%A5%E4%BA%86%E8%A7%A3%E6%A0%B9%E7%9B%AE%E5%BD%95%E4%B8%8B%E5%90%84%E4%B8%AA%E6%96%87%E4%BB%B6%E5%A4%B9%E7%9A%84%E4%BD%9C%E7%94%A8%EF%BC%8C%E5%8F%AF%E4%BB%A5%E5%8F%82%E8%80%83%20%E5%AE%98%E6%96%B9%E7%9B%AE%E5%BD%95%E7%BB%93%E6%9E%84%E8%AF%B4%E6%98%8E%20%3A%20...%202,...%208%20%E5%86%85%E5%AE%B9%E7%AE%A1%E7%90%86%20%E6%88%91%E4%BB%AC%E5%86%99%E4%BD%9C%E7%9A%84%E5%86%85%E5%AE%B9%E9%83%BD%E6%98%AF%E6%94%BE%E5%9C%A8%20content%20%E7%9B%AE%E5%BD%95%E4%B8%8B%E7%9A%84%EF%BC%8C%E5%9B%A0%E6%AD%A4%E6%9C%89%E5%BF%85%E8%A6%81%E5%AF%B9%E5%85%B6%E5%86%85%E5%AE%B9%E6%9C%89%E4%B8%80%E4%B8%AA%E5%9F%BA%E6%9C%AC%E4%BA%86%E8%A7%A3%20...%20%E6%9B%B4%E5%A4%9A%E9%A1%B9%E7%9B%AE)</a>   
<a id="rf5">[5. Hello Hugo | 仙羡小站](https://www.liyangjie.cn/posts/hobby/hello-hugo/)</a>   
<a id="rf6">[6. 折腾 Hugo & PaperMod 主题 | Dvel's Blog](https://dvel.me/posts/hugo-papermod-config/)</a>   
<a id="rf7">[7. Hugo使用自定义字体-晓寒轻](https://zhuanlan.zhihu.com/p/627444050)</a>   
<a id="rf8">[8. Hugo 博客自定义优化ANY_ME | ANY_ME](https://shishuochen.gitee.io/2020/uffick8u1/)</a>   
<a id="rf9">[9. 在Hugo PaperMod主题中加入数学支持的最简方式](https://blog.csdn.net/WongSSH/article/details/126962069)</a>   
