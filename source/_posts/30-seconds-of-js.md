---
title: ⏱️ 30 seconds of code
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

栗子：

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

栗子：

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

栗子：

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

栗子：

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

栗子：

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

栗子：

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

栗子：

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

栗子：

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

栗子：

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

栗子：

<samp>
``` JAVASCRIPT
countBy([6.1, 4.2, 6.3], Math.floor); // {4: 1, 6: 2}
countBy(['one', 'two', 'three'], 'length'); // {3: 2, 5: 1}
``` 
</samp>