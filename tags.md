---
layout: default
title: "Tags"
permalink: /tags/
---

<h2>Tags:</h2>

<ul>
  {% assign list = site.tags | sort %}
    {% for tag in list %}
      <li>
        <a href="#{{ tag[0] | replace: " " , "-" | downcase }}">
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
{% assign taglist = site.tags | sort %}
{% for tag in taglist %}
  <div class="tags" id="{{ tag[0] | replace: " " , "-" | downcase }}">{{ tag[0] }}</div>
  <ul>
    {% assign list = tag[1] %}  
    {% for post in list %}
      <li>
  <time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date_to_long_string }}</time>
        <a href="/{{ post.categories[0] | xml_escape | downcase }}/" class="no-decoration">{{ post.categories[0] | xml_escape | capitalize }}</a>
        <a href="{{ post.url }}">{{ post.title }}</a>
        {% if post.tags[0] %}
              <span class="postitem">
                {% for tag in post.tags %}
                  <code class="posttag"><a href="/tags/#{{ tag | replace: " " , "-" | downcase }}" class="no-decoration">{{ tag | xml_escape }}</a></code>
                {% endfor %}
              </span>
            {% endif %}
      </li>
    {% endfor %}
    {% assign pages_list = nil %}
    {% assign group = nil %}
  </ul>
{% endfor %}
<br>
{% assign taglist = nil %}
