---
title: 一台电脑上用多个git账户更新多个hexo博客
date: 2018-05-05 15:00:58
tags:
  - hexo
  - git
categories:
  - 技能簿
---

## 问题描述

有时候我们一台电脑要更新两个甚至多个hexo博客, 而电脑默认保存一个git私钥/公钥。


## 思路

生成多个不同的私钥/公钥, 分别 hexo g 到多个的git账户，从而实现更新多个hexo博客。
<!-- more -->
## 配置

1.查看是否存在SSH密钥
``` sh
$ cd ~/.ssh
```
如果有 id_rsa 和 id_rsa.pub，说明已存在一对密钥/公钥。

2.创建新的 私钥/公钥, 并指定秘钥名称, 如 id_rsa_second

``` sh
ssh-keygen -t rsa -f  ~/.ssh/id_rsa_second -C "yourmail@xxx.com"
```

完成后, 该目录下会多出 id_rsa_second 和 id_rsa_second.pub 两个文件

3.在 ~/.ssh 目录下创建一个名为 config 文件

将以下内容添加到 config 文件中

``` sh
# 第一个账号，默认使用的账号
Host github.com
HostName github.com
User git
IdentityFile ~/.ssh/id_rsa
# 第二个账号
Host second.github.com  # second为前缀名，可以任意设置
HostName github.com
User git
IdentityFile ~/.ssh/id_rsa_second
```

{% pullquote tip %}
原理分析
1.ssh 客户端是通过类似 git@github.com:githubUserName/repName.git 的地址来识别使用本地的哪个私钥的，
地址中的 User 是@前面的git， Host 是@后面的github.com。
2.如果所有账号的 User 和 Host 都为 git 和 github.com，那么就只能使用一个私钥。
所以要对User 和 Host 进行配置，让每个账号使用自己的 Host，每个 Host 的域名做 CNAME 解析到 github.com，
如上面配置中的Host second.github.com。
3.配置了别名之后，新的地址就是git@second.github.com:githubUserName/repName.git。
这样 ssh 在连接时就可以区别不同的账号了。
{% endpullquote  %}

4.查看 SSH 密钥的值，分别添加到对应的 GitHub 账户中

``` sh
$ cat id_rsa.pub
$ cat id_rsa_second.pub
```

5.清空本地的 SSH 缓存，添加新的 SSH 密钥 到 SSH agent中

``` sh
$ ssh-add -D
$ ssh-add id_rsa
$ ssh-add id_rsa_second
```

最后确认一下新秘钥已经添加成功

``` sh
$ ssh-add -l
```
6.测试 ssh 链接

``` sh
ssh -T git@github.com
ssh -T git@second.github.com
```
{% pullquote tip %}

Hi username! You've successfully authenticated, but GitHub does not provide shell access.
出现上述提示，连接成功

{% endpullquote  %}

7.进入项目文件夹，单独设置用户名/邮箱

``` sh
# 取消全局 用户名/邮箱 配置
$ git config --global --unset user.name
$ git config --global --unset user.email
# 进入项目文件夹，单独设置每个repo 用户名/邮箱
$ git config user.email "xxxx@xx.com"
$ git config user.name "xxxx"
```

查看设置是否成功

``` sh
git config --list
```
8.最后在 hexo 配置文件修改git地址

``` sh
deploy:
  type: git
  repository: git@second.github.com:username/username.github.io.git
  branch: master
```

配置多个git账户重复以上步骤。

## 参考
[一台电脑上用多个git账户](http://e-e.iteye.com/blog/2359320)
