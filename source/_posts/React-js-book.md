---
title: React.js 小书
date: 2018-12-20 10:20:48
tags:
    - React
categories:
  - 技能簿
---

  最近，在入门react，从[React.js 小书](http://huziketang.mangojuice.top/books/react/)开始入坑。

<!-- more -->

## 预览

[预览](http://jiushi38.coding.me/react-book/)
[源码](https://github.com/shamopoo/Notes/tree/master/react-book)

## JSX

<samp>
```  JAVASCRIPT
const element = <h1>Hello, world!</h1>;
``` 
</samp>

这种写法是不是很奇怪？包含着HTML和JavaScript。

它被称为JSX，一种 JavaScript 的语法扩展，是React 的核心组成部分。

在React 中，JSX会被编译成普通的 JavaScript 对象。举个栗子：

<samp>
```  HTML
<ul id='list'>
  <li class='item'>Item 1</li>
  <li class='item'>Item 2</li>
  <li class='item'>Item 3</li>
</ul>
``` 
</samp>

每个 DOM 元素的结构都可以用 JavaScript 的对象来表示。你会发现一个 DOM 元素包含的信息其实只有三个：标签名，属性，子元素。

所以其实上面这个 HTML 所有的信息我们都可以用合法的 JavaScript 对象来表示：

<samp>
```  JAVASCRIPT
{
  tag: 'ul',
  attrs: { className: null, id: 'list'},
  children: [
    {
      tag: 'li',
      arrts: { className: 'item' }
    },
     {
      tag: 'li',
      arrts: { className: 'item' }
    },
     {
      tag: 'li',
      arrts: { className: 'item' }
    }
  ]
}
``` 
</samp>

React利用render将JavaScript对象转化成DOM。主要代码如下：

<samp>
```  JAVASCRIPT
Element.prototype.render = function () {
    var el = document.createElement(this.tagName) // 根据tagName构建
  var props = this.props

  for (var propName in props) { // 设置节点的DOM属性
    var propValue = props[propName]
    el.setAttribute(propName, propValue)
  }

  var children = this.children || []

  children.forEach(function (child) {
    var childEl = (child instanceof Element)
      ? child.render() // 如果子节点也是虚拟DOM，递归构建DOM节点
      : document.createTextNode(child) // 如果字符串，只构建文本节点
    el.appendChild(childEl)
  })

  return el
}
``` 
</samp>


<samp>
```  JAVASCRIPT
// JSX编译过程 => [过程] =>
JSX => Babel 编译 React.js =>  
JavaScript对象结构 => ReactDom.render => 
DOM元素 => 
插入页面
``` 
</samp>

## setState

React.js 的 state 就是用来存储这种可变化的状态的。如果要想改变某个状态呢？那就
需要setState。

setState 方法由父类 Component 所提供。setState 接受<code>对象参数 </code>和  <code>函数参数</code>。<code>当我们调用这个函数的时候，React.js 会更新组件的状态 state ，并且重新调用 render 方法，然后再把 render 方法所渲染的最新的内容显示到页面上。</code>



{% pullquote warning %}
注意：
当你调用 setState 的时候，React.js 并不会马上修改 state。
{% endpullquote  %}

调用 setState 的时候，是把这个对象放到一个更新队列里面，稍后才会从队列当中把新的状态提取出来合并到 state 当中，然后再触发组件更新。举个栗子：


<samp>
```  JAVASCRIPT
class Index extends Component {
    constructor () {
        super()
        this.state = { isLiked: false }
    }
    handleClickOnLikeButton () {
        console.log(this.state.isLiked) // false
        this.setState({
            isLiked: !this.state.isLiked
        })
        console.log(this.state.isLiked) // false
    }
    render() {
        return(
            <button onClick={this.handleClickOnLikeButton.bind(this)>
                  {this.state.isLiked ? '取消' : '点赞'} 
            </botton>
        )
    }
}
``` 
</samp>

{% pullquote tip %}
Tip:
在使用 React.js 的时候，并不需要担心多次进行 setState 会带来性能问题。//  ✅ 
{% endpullquote  %}


## 未完待续













