---
title: '原型链:prototype和__proto__区别'
date: 2018-12-20 15:24:31
tags:
  - 原型链
categories:
  - 技能簿      
---

## 问题

在wx交流群看到了一个关于原型链的题目，引起了我对原型链探索的兴趣。


<samp>
``` JAVASCRIPT
    Object.prototype.a = 'a'
    Function.prototype.a = 'b'
    function person () {}
    var peter = new person()
    peter.a  // 😳 a or b
``` 
</samp>

<!-- more -->

当时，我的理解如下：
<samp>
``` JAVASCRIPT
peter  =>  __proto__  =>  pesron.prototype  => __proto__ => Object.prototype
person  =>  __proto__  =>  Function.prototype  => __proto__ => Object.prototype
``` 
</samp>

问题来了，proto是什么东西？

[在javascript的世界里，一切皆为对象。每个实例对象（object ）都有一个私有属性（称之为__proto__）指向它的原型对象（prototype)。该原型对象也有一个自己的原型对象(__proto__) ，层层向上直到一个对象的原型对象为 null。根据定义，null 没有原型，并作为这个原型链中的最后一个环节。](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Inheritance_and_the_prototype_chain)

可以说，区别就是原型链是靠<code>——proto——</code>来链接的,共同点都是用来实现基于原型的继承。

那么，下面的代码是为true:

<samp>
``` JAVASCRIPT
// Object.creat() 除外
 obj.__proto__ === obj.constructor.prototype // true
``` 
</samp>

### 趁热打铁

<samp>
``` JAVASCRIPT

Function.__proto__ == Function.prototype // true

Object.__proto__ == Object.prototype // false

Object.__proto__ == Function.prototype // true

Function.prototype.__proto__ == Object.prototype // true

Object.__proto__.__proto__ === Object.prototype.constructor.prototype // true

Object.__proto__.prototype // undefined

Function.prototype.__proto__ == Object.prototype // true

``` 
</samp>

这时候，肯定会有点晕+_+，那祭出[原型链神图](https://moetu.fastmirror.org/images/2018/12/20/utf-8-FsA8_UozPiTrwf-G_TE8cR1-ktlj537435246c961e2c.jpg)。


## 总结

原型链到Object.prototype.——proto—— 结束，指向null。

Object.create()创建的对象没有继承Object.prototype。

原型链是靠——proto——来链接的。

——proto——和prototype都是用来实现基于原型的继承。







