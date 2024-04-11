---
layout: page
title: Contact
robots: noindex,nofollow
---

{% if site.social.email %}

- Email: <a href="mailto:{{ site.social.email | mailObfuscate }}"><span>{{ site.social.email }}</span></a>
- Email: <span class="email">camocatx@proton<b>.proton</b>.me</span>

  
{% endif %}


{% if site.social.github %}
  - GitHub: <a href="https://github.com/{{ site.social.github }}"><span>{{ site.social.github }}</span></a>
{% endif %}


{% if site.social.discordserver or site.social.discorduser %}

- Discord:
  {% if site.social.discorduser %}
  - User: {{ site.social.discorduser }}
  {% endif %}

  {% if site.social.discordserver %}
  - Server: <a href="https://discord.gg/{{ site.social.discordserver }}"><span>{{ site.social.discordservername }}</span></a>
  {% endif %}
{% endif %}
