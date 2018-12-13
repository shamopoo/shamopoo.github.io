<div class="footer-image"></div>
<div class="copyright">
  {##}
  {% set current = date(Date.now(), "YYYY") %}{##}&copy;
  {% if theme.footer.since and theme.footer.since != current %}{{ theme.footer.since }} &mdash; {% endif %}{##}
    <span itemprop="copyrightYear">{{ current }}</span>
    <span class="with-love">
      <i class="fa fa-heart"></i>
    </span>
    <span class="author" itemprop="copyrightHolder">{{ theme.footer.copyright || config.author }}</span>

    {% if theme.post_wordcount.totalcount %}
      <span class="post-meta-divider">|</span>
      <span class="post-meta-item-icon">
        <i class="fa fa-area-chart"></i>
      </span>
      {% if theme.post_wordcount.item_text %}
        <span class="post-meta-item-text">{{ __('post.totalcount') }}&#58;</span>
      {% endif %}
      <span title="{{ __('post.totalcount') }}">{#
      #}{{ totalcount(site, '0,0.0a') }}{#
    #}</span>
    {% endif %}
</div>

{% if theme.footer.theme.enable %}
<div class="footer-yiyan">念念不忘, 必有回响。</div>
{% endif %}

<div class="copyright time_div">
博客已萌萌哒运行<span id="show"></span><span class="my-face_x">(●'◡'●)ﾉ<i class="fa fa-heart"></i></span>
<script>
window.onload = function() {
    var show = document.getElementById("show");
    setInterval(function() {
    var BirthDay = new Date('2018-03-05');
    var today = new Date();
    var timeold = (today.getTime() - BirthDay.getTime());
    var msPerDay = 24 * 60 * 60 * 1000;
    var e_daysold = timeold / msPerDay;
    var daysold = Math.floor(e_daysold);
    var e_hrsold = (e_daysold - daysold) * 24;
    var hrsold = Math.floor(e_hrsold);
    var e_minsold = (e_hrsold - hrsold) * 60;
    var minsold = Math.floor((e_hrsold - hrsold) * 60);
    var seconds = Math.floor((e_minsold - minsold) * 60);
    var t = daysold + "天" + hrsold + "小时" + minsold + "分" + seconds + "秒"
    show.innerHTML = t;
    }, 1000);
};
</script>
</div>

{% if theme.footer.custom_text %}
  <div class="footer-custom">{#
  #}{{ theme.footer.custom_text }}{#
#}</div>
{% endif %}

{% include 'head/meting.swig' %}
