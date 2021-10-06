---
layout: page
title: Links
---

[<img src="/links/assets/earth-icon.png">](http://www.iconka.com/)

Here I share with you www links that I find interesting:

<br>
<section>
  {% if site.categories.links[0] %}

    {% capture currentyear %}{{ 'now' | date: "%Y" }}{% endcapture %}
    {% capture firstpostyear %}{{ site.categories.links[0].date | date: '%Y' }}{% endcapture %}
    {% if currentyear == firstpostyear %}
        <h3>This year's Links</h3>
    {% else %}
        <h3>{{ firstpostyear }}</h3>
    {% endif %}

    {%for link in site.categories.links %}
      {% unless link.next %}
      {% else %}
        {% capture year %}{{ link.date | date: '%Y' }}{% endcapture %}
        {% capture nyear %}{{ link.next.date | date: '%Y' }}{% endcapture %}
        {% if year != nyear %}
          <h3>{{ link.date | date: '%Y' }}</h3>
        {% endif %}
      {% endunless %}
        <ul>
          <li><time>{{ link.date | date:"%d %b" }} - </time>
            <a href="{{ link.url | prepend: site.baseurl | replace: '//', '/' }}">
              {{ link.title }}
            </a>
          </li>
        </ul>
    {% endfor %}

  {% endif %}
</section>
