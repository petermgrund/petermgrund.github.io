---
layout: project-page
title: "Pedestrian advocacy"
description: "My work on pedestrian issues"
permalink: /projects/ped
---

I am a member of the City of Minneapolis' Pedestrian Advisory Committee (PAC). The PAC advises the Mayor, City Council, and city departments on policies, programs, and actions that affect walking in Minneapolis. We work to make walking safer, easier, and more attractive for people of all ages and abilities.

I am working on a proposal to create a special taskforce under the PAC's Program and Policy (P&P) subcommittee dedicated to thoroughly reviewing city, county, and state policies, laws, and standard practices related to pedestrian infrastructure and policies. The taskforce will develop a comprehensive recommendation system that could serve as a standardized method for evaluating various aspects of projects presented to the PAC.

Here is a link to the original [proposal](/projects/ped/proposal).

### Drafts
All of the drafts that I have worked on are listed below. You can click on the title to view the full draft.

{% assign sorted_drafts = site.drafts | sort: "code" %}
{% for draft in sorted_drafts %}
* {{draft.code}}: [{{ draft.title }}]({{ draft.url }}) – {{ draft.status }} stage (last updated: {{ draft.date_modified }})
{% endfor %}