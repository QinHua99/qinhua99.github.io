---
title : 'Hugo-PaperMod'
date : 2023-12-17T17:11:24+08:00
draft : false
ShowToc : true
TocOpen : true
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
 



# 文章书写
- 居中图片采用`{{< figure align=center src="picture.png" >}}`
https://blog.csdn.net/WongSSH/article/details/126962069


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

- Fancybox 实现图片灯箱/放大功能   
  根据[官方](https://fancyapps.com/fancybox/getting-started/)的教程和结合大佬<sup>1,2</sup>的描述得出，在`layouts/partials/footer.html`中加入如下代码   
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
  ```h
  {{< fancybox_figure align=center src="picture.png" caption="Caption #1" >}}
  ``` 
[^1]:这是一个脚注   

这是一个例子<sup>1</sup>。

# Reference
1. [Hugo + PaperMod搭建技术博客](https://kyxie.github.io/zh/blog/tech/papermod/#%e4%bf%ae%e6%94%b9%e5%85%a8%e5%b1%80%e5%ad%97%e4%bd%93)
1. [Hugo使用自定义字体-晓寒轻](https://zhuanlan.zhihu.com/p/627444050)
1. [Fancybox Getting Started](https://fancyapps.com/fancybox/getting-started/)
2. [Hugo 博客自定义优化ANY_ME](https://shishuochen.gitee.io/2020/uffick8u1/)  
[1]: https://en.wikipedia.org/wiki/Hobbit#Lifestyle