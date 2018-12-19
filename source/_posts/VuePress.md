---
title: VuePress搭建个人博客
date: 2018-05-11 20:23:46
tags:
    - VuePress
categories:
    - 技能簿
---


借助[VuePress](https://vuepress.docschina.org/)文档用VuePress + github搭建博客, 初试VuePress。

## 原理

VuePress 网站实际上是由 Vue, Vue Router 和 webpack 驱动的单页面应用程序。


## 注意
{% pullquote warning %}
兼容性注意事项
VuePress 要求 Node.js >= 8。
{% endpullquote  %}

<!-- more -->
## 安装

``` sh
$ npm install -g vuepress
```

## 克隆VuePress

``` sh
$ git clone git@github.com:docschina/vuepress.git
```

## 运行

``` sh
$ cd VuePress
$ cd docs
$ vuepress dev
```

{% pullquote tip %}

VuePress dev server listening at http://localhost:8080/
出现上述提示，运行成功

{% endpullquote  %}


打开[http://localhost:8080/](http://localhost:8080/)查看效果。
