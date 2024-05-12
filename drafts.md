---
layout: page
title: "Drafts"
permalink: /drafts/
---

{% for draft in site.drafts %}
* [{{ draft.title }}]({{ draft.url }})
{% endfor %}