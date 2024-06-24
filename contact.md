---
layout: page
title: Contact
robots: noindex,nofollow
---

{% if site.social.email %}

- Email: <span class="email">camocatx@proton<b>.proton</b>.me</span>

  
{% endif %}


{% if site.social.github %}
  - GitHub: <a href="https://github.com/{{ site.social.github }}"><span>{{ site.social.github }}</span></a>
{% endif %}


{% if site.social.discorduser %}
- Discord:
  {% if site.social.discorduser %}
  - User: {{ site.social.discorduser }}
  {% endif %}

<iframe src="https://discord.com/widget?id=1254936016582737950&theme=dark" width="350" height="500" allowtransparency="true" frameborder="0" sandbox="allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts"></iframe>
