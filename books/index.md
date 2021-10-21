---
layout: page
title: Books
---

![](/books/assets/poison2.png)

I only introduce the best, most useful and fun books that I've read.

Here are my Recommendations:

<br>
<section>
  {% if site.categories.books[0] %}

    {% capture currentyear %}{{ 'now' | date: "%Y" }}{% endcapture %}
    {% capture firstpostyear %}{{ site.categories.books[0].date | date: '%Y' }}{% endcapture %}
    {% if currentyear == firstpostyear %}
        <h3>This year's Books</h3>
    {% else %}
        <h3>{{ firstpostyear }}</h3>
    {% endif %}

    {%for book in site.categories.books %}
      {% unless book.next %}
      {% else %}
        {% capture year %}{{ book.date | date: '%Y' }}{% endcapture %}
        {% capture nyear %}{{ book.next.date | date: '%Y' }}{% endcapture %}
        {% if year != nyear %}
          <h3>{{ book.date | date: '%Y' }}</h3>
        {% endif %}
      {% endunless %}
        <ul>
          <li><time>{{ book.date | date:"%d %b" }} - </time>
            <a href="{{ book.url | prepend: site.baseurl | replace: '//', '/' }}">
              {{ book.title }}
            </a>
            <span class="postitem">
              <span class="icon-small">{% include icon-tag.svg %}</span>
              {% for tag in book.tags %}
                <code class="posttag"><category>{{ tag | xml_escape }}</category></code>
              {% endfor %}
            </span>
          </li>
        </ul>
    {% endfor %}

  {% endif %}
</section>
