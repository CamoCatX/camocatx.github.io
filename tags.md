---
layout: default
title: "Tags List"
permalink: /tags/
---

<header>
    <h1>Tags List</h1>
</header>

<ul>
  {% assign list = site.tags | sort %}
    {% for tag in list %}
      <li>
        <a href="#{{ tag[0] }}">
          {{ tag[0] }}
        </a>
        <span>({{ tag[1].size }})</span>
      </li>
    {% endfor %}
  {% assign list = nil %}
</ul>
<br>
* * *
<br>
# Tags:
{% assign taglist = site.tags | sort %}
{% for tag in taglist %}
  <h2 id="{{ tag[0] }}">{{ tag[0] }}</h2>
  <ul>
    {% assign list = tag[1] %}  
    {% for post in list %}

      <li>
        <time>{{ post.date | date:"%d %b %Y" }} - </time>
        <a href="{{ post.url }}">{{ post.title }}</a>
      </li>
    {% endfor %}
    {% assign pages_list = nil %}
    {% assign group = nil %}
  </ul>
{% endfor %}
{% assign taglist = nil %}
