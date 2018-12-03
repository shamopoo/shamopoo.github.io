---
title: git常用命令
date: 2018-06-09 19:12:15
tags:
    - git
categories:
    - 技能薄
---
![](https://moetu.fastmirror.org/images/2018/06/09/7905675-1576522-18da5d6b032c5b620.jpg)
进入新公司，要求使用git多人协同开发，记录一下git常用命令。
<!-- more -->

## 配置

###  1.  配置用户信息

``` SH
# 配置全局用户信息
$ git config --global user.name “your name”
$ git config --global user.email “your email”

# 查看当前用户信息
$ git config user.name
$ git config user.email

```
### 2. 本地生成SSH私钥和公钥

``` SH
# 查看是否存在SSH
$ cd ~/. ssh
# 不存在生成，进行下步
# 生成本地SSH私钥和公钥
$ ssh-keygen -t rsa -C “your name”
 ```

 这样在用户下的C:\Users\Administrator.\.ssh目录里就可以创建id_rsa和id_rsa.pub这两个文件。
 把id_ras.pub文件的内容复制到coding.net个人账户的SSH公钥中。

## 操作

### 1.  下载
``` SH
# 克隆
$ git clone 仓库的SSH地址
```
### 2.  关联
``` SH
# 本地仓库关联远程仓库
$ git remote add origin 远程仓库地址
# 测试是否关联成功
$ git remote -v
```
### 3.  推送
``` SH
# 从远程仓库更新到本地
$ git pull
# 查看文件状态
$ git status
# 部分文件添加到暂存区
$ git  add  [file1] [file2]
# 当前目录所有文件添加到暂存区
$ git add .
# 再次查看文件状态(添加的变为绿色)
$ git status
# 提交暂存区到仓库，并添加必要注释
$ git commit -m ‘必要的注释’
# 推送到远程仓库
$ git push
```

## 分支
``` SH
# 列出本地所有分支
$ git branch
# 列出远程所有分支
$ git branch -r
# 新建一个分支
$ git branch  [branch-name]
# 切换分支
$ git checkout [branch-name]
# 合并指定分支到当前分支
$ git merge [branch]
# 删除分支
$ git branch -d [branch-name]
```


## 撤销
``` SH
# 同时对多个文件执行了git add,但本次只想提交其中一部分文件
$ git reset HEAD [filename]
# 文件执行了git add,但想撤销对其的修改
$ git reset HEAD [filename]
$ git checkout [filename]
```


## 回滚
``` SH
# 撤销指定文件到指定版本
$ git log [filename]
$ git checkout [commitID] [filename]
# 回滚到某次提交
$ git log
$ git revert [commitID]
```
