---
layout: page
title: Blog
---

![](/blog/assets/poison3.png)

Here I talk about anything that I like, mostly technical topics I hope! :)

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
      {% unless post.next %}
      {% else %}
        {% capture year %}{{ post.date | date: '%Y' }}{% endcapture %}
        {% capture nyear %}{{ post.next.date | date: '%Y' }}{% endcapture %}
        {% if year != nyear %}
          <h3>{{ post.date | date: '%Y' }}</h3>
        {% endif %}
      {% endunless %}
        <ul>
          <li><time>{{ post.date | date:"%d %b" }} - </time>
            <a href="{{ post.url | prepend: site.baseurl | replace: '//', '/' }}">
              {{ post.title }}
            </a>
            <span class="postitem">
              <span class="icon-small">{% include icon-tag.svg %}</span>
              {% for tag in post.tags %}
                <code class="posttag"><category>{{ tag | xml_escape }}</category></code>
              {% endfor %}
            </span>
          </li>
        </ul>
    {% endfor %}


  {% endif %}
</section>
