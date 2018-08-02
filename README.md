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
### Feed information
#### feed.list
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

#### feed.search
feed.search function shows the results you found at [feedipedia.org](https://www.feedipedia.org/).     

``` r
feed.search("maize")
```

#### feed.info
feed.info function show the nutritive values of the specific feedstuff(url) in the form of a list.

``` r
# The result of Maize germ meal and maize germ. url was found in the results of feed.search() function

feed.info(url="https://www.feedipedia.org/node/716")
```

#### feed.extract
feed.extract function extract the nutritive values from the the list.

``` r
# The result of "Maize germ meal, protein 20-30%, oil > 5%". url was found in the results of feed.search() function and n was found in feed.list() function (e.g. [[3]])

feed.extract(url="https://www.feedipedia.org/node/716",n=3)
```

#### feed.compare
feed.compare function compare each result of feed composition

``` r
# extract the result
feed1 <- feed.extract("https://www.feedipedia.org/node/556",2)
feed2 <- feed.extract("https://www.feedipedia.org/node/556",3)

# extract the main analysis results
feed1 <- feed1[[1]]
feed2 <- feed2[[1]]

# compare the results
feed.compare(feed1,feed2,name1="corn_europe",name2="corn_africa")
```

### Conversion
#### as_is
as_is function convert dry-matter basis into as-is basis.

``` r
df <- data.frame(nutrient=c("CP","NDF","EE","Ash"),composition=c(10,30,5,2))
as_is(composition=df$composition,dm=85,digits=2)
```

#### d_m
d_m function convert as-is basis into dry-mater basis.

``` r
df <- data.frame(nutrient=c("CP","NDF","EE","Ash"),composition=c(10,30,5,2))
d_m(composition=df$composition,dm=85,digits=2)
```

### Dataset

#### feed.nrc.beef (Not available now)
feed.nrc.beef function loads the feed informations from [BCNRM 2016](http://nutritionmodels.com/beef.html) (Drs. Noel Andy Cole, Clinton R. Krehbiel, Ronald P. Lemenager, Galen E. Erickson, Joel Caton, Karen A. Beauchemin, Michael L. Galyean, Joan H. Eisemann, and Luis O. Tedeschi).

``` r
feed.nrc.beef

#check the unit
attributes(feed.nrc.beef)$unit
#or
str(feed.nrc.beef)
```

## Getting helps
Email: ruminoreticulum@gmail.com
