# feed
## Notification
**This package is under development.**

## Overview

feed is a package for animal feed formulation. It is comprised of 3 parts; 1) import feedstuff information, 2) set nutrient requirement of animals, and 3) least-cost formulation.  

## Installation  

``` r
# Or the the development version from GitHub:
# install.packages("devtools")
devtools::install_github("youngjunna/feed")
```

## Usage
### feed.search
feed.search function shows the results you found at [feedipedia.org](https://www.feedipedia.org/).     

``` r
library(feed)

feed.search("maize")
```

### feed.list
feed.list function show the nutritive values of the specific feedstuff(url) in the form of a list.

``` r
# The result of Maize germ meal and maize germ. url was found in the results of feed.search() function

feed.search(url="https://www.feedipedia.org/node/716")
```

### feed.extract
feed.extract function extract the nutritive values from the the list.

``` r
# The result of "Maize germ meal, protein 20-30%, oil > 5%". url was found in the results of feed.search() function and n was found in feed.list() function (e.g. [[3]])

feed.extract(url="https://www.feedipedia.org/node/716",n=3)
```

## Getting helps
Email: ruminoreticulum@gmail.com
