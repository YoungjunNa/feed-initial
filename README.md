# feed
## Notification
**This package is under development.**

## Overview

feed is a package for animal feed formulation. It is comprised of 3 parts; 1) import feedstuff information, 2) set nutrient requirement of animals, and 3) least-cost formulation.  

## Installation  

``` r
# The development version from GitHub:
# install.packages("devtools")
devtools::install_github("youngjunna/feed")
```

## Usage
### feed.list
feed.list function shows the list of feeds of [feedipedia.org](https://www.feedipedia.org/).

``` r
library(feed)

# All feeds
feed.list(category=all)

# Forage plants
feed.list(forage)

# Plant products/by-products
feed.list(plantProduct)

# Feeds of animal origin
feed.list(animalOrigin)

# Other feeds
feed.list(other)
```

### feed.search
feed.search function shows the results you found at [feedipedia.org](https://www.feedipedia.org/).     

``` r
feed.search("maize")
```

### feed.info
feed.info function show the nutritive values of the specific feedstuff(url) in the form of a list.

``` r
# The result of Maize germ meal and maize germ. url was found in the results of feed.search() function

feed.info(url="https://www.feedipedia.org/node/716")
```

### feed.extract
feed.extract function extract the nutritive values from the the list.

``` r
# The result of "Maize germ meal, protein 20-30%, oil > 5%". url was found in the results of feed.search() function and n was found in feed.list() function (e.g. [[3]])

feed.extract(url="https://www.feedipedia.org/node/716",n=3)
```

## Conversion
### as_is
as_is function convert dry-matter basis into as-is basis.

``` r
df <- data.frame(nutrient=c("CP","NDF","EE","Ash"),composition=c(10,30,5,2))
as_is(df$composition,85)
```

### d_m
d_m function convert as-is basis into dry-mater basis.

``` r
df <- data.frame(nutrient=c("CP","NDF","EE","Ash"),composition=c(10,30,5,2))
d_m(df$composition,85)
```

## Dataset

### feed.nrc.beef
feed.nrc.beef function loads the feed informations from [BCNRM 2016](http://nutritionmodels.com/beef.html) (Drs. Noel Andy Cole, Clinton R. Krehbiel, Ronald P. Lemenager, and Galen E. Erickson, Drs. Joel Caton, Karen A. Beauchemin, Michael L. Galyean, Joan H. Eisemann, and Luis O. Tedeschi).

``` r
feed.nrc.beef
```

## Getting helps
Email: ruminoreticulum@gmail.com
