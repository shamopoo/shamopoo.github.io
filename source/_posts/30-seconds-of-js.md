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

创建一个最多可以接受<code>n</code>个参数的函数。
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

### debounce

<samp>
``` JAVASCRIPT
const debounce = (fn, ms = 0) => {
  let timeoutId;
  return function(...args) {
    clearTimeout(timeoutId);
    timeoutId = setTimeout(() => fn.apply(this, args), ms);
  };
};
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
window.addEventListener(
  'resize',
  debounce(() => {
    console.log(window.innerWidth);
    console.log(window.innerHeight);
  }, 250)
); // Will log the window dimensions at most every 250ms
``` 
</samp>

### throttle

<samp>
``` JAVASCRIPT
const throttle = (fn, wait) => {
  let inThrottle, lastFn, lastTime;
  return function() {
    const context = this,
      args = arguments;
    if (!inThrottle) {
      fn.apply(context, args);
      lastTime = Date.now();
      inThrottle = true;
    } else {
      clearTimeout(lastFn);
      lastFn = setTimeout(function() {
        if (Date.now() - lastTime >= wait) {
          fn.apply(context, args);
          lastTime = Date.now();
        }
      }, Math.max(wait - (Date.now() - lastTime), 0));
    }
  };
};
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
window.addEventListener(
  'resize',
  throttle(function(evt) {
    console.log(window.innerWidth);
    console.log(window.innerHeight);
  }, 250)
); // Will log the window dimensions at most every 250ms
``` 
</samp>

## ➗ Math

### distance

返回两点之间的距离。
使用<code>Math.hypot()</code>计算两点之间的欧几里德距离。

<samp>
``` JAVASCRIPT
const distance = (x0, y0, x1, y1) => Math.hypot(x1 - x0, y1 - y0);
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
distance(1, 1, 2, 3); // 2.23606797749979
``` 
</samp>

### factorial



使用递归计算数字的阶乘。
如果<code>n</code>小于或等于1，则返回1。否则，返回<code>n</code>的乘积和<code>n  -  1</code>的阶乘。如果<code>n</code>是负数，则抛出异常。

<samp>
``` JAVASCRIPT
const factorial = n =>
  n < 0
    ? (() => {
      throw new TypeError('Negative numbers are not allowed!');
    })()
    : n <= 1
      ? 1
      : n * factorial(n - 1);
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
factorial(6); // 720
``` 
</samp>

### gcd

计算两个或多个数字/数组之间的最大公约数。
内部<code>_gcd</code>函数使用递归计算返回<code>y</code>的<code>GCD</code>和除法<code>x / y</code>的余数。

<samp>
``` JAVASCRIPT
const gcd = (...arr) => {
  const _gcd = (x, y) => (!y ? x : gcd(y, x % y));
  return [...arr].reduce((a, b) => _gcd(a, b));
};
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
gcd(8, 36); // 4
gcd(...[12, 8, 32]); // 4
``` 
</samp>


### randomIntArrayInRange

返回指定范围内的n个随机整数的数组。
使用<code>Array.from()</code>创建一个特定长度的数组，<code>Math.random()</code>生成一个范围内的随机数，使用<code>Math.floor</code>向下取整。

<samp>
``` JAVASCRIPT
const randomIntArrayInRange = (min, max, n = 1) =>
  Array.from({ length: n }, () => 
  Math.floor(Math.random() * (max - min + 1)) + min);
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
randomIntArrayInRange(12, 35, 10); // [ 34, 14, 27, 17, 30, 27, 20, 26, 21, 14 ]
``` 
</samp>


### sum

返回数组的总和。
使用<code>Array.prototype.reduce()</code>将每个值累加，使用值0初始化。

<samp>
``` JAVASCRIPT
const sum = (...arr) => [...arr].reduce((acc, val) => acc + val, 0);
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
sum(1, 2, 3, 4); // 10
sum(...[1, 2, 3, 4]); // 10
``` 
</samp>

## 🗃️ Object

### deepClone

创建对象的深克隆。
使用<code>Object.assign()</code>和空对象<code>({})</code>创建原始的浅层克隆。
使用<code>Object.keys()</code>和<code>Array.prototype.forEach()</code>来确定需要深度克隆的键值对。

<samp>
``` JAVASCRIPT
const deepClone = obj => {
  let clone = Object.assign({}, obj);
  Object.keys(clone).forEach(
    key => (clone[key] = typeof obj[key] === 'object'
     ? deepClone(obj[key]) 
     : obj[key])
  );
  return Array.isArray(obj) 
  ? (clone.length = obj.length) && Array.from(clone) 
  : clone;
};
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
const a = { foo: 'bar', obj: { a: 1, b: 2 } };
const b = deepClone(a); // a !== b, a.obj !== b.obj
``` 
</samp>

### flattenObject

