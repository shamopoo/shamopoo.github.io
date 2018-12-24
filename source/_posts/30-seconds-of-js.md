---
title: 30 seconds of Javascript
date: 2018-12-21 11:44:39
tags:
    - js
    - 30secondsofcode
categories:
    - 技能薄      
---

在Gitgub上看见一个好玩的项目 [30 seconds of code](https://github.com/30-seconds/30-seconds-of-code#-adapter-1)，js真好玩。
<!-- more -->

## 🔌 适配

### ary

创建一个最多可以接受<code>n</code>个参数的函数，无视任何其他参数。
调用提供的函数，<code>fn</code>，最多n个参数。
运用<code>Array.prototype.slice(0,n)</code>和展开运算符<code>...</code>

<samp>
``` JAVASCRIPT
const ary = (fn, n) => (...args) => fn(...args.slice(0, n));
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
const firstTwoMax = ary(Math.max, 2);
[[2, 6, 'a'], [8, 4, 6], [10]].map(x => firstTwoMax(...x));  // [6, 8, 10]
``` 
</samp>

### over

创建一个函数，该函数使用它接收的参数调用每个提供的函数并返回结果。
使用<code>Array.prototype.map()</code>和<code>Function.prototype.apply()</code>将每个函数应用于给定的参数。

<samp>
``` JAVASCRIPT
const ary = (fn, n) => (...args) => fn(...args.slice(0, n));
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
const firstTwoMax = ary(Math.max, 2);
[[2, 6, 'a'], [8, 4, 6], [10]].map(x => firstTwoMax(...x));  // [6, 8, 10]
``` 
</samp>

### unary

创建只接受一个参数的函数。
调用提供的函数<code>fn</code>, 只返回第一个参数。

<samp>
``` JAVASCRIPT
const unary = fn => val => fn(val);
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
['6', '8', '10'].map(unary(parseInt)); // [6, 8, 10]
``` 
</samp>


## 📚 Array

### all

如果为集合中的所有元素提供的函数返回<code>true</code>，则返回<code>true</code>，否则返回<code>false</code>。
使用<code>Array.prototype.every()</code>来测试集合中的所有元素是否基于<code>fn</code>返回<code>true</code>。 省略第二个参数<code>fn</code>，使用<code>Boolean</code>作为默认值。

<samp>
``` JAVASCRIPT
const all = (arr, fn = Boolean) => arr.every(fn);
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
all([4, 2, 3], x => x > 1); // true
all([1, 2, 3]); // true
``` 
</samp>


### allEqual

判断数组的所有元素是否相等。
使用<code>Array.prototype.every()</code>判断数组的所有元素是否与第一个元素相等。

<samp>
``` JAVASCRIPT
const allEqual = arr => arr.every(val => val === arr[0]);
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
allEqual([1, 2, 3, 4, 5, 6]); // false
allEqual([1, 1, 1, 1]); // true
``` 
</samp>


### some

如果为集合中的至少一个元素提供的函数返回<code>true</code>，则返回<code>true</code>，否则返回<code>false</code>。
使用<code>Array.prototype.some()</code>来测试集合中的所有元素是否基于<code>fn</code>返回<code>true</code>。 省略第二个参数<code>fn</code>，使用<code>Boolean</code>作为默认值。

<samp>
``` JAVASCRIPT
const any = (arr, fn = Boolean) => arr.some(fn);
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
any([0, 1, 2, 0], x => x >= 2); // true
any([0, 0, 1, 0]); // true
``` 
</samp>

### bifurcate

将值拆分为两组。 如果过滤器中的元素是真的，则集合中的对应元素属于第一组; 否则，它属于第二组。
使用<code>Array.prototype.reduce()</code>和<code>Array.prototype.push()</code>根据过滤器向数组添加元素。

<samp>
``` JAVASCRIPT
const bifurcate = (arr, filter) =>
  arr.reduce((acc, val, i) => (acc[filter[i] ? 0 : 1].push(val), acc), [[], []]);
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
bifurcate(['beep', 'boop', 'foo', 'bar'], [true, true, false, true]); 
// [ ['beep', 'boop', 'bar'], ['foo'] ]
``` 
</samp>

### chunk

将数组分割为指定大小的数组。
使用<code>Array.from()</code>创建一个新数组，该数组符合指定大小。 使用<code>Array.prototype.slice()</code>将新数组的每个元素映射到一个大小的数组中。 如果原始数组无法均匀分割，则最终的数组包含其余元素。

<samp>
``` JAVASCRIPT
const chunk = (arr, size) =>
  Array.from({ length: Math.ceil(arr.length / size) }, (v, i) =>
    arr.slice(i * size, i * size + size)
  );
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
chunk([1, 2, 3, 4, 5], 2); // [[1,2],[3,4],[5]]
``` 
</samp>


### compact

使用<code>Array.prototype.filter()</code> 从数组中删除<code> (false, null, 0, "", undefined, and NaN)</code> 。

<samp>
``` JAVASCRIPT
const compact = arr => arr.filter(Boolean);
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
compact([0, 1, false, 2, '', 3, 'a', 'e' * 23, NaN, 's', 34]); 
// [ 1, 2, 3, 'a', 's', 34 ]
``` 
</samp>


### countBy

基于给定函数对数组的元素进行分组，并返回每个组中元素的数量。
使用<code>Array.prototype.map()</code>将数组的值映射到函数或属性名称。 使用<code>Array.prototype.reduce()</code>创建一个对象，其中的键是从映射结果生成的。

<samp>
``` JAVASCRIPT
const countBy = (arr, fn) =>
  arr.map(typeof fn === 'function' ? fn : val => val[fn]).reduce((acc, val) => {
    acc[val] = (acc[val] || 0) + 1;
    return acc;
  }, {});
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
countBy([6.1, 4.2, 6.3], Math.floor); // {4: 1, 6: 2}
countBy(['one', 'two', 'three'], 'length'); // {3: 2, 5: 1}
``` 
</samp>

### countOccurrences

计算数组的元素出现的次数。
使用<code>Array.prototype.reduce()</code>递增器计算数组每个元素出现的次数。

<samp>
``` JAVASCRIPT
const countOccurrences = (arr, val) => 
arr.reduce((a, v) => (v === val ? a + 1 : a), 0);
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
countOccurrences([1, 1, 2, 1, 2, 3], 1); // 3
``` 
</samp>

### deepFlatten

深度展平一维数组。
运用递归。使用<code>Array.prototype.concat()</code>、空数组<code>[]</code>和展开运算符
<code>...</code>去展平数组。递归地展平数组的每个元素。

<samp>
``` JAVASCRIPT
const deepFlatten = arr => 
[].concat(...arr.map(v => (Array.isArray(v) ? deepFlatten(v) : v)));
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
deepFlatten([1, [2], [[3], 4], 5]); // [1,2,3,4,5]
[1, [2], [[3], 4], 5].toString().split(',') //  ✅ [1,2,3,4,5]
``` 
</samp>


### filterNonUnique
过滤掉数组中的非唯一值。
使用<code>Array.prototype.filter()</code>用于仅包含唯一值的数组。

<samp>
``` JAVASCRIPT
const filterNonUnique = arr => 
arr.filter(i => arr.indexOf(i) === arr.lastIndexOf(i));
``` 
</samp>

<samp>
``` JAVASCRIPT
filterNonUnique([1, 2, 2, 3, 4, 4, 5]); // [1, 3, 5]
``` 
</samp>

### forEachRight

从数组的最后一个元素开始，为每个数组元素执行一次提供的函数。
使用<code>Array.prototype.slice(0)</code>克隆给定的数组，
使用<code>Array.prototype.reverse()</code>来反转它，
使用<code>Array.prototype.forEach()/<code>迭代反向数组。

<samp>
``` JAVASCRIPT
const forEachRight = (arr, callback) =>
  arr
    .slice(0)
    .reverse()
    .forEach(callback);
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
forEachRight([1, 2, 3, 4], val => console.log(val)); // '4', '3', '2', '1'
``` 
</samp>

### indexOfAll

返回数组中val的所有索引。 如果val不存在，则返回[]。
使用<code>Array.prototype.reduce()</code>循环元素并存储匹配元素的索引，返回索引数组。

<samp>
``` JAVASCRIPT
const indexOfAll = (arr, val) =>
arr.reduce((acc, el, i) => (el === val ? [...acc, i] : acc), []);
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
indexOfAll([1, 2, 3, 1, 2, 3], 1); // [0,3]
indexOfAll([1, 2, 3], 4); // []
``` 
</samp>

### initialize2DArray

初始化给定宽度和高度的2D数组。
使用<code>Array.prototype.map()</code>生成<code>h</code>行，其中每个行都是一个大小为<code>w</code>的初始化的新数组。 如果<code>val</code>未传值，则默认为null。

<samp>
``` JAVASCRIPT
const initialize2DArray = (w, h, val = null) =>
  Array.from({ length: h }).map(() => Array.from({ length: w }).fill(val));
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
initialize2DArray(2, 2, 0); // [[0,0], [0,0]]
initialize2DArray(1, 2); // [[null], [null]]
``` 
</samp>


### initializeArrayWithValues

使用指定的值初始化并填充数组。
使用<code>Array(n)</code>创建所需长度的数组，<code>fill(v)</code>填充。 如果<code>val</code>未传，默认值为0。

<samp>
``` JAVASCRIPT
const initializeArrayWithValues = (n, val = 0) => Array(n).fill(val);
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
initializeArrayWithValues(5, 2); // [2, 2, 2, 2, 2]
``` 
</samp>

### mapObject

使用函数将数组的值映射到对象，其中键 - 值对由原始值作为键和映射值组成。
使用匿名内部函数作用域来声明未定义的内存空间，使用闭包来存储返回值。 
使用新数组来存储数组，其中包含函数的数据集，并使用逗号运算符返回第二步，
而无需从一个上下文移动到另一个上下文（由于闭包和操作顺序）。

<samp>
``` JAVASCRIPT
const mapObject = (arr, fn) =>
  (a => (
    (a = [arr, arr.map(fn)]), 
    a[0].reduce((acc, val, ind) => ((acc[val] = a[1][ind]), acc), {})
  ))();
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
const squareIt = arr => mapObject(arr, a => a * a);
squareIt([1, 2, 3]); // { 1: 1, 2: 4, 3: 9 }
``` 
</samp>


### similarity

返回两个数组中都出现的元素数组。
使用<code>Array.prototype.filter()</code>过滤不属于数组的值，使用<code>Array.prototype.includes</code>判断。

<samp>
``` JAVASCRIPT
const similarity = (arr, values) => arr.filter(v => values.includes(v));
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
similarity([1, 2, 3], [1, 2, 4]); // [1, 2]
``` 
</samp>

### union

返回两个数组中任何一个中只存在一次元素的数组。

使用<code>...</code>a和b的所有值创建一个Set并用<code>Array.from()</code>转换为数组。

<samp>
``` JAVASCRIPT
const union = (a, b) => Array.from(new Set([...a, ...b]));
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
union([1, 2, 3], [4, 3, 2]); // [1,2,3,4]
``` 
</samp>


## 🌐 Browser

### detectDeviceType

检测网站是否在移动设备或台式机/笔记本电脑中打开。
使用正则表达式测试<code>navigator.userAgent</code>属性，以确定设备是移动设备还是台式机/笔记本电脑。

<samp>
``` JAVASCRIPT
const detectDeviceType = () =>
  /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test
  (navigator.userAgent)
  ? 'Mobile'
  : 'Desktop';
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
detectDeviceType();  // Desktop
``` 
</samp>

### elementContains

如果父元素包含子元素，则返回<code>true</code>，否则返回<code>false</code>。
先检查父元素与子元素不是同一元素，再使用<code>parent.contains(child)</code>检查父元素是否包含子元素。

<samp>
``` JAVASCRIPT
const elementContains = (parent, child) => 
parent !== child && parent.contains(child);
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
_query (tag){
  return document.querySelector(tag)
}
elementContains(_query('head'),  _query('title'));  // true
elementContains(_query('body'),  _query('body')); // false
``` 
</samp>

### getScrollPosition

返回当前页面的滚动位置。
如果已定义，则使用<code>pageXOffset</code>和<code>pageYOffset</code>，否则使用<code>scrollLeft</code>和<code>scrollTop</code>。 您可以省略<code>el</code>以使用窗口的默认值。

<samp>
``` JAVASCRIPT
const getScrollPosition = (el = window) => ({
  x: el.pageXOffset !== undefined ? el.pageXOffset : el.scrollLeft,
  y: el.pageYOffset !== undefined ? el.pageYOffset : el.scrollTop
});
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
getScrollPosition(); // {x: 0, y: 200}
``` 
</samp>

### getStyle

返回指定元素的CSS规则的值。
使用<code>Window.getComputedStyle()</code>获取指定元素的CSS规则的值。

<samp>
``` JAVASCRIPT
const getStyle = (el, ruleName) => getComputedStyle(el)[ruleName];
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
getStyle(document.querySelector('p'), 'font-size'); // '16px'
``` 
</samp>

### hasClass

如果元素具有指定的类，则返回<code>true</code>，否则返回<code>false</code>。
使用<code>element.classList.contains()</code>检查元素是否具有指定的类。

<samp>
``` JAVASCRIPT
const hasClass = (el, className) => el.classList.contains(className);
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
hasClass(document.querySelector('p.special'), 'special'); // true
``` 
</samp>

## ⏱️ Date

### formatDuration

返回给定毫秒数的可读格式。

将<code>ms</code>除以适当的值，以获得白天，小时，分钟，秒和毫秒的可读值。
使用 <code>Object.entries()<code>和<code>Array.prototype.filter()<code>仅保留非零值。
使用<code>Array.prototype.map()<code>为每个值创建字符串。 
使用<code>String.prototype.join(',')<code>将值组合成一个字符串。

<samp>
``` JAVASCRIPT
const formatDuration = ms => {
  if (ms < 0) ms = -ms;
  const time = {
    day: Math.floor(ms / 86400000),
    hour: Math.floor(ms / 3600000) % 24,
    minute: Math.floor(ms / 60000) % 60,
    second: Math.floor(ms / 1000) % 60,
    millisecond: Math.floor(ms) % 1000
  };
  return Object.entries(time)
    .filter(val => val[1] !== 0)
    .map(([key, val]) => `${val} ${key}${val !== 1 ? 's' : ''}`)
    .join(', ');
};
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
formatDuration(1001); // '1 second, 1 millisecond'
formatDuration(34325055574); 
// '397 days, 6 hours, 44 minutes, 15 seconds, 574 milliseconds'
``` 
</samp>

## 🎛️ Function
## ➗ Math
## 🗃️ Object
## 📜 String
## 📃 Type
## 🔧 Utility
