---
layout: page
title: Blog
---

<br>

<br>
<section>
  {% if site.categories.blog[0] %}

    {% capture currentyear %}{{ 'now' | date: "%Y" }}{% endcapture %}
    {% capture firstpostyear %}{{ site.categories.blog[0].date | date: '%Y' }}{% endcapture %}
    {% if currentyear == firstpostyear %}
        <h3>This year's Posts</h3>
    {% else %}  
        <h3>{{ firstpostyear }}</h3>
    {% endif %}

    {%for post in site.categories.blog %}
      {% if post.previous_in_category %}
        {% capture year %}{{ post.date | date: '%Y' }}{% endcapture %}
        {% capture nyear %}{{ post.previous_in_category.date | date: '%Y' }}{% endcapture %}
        {% if year != nyear %}
          <h3>{{ post.date | date: '%Y' }}</h3>
        {% endif %}
      {% endif %}
        <ul>
          <li><time>{{ post.date | date:"%d %b" }} - </time>
            <a href="{{ post.url | prepend: site.baseurl | replace: '//', '/' }}">
              {{ post.title }}
            </a>
            {% if post.tags[0] %}
              <span class="postitem">
                {% for tag in post.tags %}
                  <code class="posttag"><a href="/tags/#{{ tag | replace: " " , "-" | downcase }}" class="no-decoration">{{ tag | xml_escape }}</a></code>
                {% endfor %}
              </span>
            {% endif %}
          </li>
        </ul>
    {% endfor %}
  {% endif %}
</section>

<br>
