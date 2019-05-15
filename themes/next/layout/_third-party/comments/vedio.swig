
<script>
 // document.addEventListener('touchmove', function(e) {
 //    e.preventDefault()
 //  })
  var c = document.getElementsByTagName('canvas')[0],
    x = c.getContext('2d'),
    pr = window.devicePixelRatio || 1,
    w = window.innerWidth - 10,
    h = window.innerHeight,
    f = 90,
    q,
    r = 0,
    u = Math.PI * 2,
    v = Math.cos,
    z = Math.random
  c.width = w * pr
  c.height = h * pr
  x.scale(pr, pr)
  x.globalAlpha = 0.6
  function i() {
    x.clearRect(0, 0, w, h)
    q = [{ x: 0, y: h * .7 + f }, { x: 0, y: h * .7 - f }]
    while (q[1].x < w + f) d(q[0], q[1])
  }
  function d(i, j) {
    x.beginPath()
    x.moveTo(i.x, i.y)
    x.lineTo(j.x, j.y)
    var k = j.x + (z() * 2 - 0.25) * f,
      n = y(j.y)
    x.lineTo(k, n)
    x.closePath()
    r -= u / -50
    x.fillStyle = '#' + (v(r) * 127 + 128 << 16 | v(r + u / 3) * 127 + 128 << 8 | v(r + u / 3 * 2) * 127 + 128).toString(16)
    x.fill()
    q[0] = q[1]
    q[1] = { x: k, y: n }
  }
  function y(p) {
    var t = p + (z() * 2 - 1.1) * f
    return (t > h || t < 0) ? y(p) : t
  }
  document.onclick = i
  document.ontouchstart = i
  i()

  // console.log

  // console.log("\n %c shamopoo  %c http://shamopoo.top/ \n\n","color: #ffc0cb; background: #c0cbff; padding:5px 0;","background: #ffc0cb; padding:5px 0;color:#fff;")
  // "use strict";
  //window.onload = function() {var now = new Date().getTime();var page_load_time = now - performance.timing.navigationStart;console.log('%c页面加载完毕消耗了'+Math.round(performance.now()*100)/100+'ms','color: #333;');};
  // 赞赏

  $('#post_end_1').click(function () {
      $('#post_end_1').css('display', 'none')
      $('#post_end_2').css('display', 'block')
      $('#QR').slideToggle(300)
  })
  $('#post_end_2').click(function () {
      $('#post_end_2').css('display', 'none')
      $('#post_end_1').css('display', 'block')
      $('#QR').slideToggle(300)
  })

   // title


   let isPageOne = window.location.pathname.indexOf('page') > -1
   isPageOne &&  $('.set-top').css('display', 'none')

   // console.img

   // aplayer
  //  	$.ajax({
  //  	    url: "https://api.i-meto.com/meting/api?server=netease&type=playlist&id=106590235",
  //  	    success: function(e) {
  //  	        var aplayerList = new APlayer({
  //  	        container: document.getElementById('aplayer-fixed'),
  //            fixed: true,
  //            lrcType: 3,
  //            order: 'random',
  //  	        listmaxheight: '240px',
  //  	        audio:JSON.parse(e)
  //  	        });
  //  	    }
  //  	})


   // lab - none - svg
   var i = 0,
     j = 0,
     p = 0,
     time = 0,
     $path = $('path, text'),
     lastNow = null,
     color = [73, 73, 80,1],
     fromColor = [50,70,100,0],
     // toColor = [0,220,255,1],
     toColor = [122,122,133,1],
     dashOffset = 0,
     dashArray = [0,100];

   function loop(now) {

   if (lastNow === null)
     lastNow = now;

   $path.each(function(index, list){

     time = now + index * 1000;
     i = (Math.sin(time * 0.00075) + 1) * 50;

     p = i / 100;
     for (j = 0; j < color.length; j++) {
       if (j != 3) {
         color[j] = fromColor[j] + Math.round((toColor[j] - fromColor[j]) * p);
       } else {
         color[j] = fromColor[j] + ((toColor[j] - fromColor[j]) * p);
       }
     }

     dashArray[0] = i;
     dashArray[1] = (100 - i);
     dashOffset = i * 2;

     if (this.localName === 'path') {
       $(this)
         .attr('stroke', 'rgba(' + color.join(',') + ')')
         .attr('stroke-dasharray', dashArray.join(','))
         .attr('stroke-dashoffset', dashOffset);
     } else {
       $(this)
         .attr('stroke', 'rgba(255,255,255,' + color[3] + ')')
         .attr('stroke-dasharray', dashArray.join(','))
         .attr('stroke-dashoffset', dashOffset);
     }

   });

   requestAnimationFrame(loop);

   }

   loop();

   // 侧边栏开关
     $(window).scroll(function () {
        ($(this).scrollTop() > 150) ? $('.sidebar-toggle').addClass('cd-is-toggle') : $('.sidebar-toggle').removeClass('cd-is-toggle');
     })
   // 友人帐
   $(".front-btn").click(function() {
     $(".flipper").css("transform", "rotateY(180deg)")
   })
   $(".back-btn").click(function() {
     $(".flipper").css("transform", "rotateY(360deg)")
   })
   // 浏览器上下滑
    
   // title
   $(".banner-border-top").animate({'margin-left': '0px'},900)
   $(".banner-border-bottom").animate({'margin-left': '0px'},900)

   // moblie header
  $('.site-nav-toggle button').on('click', function () {
      var  sideDom = $('.site-nav')[0]
        if (!parseInt(sideDom.style.height))  {
            sideDom.style.height = '380px'
        } else {
            sideDom.style.height = '0px'
        }
   });

  
</script>
