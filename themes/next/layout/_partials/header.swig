<div class="site-brand-wrapper">
  <nav class="site-nav">
    {% set hasSearch = theme.swiftype_key || theme.algolia_search.enable || theme.tinysou_Key || theme.local_search.enable %}

    {% if theme.menu %}
      <ul id="menu" class="menu">
        {% for name, path in theme.menu %}
          {% set itemName = name.toLowerCase() %}
          <li class="menu-item menu-item-{{ itemName | replace(' ', '-') }}">
            <a href="{{ url_for(path.split('||')[0]) | trim }}" rel="section">
              {% if theme.menu_icons.enable %}
                <i class="menu-item-icon fa fa-fw fa-{{ path.split('||')[1] | trim | default('question-circle') }}"></i>
              {% endif %}
              {{ __('menu.' + name) | replace('menu.', '') }}
            </a>
          </li>
        {% endfor %}
      </ul>
    {% endif %}
  </nav>
  <div class="site-meta {% if theme.custom_logo.enabled %}custom-logo{% endif %}">
    {% if theme.custom_logo.image and theme.scheme === 'Muse' %}
      <div class="site-meta-headline">
        <a>
          <img class="custom-logo-image" src="{{ theme.custom_logo.image }}"
               alt="{{ config.title }}"/>
        </a>
      </div>
    {% endif %}
    <div class="custom-logo-site-title">
      <div class="banner-border-top"></div>
      <a href="{{ config.root }}"  class="brand" rel="start">
        <span class="logo-line-before"><i></i></span>
        <span class="site-title">hi, shamopoo</span>
        <div class="site-sub-title">出生真好，真的很好，和你遇见真的很好。<br> 我是风，正包围在你的身边。</div>
        <span class="logo-line-after"><i></i></span>
      </a>
      <div class="banner-border-bottom"></div>
    </div>
  </div>
  <div class="site-nav-toggle">
    <div class="nav-content">
      <button>
        <span class="btn-bar"></span>
        <span class="btn-bar"></span>
        <span class="btn-bar"></span>
      </button>
      <p class="mov-title declara">
        <a href="https://blog.shamopoo.top">hi,shamopoo</a>
      </p>
    </div>
  </div>
</div>



{% include '../_custom/header.swig' %}