展平对象。
使用<code>Object.keys(obj)</code>与<code>Array.prototype.reduce()</code>结合将每个叶节点转换为展平路径节点。

<samp>
``` JAVASCRIPT
const flattenObject = (obj, prefix = '') =>
  Object.keys(obj).reduce((acc, k) => {
    const pre = prefix.length ? prefix + '.' : '';
    if (typeof obj[k] === 'object') {
    Object.assign(acc, flattenObject(obj[k], pre + k))
    };
    else acc[pre + k] = obj[k];
    return acc;
  }, {});
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
flattenObject({ a: { b: { c: 1 } }, d: 1 }); // { 'a.b.c': 1, d: 1 }
``` 
</samp>


### mapKeys


创建一个对象，其中包含通过为每个键运行提供的函数生成的键以及与提供的对象相同的值。
使用<code>Object.keys(obj)</code>迭代对象的键。 
使用</code>Array.prototype.reduce()</code>使用<code>fn</code>创建具有相同值和映射键的新对象。

<samp>
``` JAVASCRIPT
const mapKeys = (obj, fn) =>
  Object.keys(obj).reduce((acc, k) => {
    acc[fn(obj[k], k, obj)] = obj[k];
    return acc;
  }, {});
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
mapKeys({ a: 1, b: 2 }, (val, key) => key + val); // { a1: 1, b2: 2 }
``` 
</samp>


### mapValues

使用与提供的对象相同的键创建对象，并通过为每个值运行提供的函数生成值。
使用<code>Object.keys(obj)</code>迭代对象的键。
使用<code>Array.prototype.reduce()</code>。
使用<code>fn</code>创建具有相同键和映射值的新对象。

<samp>
``` JAVASCRIPT
const mapValues = (obj, fn) =>
  Object.keys(obj).reduce((acc, k) => {
    acc[k] = fn(obj[k], k, obj);
    return acc;
  }, {});
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
const users = {
  fred: { user: 'fred', age: 40 },
  pebbles: { user: 'pebbles', age: 1 }
};
mapValues(users, u => u.age); // { fred: 40, pebbles: 1 }
``` 
</samp>

### objectFromPairs

根据给定的键值对创建对象。
使用<code>Array.prototype.reduce()</code>创建对象。

<samp>
``` JAVASCRIPT
const objectFromPairs = arr => 
arr.reduce((a, [key, val]) => ((a[key] = val), a), {});
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
objectFromPairs([['a', 1], ['b', 2]]); // {a: 1, b: 2}
``` 
</samp>

### objectToPairs

从对象创建键值对数组的数组。
使用<code>Object.keys()</code>和<code>Array.prototype.map()</code>迭代对象的键并生成数组。

<samp>
``` JAVASCRIPT
const objectToPairs = obj => Object.keys(obj).map(k => [k, obj[k]]);
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
objectToPairs({ a: 1, b: 2 }); // [ ['a', 1], ['b', 2] ]
``` 
</samp>

## 📜 String

### fromCamelCase

转换字符串。
使用<code>String.prototype.replace()</code>删除下划线，连字符和空格，并将单词转换为<code>camelcase</code>。 省略第二个参数以使用<code>_</code>的默认分隔符。

<samp>
``` JAVASCRIPT
const fromCamelCase = (str, separator = '_') =>
  str
    .replace(/([a-z\d])([A-Z])/g, '$1' + separator + '$2')
    .replace(/([A-Z]+)([A-Z][a-z\d]+)/g, '$1' + separator + '$2')
    .toLowerCase();
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
fromCamelCase('someDatabaseFieldName', ' '); 
// 'some database field name'
fromCamelCase('someLabelThatNeedsToBeCamelized', '-'); 
// 'some-label-that-needs-to-be-camelized'
fromCamelCase('someJavascriptProperty', '_'); 
// 'some_javascript_property'
``` 
</samp>


### isAnagram

检查字符串是否是另一个字符串的字谜。
使用<code>String.toLowerCase()</code>和<code>String.prototype.replace()</code>删除不必要的字符。
使用<code>String.prototype.split('')</code>和<code>Array.prototype.sort()</code>和<code>Array.prototype.join('')</code>检查是否相等。

<samp>
``` JAVASCRIPT
const isAnagram = (str1, str2) => {
  const normalize = str =>
    str
      .toLowerCase()
      .replace(/[^a-z0-9]/gi, '')
      .split('')
      .sort()
      .join('');
  return normalize(str1) === normalize(str2);
};
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
isAnagram('iceman', 'cinema'); // true
``` 
</samp>


### mask

使用指定的掩码字符替换除最后一个字符数之外的所有字符。
使用<code>String.prototype.slice()</code>来获取将保持未屏蔽的字符部分。
使用<code>String.padStart()</code>以掩码字符填充字符串的开头，直到原始长度。

