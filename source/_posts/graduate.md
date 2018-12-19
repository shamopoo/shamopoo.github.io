layout: '[layout]'
title: 毕业快乐！
tags:
  - 毕业
categories:
  - 日常簿
author: shamopoo
date: 2018-07-04 10:15:22
---
           
那一天， 我毕业了 !  
<!-- more -->

<div class="graduate-time" id="graduate-time"></div>
<script>
  (function() {
    var show = document.getElementById("graduate-time");
    setInterval(function() {
    var BirthDay = new Date('2018-07-04');
    var today = new Date();
    var timeold = (today.getTime() - BirthDay.getTime());
    var msPerDay = 24 * 60 * 60 * 1000 * 365;
    var e_yearsold = timeold / msPerDay;
    var yearsold = Math.floor(e_yearsold);
    var e_daysold = (e_yearsold - yearsold) * 365;
    var daysold = Math.floor(e_daysold);
    var e_hrsold = (e_daysold - daysold) * 24;
    var hrsold = Math.floor(e_hrsold);
    var e_minsold = (e_hrsold - hrsold) * 60;
    var minsold = Math.floor((e_hrsold - hrsold) * 60);
    var seconds = Math.floor((e_minsold - minsold) * 60);
    var t = '毕业' 
    + (yearsold + '').padStart(2, '0') + "年" 
    + (daysold + '').padStart(3, '0') + "天" 
    + (hrsold + '').padStart(2, '0') + "小时" 
    + (minsold + '').padStart(2, '0')  + "分" 
    + (seconds + '').padStart(2, '0') + "秒"
    show.innerHTML = t;
    }, 1000)
}());
</script>
</script>
