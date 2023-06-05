---
layout: page
title: Contact
image: /assets/ninja2.jpg
robots: noindex,nofollow
---

![](/assets/ninja2.jpg)


{% if site.social.email %}
  - Email: <a href="mailto:{{ site.social.email }}"><span>{{ site.social.email }}</span></a> {% if site.social.email2 %}or <a href="mailto:{{ site.social.email2 }}"><span>{{ site.social.email2 }}</span></a>{% endif %}
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

<!--{% if site.social.wickrme %}
  - Wickr Me: {{ site.social.wickrme }}
{% endif %}-->

{% if site.social.twitter %}
  - Twitter: <a href="https://twitter.com/{{ site.social.twitter }}"><span>@{{ site.social.twitter }}</span></a>
{% endif %}

{% if site.social.linkedin %}
  - LinkedIn: <a href="https://linkedin.com/in/{{ site.social.linkedin }}"><span>{{ site.social.linkedin }}</span></a>
{% endif %}

{% if site.social.tellonym %}
  - Send Anonymous Message: <a href="https://tellonym.me/{{ site.social.tellonym }}"><span>@{{ site.social.tellonym | replace: "_", "\_" }}</span></a>
{% endif %}

<!--{% if site.social.github %}
  - Github: <a href="https://github.com/{{ site.social.github }}"><span>{{ site.social.github }}</span></a>
{% endif %}-->