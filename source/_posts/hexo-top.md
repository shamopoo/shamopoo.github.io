---
title: hexo置顶文章及样式美化
date: 2018-05-14 17:51:12
tags:
   - hexo
categories:
   - 技能簿
---

## 问题描述

文章置顶功能实现, top值越高越在前。由于官方并未给出置顶功能, 所以要手动修改。
{% pullquote tip %}
sticky: 显示图钉样式
top: 置顶功能实现
{% endpullquote  %}
## 原理

在Hexo生成首页HTML时， top值越高越在前，达到文章置顶功能。

<!-- more -->

## 修改

找到<code>node_modules\hexo-generator-index\lib\generator.js</code>文件。替换如下：

``` JAVASCRIPT
'use strict';
var pagination = require('hexo-pagination');
module.exports = function(locals){
  var config = this.config;
  var posts = locals.posts;
    posts.data = posts.data.sort(function(a, b) {
        if(a.top && b.top) { // 两篇文章top都有定义
            if(a.top == b.top) return b.date - a.date; // 若top值一样则按照文章日期降序排
            else return b.top - a.top; // 否则按照top值降序排
        }
        else if(a.top && !b.top) { // 以下是只有一篇文章top有定义，那么将有top的排在前面（这里用异或操作居然不行233）
            return -1;
        }
        else if(!a.top && b.top) {
            return 1;
        }
        else return b.date - a.date; // 都没定义按照文章日期降序排
    });
  var paginationDir = config.pagination_dir || 'page';
  return pagination('', posts, {
    perPage: config.index_generator.per_page,
    layout: ['index', 'archive'],
    format: paginationDir + '/%d/',
    data: {
      __index: true
    }
  });
};
```

找到<code>themes\主题\layout\_macro\post.swig</code>文件。在<code>POST BLOCK</code>添加如下：

``` HTML
<div class="set-top"><div>置顶</div></div>
```
找到<code>themes\主题\source\css\_custom\custom.styl</code>文件。添加如下：

``` CSS
/*置顶*/
article:not(:first-of-type) .post-block .set-top div{display:none;}
article:last-of-type .post-block .set-top div{display:none;}
article:first-of-type .post-block .set-top {
    width: 80px;
    height: 80px;
    overflow: hidden;
    position: absolute;
    top: -3px;
    right: -3px;
}
article:first-of-type .post-block .set-top div{
    line-height: 18px;
    text-align: center;
    -webkit-transform: rotate(45deg);
    -moz-transform: rotate(45deg);
    -ms-transform: rotate(45deg);
    -o-transform: rotate(45deg);
    position: relative;
    padding: 3px 0;
    top: 12px;
    width: 113px;
    background-color: #0bf;
    color: #fff;
    box-shadow: -3px 5px 6px -5px rgba(0,0,0,.5);
    background: -webkit-linear-gradient(left , rgba(48,182,209,0.99),rgba(43,70,191,0.99) 100%);
}
article:first-of-type .set-top>div:before {
    content: "";
    position: absolute;
    left: 6px;
    top: 100%;
    z-index: -1;
    border-left: 4px solid #31a4ce;
    border-right: 4px solid transparent;
    border-bottom: 4px solid transparent;
    border-top: 4px solid #31a4ce;
}
article:first-of-type .set-top>div:after {
    content: "";
    position: absolute;
    right: 6px;
    top: 100%;
    z-index: -1;
    border-left: 4px solid transparent;
    border-right: 4px solid #2f5ec3;
    border-bottom: 4px solid transparent;
    border-top: 4px solid #2f5ec3;
}
```

## 使用

``` Markdown
title: hexo置顶文章及样式美化
date: 2018-05-14 17:51:12
tags: - hexo
categories: - 技能簿
top: 100
```
