---
layout: citation
title: "Somali ancestry in Minnesota by city"
date: 2025-12-01 12:00 -0600
categories: posts
tags: [R, Analysis]
summary: This is an R script that uses the tidycensus package to get data on Somali ancestry in Chisago County, Minnesota, and displays it in a nicely formatted table.
---

## Testing




``` r
library(tidycensus)
library(tidyverse)
library(knitr)
library(kableExtra)

# You'll need your own Census API key
# census_api_key("YOUR_KEY_HERE", install = TRUE)

chisago_ancestry <- get_acs(
  geography = "county",
  variables = c(swedish = "B04006_064"),
  state = "MN",
  county = "Chisago",
  year = 2022
)
```
### Now
``` r
chisago_ancestry %>%
  kable(format = "markdown") %>%
  kable_styling()
```

<table class="table" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> GEOID </th>
   <th style="text-align:left;"> NAME </th>
   <th style="text-align:left;"> variable </th>
   <th style="text-align:right;"> estimate </th>
   <th style="text-align:right;"> moe </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 27025 </td>
   <td style="text-align:left;"> Chisago County, Minnesota </td>
   <td style="text-align:left;"> swedish </td>
   <td style="text-align:right;"> 212 </td>
   <td style="text-align:right;"> 145 </td>
  </tr>
</tbody>
</table>

