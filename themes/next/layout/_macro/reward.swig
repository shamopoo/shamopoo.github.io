<div style="padding: 10px 0; margin: 20px auto; width: 90%; text-align: center;">
  <div>{{ theme.reward_comment }}</div>
  <img class="post-kanban nofancybox" id="post_end_1" src="https://phower.me/wp-content/themes/akina/images/post_end_1.png" >
  <img class="post-kanban nofancybox" id="post_end_2" src="https://phower.me/wp-content/themes/akina/images/post_end_2.png" style="display: none;" >
  <div id="QR" style="display: none;">
    {% if theme.wechatpay %}
      <div id="wechat" style= "display: inline-block">
        <img id="wechat_qr" src="{{ theme.wechatpay }}" alt="{{ theme.author }} {{ __('reward.wechatpay') }}"/>
        <p>{{ __('reward.wechatpay') }}</p>
      </div>
    {% endif %}

    {% if theme.alipay %}
      <div id="alipay" style="display: inline-block">
        <img id="alipay_qr" src="{{ theme.alipay }}" alt="{{ theme.author }} {{ __('reward.alipay') }}"/>
        <p>{{ __('reward.alipay') }}</p>
      </div>
    {% endif %}

    {% if theme.bitcoin %}
      <div id="bitcoin" style="display: inline-block">
        <img id="bitcoin_qr" src="{{ theme.bitcoin }}" alt="{{ theme.author }} {{ __('reward.bitcoin') }}"/>
        <p>{{ __('reward.bitcoin') }}</p>
      </div>
    {% endif %}

  </div>
</div>
