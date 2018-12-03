<!DOCTYPE html>

{% set html_class = 'theme-next ' + theme.scheme %}
{% if theme.motion.enable %}
  {% set html_class = html_class + ' use-motion' %}
{% endif %}

<html class="{{ html_class | lower }}" lang="{{ config.language }}">
<head>
  {% include '_partials/head.swig' %}
  <title>{% block title %}{% endblock %}</title>
  {% include '_third-party/analytics/index.swig' %}
</head>

<body itemscope itemtype="http://schema.org/WebPage" lang="{{ page.lang || page.language || config.language }}">
  <!--[if lt IE 8]>
    <div class="browsehappy" role="dialog">当前网页 <strong>不支持</strong> 你正在使用的浏览器. 为了正常的访问, 请 <a href="http://browsehappy.com/">升级你的浏览器</a>.</div>
  <![endif]-->
  {% set container_class = "container " %}
  {% if theme.sidebar.position %}
    {% set container_class = container_class + 'sidebar-position-' + theme.sidebar.position %}
  {% endif %}
  <canvas id="evanyou"></canvas>
  <div class="{{ container_class }} {% block page_class %}{% endblock %}">
    <header id="header" class="header" itemscope itemtype="http://schema.org/WPHeader">
        <div class="filter-dot"></div>
        <div class="header-inner">
           {%- include '_partials/header.swig' %}
        </div>
        <div class="meteor">
          <div class="red" style="left:600px;"></div>
          <div class="orange" style="left:700px;"></div>
          <div class="yellow" style="left:900px;">
          </div><div class="green" style="left:1100px;">
          </div><div class="cyan" style="left:1260px;"></div>
          <div class="blue" style="left:1400px;"></div>
          <div class="purple" style="left:1500px;"></div>
          <div class="red" style="left:0px;"></div>
          <div class="orange" style="left:100px;"></div>
          <div class="yellow" style="left:300px;"></div>
          <div class="green" style="left:500px;"></div>
          <div class="cyan" style="left:660px;"></div>
          <div class="blue" style="left:800px;"></div>
          <div class="purple" style="left:900px;"></div>
          <div class="red" style="left:1200px;"></div>
          <div class="orange" style="left:1300px;"></div>
          <div class="yellow" style="left:1500px;"></div>
          <div class="green" style="left:1700px;"></div>
          <div class="cyan" style="left:1860px;"></div>
          <div class="blue" style="left:2000px;"></div>
          <div class="purple" style="left:2100px;"></div>
        </div>
    </header>
    <main id="main" class="main">
      <div class="main-inner">
        <div class="content-wrap">
          <div id="content" class="content">
            {% block content %}{% endblock %}
          </div>
          {% include '_third-party/duoshuo-hot-articles.swig' %}
          {% include '_partials/comments.swig' %}
        </div>
        {% if theme.sidebar.display !== 'remove' %}
          {% block sidebar %}{% endblock %}
        {% endif %}
      </div>
    </main>
    <!-- aplayer -->
    <!-- <div id="aplayer-fixed"></div> -->
    <footer id="footer" class="footer">
      <div class="footer-inner">
        {% include '_partials/footer.swig' %}
        {% include '_third-party/analytics/analytics-with-widget.swig' %}
        {% block footer %}{% endblock %}
      </div>
    </footer>

    {% if not theme.sidebar.b2t %}
      <div class="back-to-top">
      </div>
    {% endif %}

    {% if theme.needmoreshare2.enable and theme.needmoreshare2.float.enable %}
      <div id="needsharebutton-float">
        <span class="btn">
          <i class="fa fa-share-alt" aria-hidden="true"></i>
        </span>
      </div>
    {% endif %}
  </div>

  {% include '_scripts/vendors.swig' %}
  {% include '_scripts/commons.swig' %}
  {% set scheme_script = '_scripts/schemes/' + theme.scheme | lower + '.swig' %}
  {% include scheme_script %}

  {% block script_extra %}{% endblock %}

  {% include '_scripts/boostrap.swig' %}

  {% include '_third-party/search/index.swig' %}
  {% include '_third-party/analytics/lean-analytics.swig' %}
  {% include '_third-party/analytics/firestore.swig' %}
  {% include '_third-party/seo/baidu-push.swig' %}
  {% include '_third-party/needsharebutton.swig' %}
  {% include '_third-party/rating.swig' %}
  {% include '_third-party/mathjax.swig' %}
  {% include '_third-party/scroll-cookie.swig' %}
  {% include '_third-party/exturl.swig' %}
  {% include '_custom/canvas.swig' %}
  {% include '_third-party/comments/index.swig' %}
</body>
</html>
