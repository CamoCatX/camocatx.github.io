---
layout: page
title: Books
image: /books/assets/reading.png
---

![](/books/assets/reading.png)
<br>
[^1]

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
      {% if book.previous_in_category %}
        {% capture year %}{{ book.date | date: '%Y' }}{% endcapture %}
        {% capture nyear %}{{ book.previous_in_category.date | date: '%Y' }}{% endcapture %}
        {% if year != nyear %}
          <h3>{{ book.date | date: '%Y' }}</h3>
        {% endif %}
      {% endif %}
        <ul>
          <li><time>{{ book.date | date:"%d %b" }} - </time>
            <a href="{{ book.url | prepend: site.baseurl | replace: '//', '/' }}">
              {{ book.title }}
            </a>
            {% if book.tags[0] %}
              <span class="postitem">
                <span class="icon-small">{% include icon-tag.svg %}</span>
                {% for tag in book.tags %}
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
### _References_
* * *
[^1]: [Icon](https://www.flaticon.com/free-icon/reading_3048425) by [photo3idea_studio](https://www.flaticon.com/authors/photo3idea-studio).
