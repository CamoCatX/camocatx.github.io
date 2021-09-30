---
layout: page
title: Archive
---

<section>
  {% if site.categories.blog[0] %}

    {% capture currentyear %}{{ 'now' | date: "%Y" }}{% endcapture %}
    {% capture firstpostyear %}{{ site.categories.blog[0].date | date: '%Y' }}{% endcapture %}
    {% if currentyear == firstpostyear %}
        <h3>This year's posts</h3>
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
          </li>
        </ul>
    {% endfor %}


  {% endif %}
</section>
