---
layout: citation
title: "Somali ancestry in Minnesota by city"
date: 2025-12-01 12:00 -0600
categories: posts
tags: [R, Analysis]
summary: This is an R script that uses the tidycensus package to get data on Somali ancestry in Minnesota by city from the 2020 Decennial Census.
---

Script last run: 2025-12-02 00:59:15.159153

## Primary sources
- [2020 Decennial Census, Data for Demographic and Housing Characteristics (DDHCA) Summary File](https://www.census.gov/data/tables/2023/dec/2020-census-detailed-dhc-a.html)
- [2020 Decennial Census, PL Summary File](https://www.census.gov/programs-surveys/decennial-census/about/rdo/summary-files.html)
- Walker K, Herman M (2025). *tidycensus: Load US Census Boundary and Attribute Data as 'tidyverse' and 'sf'-Ready Data Frames*. R package version 1.7.3, [https://walker-data.com/tidycensus/](https://walker-data.com/tidycensus/).

## Setup




``` r
library(tidycensus)
library(tidyverse)
library(knitr)
library(kableExtra)

# You'll need your own Census API key
# census_api_key("YOUR_KEY_HERE", install = TRUE)
```

## By city

``` r
somali_by_place <- get_decennial(
  geography = "place",
  variables = "T01001_001N",
  state = "MN",
  year = 2020,
  sumfile = "ddhca",
  pop_group = "1325"
)

total_by_place <- get_decennial(
  geography = "place",
  variables = "P1_001N",
  state = "MN",
  year = 2020,
  sumfile = "pl"
)

place_data <- total_by_place %>%
  left_join(somali_by_place %>% select(GEOID, somali_count = value), by = "GEOID") %>%
  mutate(
    `percent_somali` = somali_count / value * 100
  ) %>%
  select(NAME, total_population = value, somali_count, percent_somali) %>%
  filter(somali_count >= 1) %>%
  arrange(desc(percent_somali))

place_data %>%
  kable(format = "markdown") %>%
  kable_styling()
```

<table class="table" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> NAME </th>
   <th style="text-align:right;"> total_population </th>
   <th style="text-align:right;"> somali_count </th>
   <th style="text-align:right;"> percent_somali </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Waite Park city, Minnesota </td>
   <td style="text-align:right;"> 8341 </td>
   <td style="text-align:right;"> 1590 </td>
   <td style="text-align:right;"> 19.0624625 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Pelican Rapids city, Minnesota </td>
   <td style="text-align:right;"> 2577 </td>
   <td style="text-align:right;"> 359 </td>
   <td style="text-align:right;"> 13.9309274 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> St. Cloud city, Minnesota </td>
   <td style="text-align:right;"> 68881 </td>
   <td style="text-align:right;"> 7515 </td>
   <td style="text-align:right;"> 10.9101204 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Faribault city, Minnesota </td>
   <td style="text-align:right;"> 24453 </td>
   <td style="text-align:right;"> 2328 </td>
   <td style="text-align:right;"> 9.5203043 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Willmar city, Minnesota </td>
   <td style="text-align:right;"> 21015 </td>
   <td style="text-align:right;"> 1991 </td>
   <td style="text-align:right;"> 9.4741851 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Columbia Heights city, Minnesota </td>
   <td style="text-align:right;"> 21973 </td>
   <td style="text-align:right;"> 1942 </td>
   <td style="text-align:right;"> 8.8381195 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Hopkins city, Minnesota </td>
   <td style="text-align:right;"> 19079 </td>
   <td style="text-align:right;"> 1269 </td>
   <td style="text-align:right;"> 6.6512920 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Minneapolis city, Minnesota </td>
   <td style="text-align:right;"> 429954 </td>
   <td style="text-align:right;"> 26082 </td>
   <td style="text-align:right;"> 6.0662303 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Burnsville city, Minnesota </td>
   <td style="text-align:right;"> 64317 </td>
   <td style="text-align:right;"> 3809 </td>
   <td style="text-align:right;"> 5.9222290 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Hilltop city, Minnesota </td>
   <td style="text-align:right;"> 958 </td>
   <td style="text-align:right;"> 56 </td>
   <td style="text-align:right;"> 5.8455115 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> East Grand Forks city, Minnesota </td>
   <td style="text-align:right;"> 9176 </td>
   <td style="text-align:right;"> 469 </td>
   <td style="text-align:right;"> 5.1111595 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Savage city, Minnesota </td>
   <td style="text-align:right;"> 32465 </td>
   <td style="text-align:right;"> 1416 </td>
   <td style="text-align:right;"> 4.3616202 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Falcon Heights city, Minnesota </td>
   <td style="text-align:right;"> 5369 </td>
   <td style="text-align:right;"> 216 </td>
   <td style="text-align:right;"> 4.0230955 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Eden Prairie city, Minnesota </td>
   <td style="text-align:right;"> 64198 </td>
   <td style="text-align:right;"> 2474 </td>
   <td style="text-align:right;"> 3.8537026 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fridley city, Minnesota </td>
   <td style="text-align:right;"> 29590 </td>
   <td style="text-align:right;"> 1110 </td>
   <td style="text-align:right;"> 3.7512673 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Spring Lake Park city, Minnesota </td>
   <td style="text-align:right;"> 7188 </td>
   <td style="text-align:right;"> 268 </td>
   <td style="text-align:right;"> 3.7284363 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> St. Joseph city, Minnesota </td>
   <td style="text-align:right;"> 7029 </td>
   <td style="text-align:right;"> 239 </td>
   <td style="text-align:right;"> 3.4001992 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Rochester city, Minnesota </td>
   <td style="text-align:right;"> 121395 </td>
   <td style="text-align:right;"> 3954 </td>
   <td style="text-align:right;"> 3.2571358 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Shakopee city, Minnesota </td>
   <td style="text-align:right;"> 43698 </td>
   <td style="text-align:right;"> 1387 </td>
   <td style="text-align:right;"> 3.1740583 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> North Mankato city, Minnesota </td>
   <td style="text-align:right;"> 14275 </td>
   <td style="text-align:right;"> 450 </td>
   <td style="text-align:right;"> 3.1523643 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> St. Peter city, Minnesota </td>
   <td style="text-align:right;"> 12066 </td>
   <td style="text-align:right;"> 373 </td>
   <td style="text-align:right;"> 3.0913310 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> St. Paul city, Minnesota </td>
   <td style="text-align:right;"> 311527 </td>
   <td style="text-align:right;"> 9601 </td>
   <td style="text-align:right;"> 3.0819159 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bloomington city, Minnesota </td>
   <td style="text-align:right;"> 89987 </td>
   <td style="text-align:right;"> 2773 </td>
   <td style="text-align:right;"> 3.0815562 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Marshall city, Minnesota </td>
   <td style="text-align:right;"> 13628 </td>
   <td style="text-align:right;"> 406 </td>
   <td style="text-align:right;"> 2.9791606 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Owatonna city, Minnesota </td>
   <td style="text-align:right;"> 26420 </td>
   <td style="text-align:right;"> 787 </td>
   <td style="text-align:right;"> 2.9788039 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Roseville city, Minnesota </td>
   <td style="text-align:right;"> 36254 </td>
   <td style="text-align:right;"> 893 </td>
   <td style="text-align:right;"> 2.4631765 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> St. Anthony city (Hennepin and Ramsey Counties), Minnesota </td>
   <td style="text-align:right;"> 9257 </td>
   <td style="text-align:right;"> 216 </td>
   <td style="text-align:right;"> 2.3333693 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lexington city, Minnesota </td>
   <td style="text-align:right;"> 2248 </td>
   <td style="text-align:right;"> 51 </td>
   <td style="text-align:right;"> 2.2686833 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mankato city, Minnesota </td>
   <td style="text-align:right;"> 44488 </td>
   <td style="text-align:right;"> 1004 </td>
   <td style="text-align:right;"> 2.2567883 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Apple Valley city, Minnesota </td>
   <td style="text-align:right;"> 56374 </td>
   <td style="text-align:right;"> 1263 </td>
   <td style="text-align:right;"> 2.2403945 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dilworth city, Minnesota </td>
   <td style="text-align:right;"> 4612 </td>
   <td style="text-align:right;"> 94 </td>
   <td style="text-align:right;"> 2.0381613 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Moorhead city, Minnesota </td>
   <td style="text-align:right;"> 44505 </td>
   <td style="text-align:right;"> 900 </td>
   <td style="text-align:right;"> 2.0222447 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lauderdale city, Minnesota </td>
   <td style="text-align:right;"> 2271 </td>
   <td style="text-align:right;"> 45 </td>
   <td style="text-align:right;"> 1.9815059 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Richfield city, Minnesota </td>
   <td style="text-align:right;"> 36994 </td>
   <td style="text-align:right;"> 729 </td>
   <td style="text-align:right;"> 1.9705898 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Eagan city, Minnesota </td>
   <td style="text-align:right;"> 68855 </td>
   <td style="text-align:right;"> 1307 </td>
   <td style="text-align:right;"> 1.8981919 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> New Brighton city, Minnesota </td>
   <td style="text-align:right;"> 23454 </td>
   <td style="text-align:right;"> 411 </td>
   <td style="text-align:right;"> 1.7523663 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Newport city, Minnesota </td>
   <td style="text-align:right;"> 3797 </td>
   <td style="text-align:right;"> 65 </td>
   <td style="text-align:right;"> 1.7118778 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Chaska city, Minnesota </td>
   <td style="text-align:right;"> 27810 </td>
   <td style="text-align:right;"> 443 </td>
   <td style="text-align:right;"> 1.5929522 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> St. Louis Park city, Minnesota </td>
   <td style="text-align:right;"> 50010 </td>
   <td style="text-align:right;"> 781 </td>
   <td style="text-align:right;"> 1.5616877 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> New Hope city, Minnesota </td>
   <td style="text-align:right;"> 21986 </td>
   <td style="text-align:right;"> 310 </td>
   <td style="text-align:right;"> 1.4099882 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Brooklyn Park city, Minnesota </td>
   <td style="text-align:right;"> 86478 </td>
   <td style="text-align:right;"> 1192 </td>
   <td style="text-align:right;"> 1.3783853 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Minnetonka city, Minnesota </td>
   <td style="text-align:right;"> 53781 </td>
   <td style="text-align:right;"> 670 </td>
   <td style="text-align:right;"> 1.2457931 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Brooklyn Center city, Minnesota </td>
   <td style="text-align:right;"> 33782 </td>
   <td style="text-align:right;"> 382 </td>
   <td style="text-align:right;"> 1.1307797 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Edina city, Minnesota </td>
   <td style="text-align:right;"> 53494 </td>
   <td style="text-align:right;"> 602 </td>
   <td style="text-align:right;"> 1.1253599 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Robbinsdale city, Minnesota </td>
   <td style="text-align:right;"> 14646 </td>
   <td style="text-align:right;"> 155 </td>
   <td style="text-align:right;"> 1.0583094 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Maplewood city, Minnesota </td>
   <td style="text-align:right;"> 42088 </td>
   <td style="text-align:right;"> 428 </td>
   <td style="text-align:right;"> 1.0169169 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Blaine city, Minnesota </td>
   <td style="text-align:right;"> 70222 </td>
   <td style="text-align:right;"> 704 </td>
   <td style="text-align:right;"> 1.0025348 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Woodbury city, Minnesota </td>
   <td style="text-align:right;"> 75102 </td>
   <td style="text-align:right;"> 740 </td>
   <td style="text-align:right;"> 0.9853266 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Eagle Lake city, Minnesota </td>
   <td style="text-align:right;"> 3278 </td>
   <td style="text-align:right;"> 32 </td>
   <td style="text-align:right;"> 0.9762050 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Vadnais Heights city, Minnesota </td>
   <td style="text-align:right;"> 12912 </td>
   <td style="text-align:right;"> 122 </td>
   <td style="text-align:right;"> 0.9448575 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> North St. Paul city, Minnesota </td>
   <td style="text-align:right;"> 12364 </td>
   <td style="text-align:right;"> 106 </td>
   <td style="text-align:right;"> 0.8573277 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mounds View city, Minnesota </td>
   <td style="text-align:right;"> 13249 </td>
   <td style="text-align:right;"> 113 </td>
   <td style="text-align:right;"> 0.8528946 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Plymouth city, Minnesota </td>
   <td style="text-align:right;"> 81026 </td>
   <td style="text-align:right;"> 624 </td>
   <td style="text-align:right;"> 0.7701232 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Coon Rapids city, Minnesota </td>
   <td style="text-align:right;"> 63599 </td>
   <td style="text-align:right;"> 485 </td>
   <td style="text-align:right;"> 0.7625906 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Prior Lake city, Minnesota </td>
   <td style="text-align:right;"> 27617 </td>
   <td style="text-align:right;"> 196 </td>
   <td style="text-align:right;"> 0.7097078 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lakeville city, Minnesota </td>
   <td style="text-align:right;"> 69490 </td>
   <td style="text-align:right;"> 489 </td>
   <td style="text-align:right;"> 0.7036984 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Wayzata city, Minnesota </td>
   <td style="text-align:right;"> 4434 </td>
   <td style="text-align:right;"> 31 </td>
   <td style="text-align:right;"> 0.6991430 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Rosemount city, Minnesota </td>
   <td style="text-align:right;"> 25650 </td>
   <td style="text-align:right;"> 178 </td>
   <td style="text-align:right;"> 0.6939571 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lino Lakes city, Minnesota </td>
   <td style="text-align:right;"> 21399 </td>
   <td style="text-align:right;"> 130 </td>
   <td style="text-align:right;"> 0.6075050 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Circle Pines city, Minnesota </td>
   <td style="text-align:right;"> 5025 </td>
   <td style="text-align:right;"> 28 </td>
   <td style="text-align:right;"> 0.5572139 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Oakdale city, Minnesota </td>
   <td style="text-align:right;"> 28303 </td>
   <td style="text-align:right;"> 157 </td>
   <td style="text-align:right;"> 0.5547115 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Carver city, Minnesota </td>
   <td style="text-align:right;"> 5829 </td>
   <td style="text-align:right;"> 31 </td>
   <td style="text-align:right;"> 0.5318236 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Crystal city, Minnesota </td>
   <td style="text-align:right;"> 23330 </td>
   <td style="text-align:right;"> 123 </td>
   <td style="text-align:right;"> 0.5272182 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Nowthen city, Minnesota </td>
   <td style="text-align:right;"> 4536 </td>
   <td style="text-align:right;"> 23 </td>
   <td style="text-align:right;"> 0.5070547 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Golden Valley city, Minnesota </td>
   <td style="text-align:right;"> 22552 </td>
   <td style="text-align:right;"> 114 </td>
   <td style="text-align:right;"> 0.5054984 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Inver Grove Heights city, Minnesota </td>
   <td style="text-align:right;"> 35801 </td>
   <td style="text-align:right;"> 180 </td>
   <td style="text-align:right;"> 0.5027793 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Chanhassen city, Minnesota </td>
   <td style="text-align:right;"> 25947 </td>
   <td style="text-align:right;"> 128 </td>
   <td style="text-align:right;"> 0.4933133 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Medina city, Minnesota </td>
   <td style="text-align:right;"> 6837 </td>
   <td style="text-align:right;"> 32 </td>
   <td style="text-align:right;"> 0.4680415 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> West St. Paul city, Minnesota </td>
   <td style="text-align:right;"> 20615 </td>
   <td style="text-align:right;"> 94 </td>
   <td style="text-align:right;"> 0.4559787 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Maple Grove city, Minnesota </td>
   <td style="text-align:right;"> 70253 </td>
   <td style="text-align:right;"> 303 </td>
   <td style="text-align:right;"> 0.4312983 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Waseca city, Minnesota </td>
   <td style="text-align:right;"> 9229 </td>
   <td style="text-align:right;"> 38 </td>
   <td style="text-align:right;"> 0.4117456 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Shoreview city, Minnesota </td>
   <td style="text-align:right;"> 26921 </td>
   <td style="text-align:right;"> 109 </td>
   <td style="text-align:right;"> 0.4048884 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Little Falls city, Minnesota </td>
   <td style="text-align:right;"> 9140 </td>
   <td style="text-align:right;"> 37 </td>
   <td style="text-align:right;"> 0.4048140 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Ramsey city, Minnesota </td>
   <td style="text-align:right;"> 27646 </td>
   <td style="text-align:right;"> 110 </td>
   <td style="text-align:right;"> 0.3978876 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> South St. Paul city, Minnesota </td>
   <td style="text-align:right;"> 20759 </td>
   <td style="text-align:right;"> 75 </td>
   <td style="text-align:right;"> 0.3612891 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Little Canada city, Minnesota </td>
   <td style="text-align:right;"> 10819 </td>
   <td style="text-align:right;"> 38 </td>
   <td style="text-align:right;"> 0.3512339 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> White Bear Lake city, Minnesota </td>
   <td style="text-align:right;"> 24883 </td>
   <td style="text-align:right;"> 75 </td>
   <td style="text-align:right;"> 0.3014106 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Anoka city, Minnesota </td>
   <td style="text-align:right;"> 17921 </td>
   <td style="text-align:right;"> 48 </td>
   <td style="text-align:right;"> 0.2678422 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Cottage Grove city, Minnesota </td>
   <td style="text-align:right;"> 38839 </td>
   <td style="text-align:right;"> 103 </td>
   <td style="text-align:right;"> 0.2651974 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lake Elmo city, Minnesota </td>
   <td style="text-align:right;"> 11335 </td>
   <td style="text-align:right;"> 26 </td>
   <td style="text-align:right;"> 0.2293780 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Hastings city, Minnesota </td>
   <td style="text-align:right;"> 22154 </td>
   <td style="text-align:right;"> 50 </td>
   <td style="text-align:right;"> 0.2256929 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fergus Falls city, Minnesota </td>
   <td style="text-align:right;"> 14119 </td>
   <td style="text-align:right;"> 30 </td>
   <td style="text-align:right;"> 0.2124796 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Champlin city, Minnesota </td>
   <td style="text-align:right;"> 23919 </td>
   <td style="text-align:right;"> 47 </td>
   <td style="text-align:right;"> 0.1964965 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Bemidji city, Minnesota </td>
   <td style="text-align:right;"> 14574 </td>
   <td style="text-align:right;"> 28 </td>
   <td style="text-align:right;"> 0.1921230 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mendota Heights city, Minnesota </td>
   <td style="text-align:right;"> 11744 </td>
   <td style="text-align:right;"> 22 </td>
   <td style="text-align:right;"> 0.1873297 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Sartell city, Minnesota </td>
   <td style="text-align:right;"> 19351 </td>
   <td style="text-align:right;"> 32 </td>
   <td style="text-align:right;"> 0.1653661 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Elk River city, Minnesota </td>
   <td style="text-align:right;"> 25835 </td>
   <td style="text-align:right;"> 39 </td>
   <td style="text-align:right;"> 0.1509580 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Farmington city, Minnesota </td>
   <td style="text-align:right;"> 23632 </td>
   <td style="text-align:right;"> 33 </td>
   <td style="text-align:right;"> 0.1396412 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Albert Lea city, Minnesota </td>
   <td style="text-align:right;"> 18492 </td>
   <td style="text-align:right;"> 22 </td>
   <td style="text-align:right;"> 0.1189704 </td>
  </tr>
</tbody>
</table>

