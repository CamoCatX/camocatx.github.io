---
layout: page
title: Contact
---

![](/assets/ninja2.jpg)

<ul>
  {% if site.social.email %}
    <li>
      Email: <a href="mailto:{{ site.social.email }}"><span>{{ site.social.email }}</span></a>
    </li>
  {% endif %}

  {% if site.social.twitter %}
    <li>
      Twitter: <a href="https://twitter.com/{{ site.social.twitter }}"><span>{{ site.social.twitter }}</span></a>
    </li>
  {% endif %}

  {% if site.social.linkedin %}
    <li>
      LinkedIn: <a href="https://linkedin.com/in/{{ site.social.linkedin }}"><span>{{ site.social.linkedin }}</span></a>
    </li>
  {% endif %}

  {% if site.social.discord %}
    <li>
      Discord: <a href="https://discord.gg/{{ site.social.discord }}"><span>{{ site.social.discordname }}</span></a>
    </li>
  {% endif %}

  {% if site.social.github %}
    <li>
      Github: <a href="https://github.com/{{ site.social.github }}"><span>{{ site.social.github }}</span></a>
    </li>
  {% endif %}
</ul>