<samp>
``` JAVASCRIPT
const mask = (cc, num = 4, mask = '*') => 
`${cc}`.slice(-num).padStart(`${cc}`.length, mask);
};
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
mask(1234567890); // '******7890'
mask(1234567890, 3); // '*******890'
mask(1234567890, -4, '$'); // '$$$$567890'
``` 
</samp>

### reverseString

反转字符串。
使用展开运算符<code>(...)</code>和</code>Array.prototype.reverse()</code>来反转字符串中字符的顺序。
使用<code>String.prototype.join('')</code>转换成字符串。

<samp>
``` JAVASCRIPT
const reverseString = str => [...str].reverse().join('');
};
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
reverseString('foobar'); // 'raboof'
``` 
</samp>


### stripHTMLTags

从字符串中删除<code>HTML / XML</code>标记。
使用正则表达式从字符串中删除<code>HTML / XML</code>标记。

<samp>
``` JAVASCRIPT
const stripHTMLTags = str => str.replace(/<[^>]*>/g, '');
};
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
stripHTMLTags('<p><em>lorem</em> <em>ipsum</em></p>'); 
// 'lorem ipsum'
``` 
</samp>

### toKebabCase

字符串转换为烤肉串案例。
将字符串分解为单词并将它们组合添加<code> - </code>使用正则表达式作为分隔符。

<samp>
``` JAVASCRIPT
const toKebabCase = str =>
  str &&
  str
    .match(/[A-Z]{2,}(?=[A-Z][a-z]+[0-9]*|\b)|[A-Z]?[a-z]+[0-9]*|[A-Z]|[0-9]+/g)
    .map(x => x.toLowerCase())
    .join('-');
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
toKebabCase('camelCase'); // 'camel-case'
toKebabCase('some text'); // 'some-text'
toKebabCase('some-mixed_string With spaces_underscores-and-hyphens'); 
// 'some-mixed-string-with-spaces-underscores-and-hyphens'
toKebabCase('AllThe-small Things'); 
// "all-the-small-things"
toKebabCase('IAmListeningToFMWhileLoadingDifferentURLOnMyBrowser'); 
// "i-am-listening-to-fm-while-loading-different-url-on-my-browser"
``` 
</samp>


### words

将给定的字符串转换为单词数组。
使用<code>String.prototype.split()</code>与默认为非字母作为正则使用，以转换为字符串数组。 
使用<code>Array.prototype.filter()</code>删除任何空字符串。 默认的正则为<code>/[^a-zA-Z-]+/</code>。

<samp>
``` JAVASCRIPT
const words = (str, pattern = /[^a-zA-Z-]+/) => 
str.split(pattern).filter(Boolean);
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
words('I love javaScript!!'); // ["I", "love", "javaScript"]
words('python, javaScript & coffee'); // ["python", "javaScript", "coffee"]
``` 
</samp>

## 🔧 Utility

### RGBToHex

将<code>RGB</code>值转换为颜色代码。
使用按位左移运算符<code>(<<)</code>和<code>toString(16)</code>。
使用<code>String.padStart(6，'0')</code>将RGB参数转换为十六进制字符串，以获得6位十六进制值。

<samp>
``` JAVASCRIPT
const RGBToHex = (r, g, b) =>
((r << 16) + (g << 8) + b).toString(16).padStart(6, '0');
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
RGBToHex(255, 165, 1); // 'ffa501'
``` 
</samp>

### toDecimalMarkc

使用<code>toLocaleString()</code>将浮点运算转换为Decimal标记形式——使用逗号分隔字符串与数字。

<samp>
``` JAVASCRIPT
const toDecimalMark = num => num.toLocaleString('en-US');
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
toDecimalMark(12305030388.9087); // "12,305,030,388.909"
``` 
</samp>


### validateNumber

如果给定值是数字，则返回true，否则返回false。
使用<code>!isNaN()</code>与<code>parseFloat()</code>判断参数是否为数字。 
使用<code>isFinite()</code>判断数字是否有限数字。 
使用<code>Number()</code>判断类型是否为数字。

<samp>
``` JAVASCRIPT
const validateNumber = n => 
!isNaN(parseFloat(n)) && isFinite(n) && Number(n) == n;
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
validateNumber('10'); // true
``` 
</samp>


### yesNo

如果字符串是<code>y / yes</code>则返回<code>true</code>，如果字符串是<code>n / no</code>，则返回<code>false</code>。
使用<code>RegExp.test()</code>检查字符串是否为<code>y / yes</code>或<code>n / no</code>。 <code>def</code>默认为no。

<samp>
``` JAVASCRIPT
const yesNo = (val, def = false) =>
  /^(y|yes)$/i.test(val) ? true : /^(n|no)$/i.test(val) ? false : def;
``` 
</samp>

🌰栗子：

<samp>
``` JAVASCRIPT
yesNo('Y'); // true
yesNo('yes'); // true
yesNo('No'); // false
yesNo('Foo', true); // true
``` 
</samp>
