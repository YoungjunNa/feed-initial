# feed
## Notification
**This package is under development.**

## Overview

feed is a package for animal feed formulation. It ~~is~~will be comprised of 3 parts; 1) import the feed data, 2) set nutrient requirement of the animal, and 3) least-cost formulation.  

## Installation  

``` r
# The development version from GitHub:
# install.packages("devtools")
devtools::install_github("youngjunna/feed")
```

## Usage
### Feed information
#### feed.list
```feed.list``` function shows the list of feeds of [feedipedia.org](https://www.feedipedia.org/).

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
```feed.search``` function shows the results you found at [feedipedia.org](https://www.feedipedia.org/). When you find the result that you want, copy the url for scraping the feed data using ```feed.info``` function.      

``` r
feed.search("maize")
```

#### feed.info
```feed.info``` function shows the nutritive values of the specific feedstuff(url) in the form of a list. If you use extract option, a list is returned for each nutrient composition of the specific feed.

``` r
# The result of Maize germ meal and maize germ. url was found in the results of feed.search() function

# get the information about the url
feed.info(url="https://www.feedipedia.org/node/556")

# extract 2nd objects of nutrient composition dataset list
feed.info(url="https://www.feedipedia.org/node/556",extract=2)

```

#### feed.compare
```feed.compare``` function compares each result of feed composition.

``` r
# extract the result
feed1 <- feed::feed.info("https://www.feedipedia.org/node/556",2)
feed2 <- feed::feed.info("https://www.feedipedia.org/node/674",3)

# extract the main analysis results
feed1 <- feed1[[1]]
feed2 <- feed2[[1]]

# compare the results
feed.compare(feed1,feed2,name1="Corn",name2="SBM",radar=TRUE)
```

### Conversion
#### dm_asis
```dm_asis``` function converts dry-matter basis into as-is basis.

``` r
df <- data.frame(nutrient=c("CP","NDF","EE","Ash"),composition=c(10,30,5,2))
dm_asis(composition=df$composition,dm=85,digits=2)
```

#### asis_dm
```asis_dm``` function converts as-is basis into dry-mater basis.

``` r
df <- data.frame(nutrient=c("CP","NDF","EE","Ash"),composition=c(10,30,5,2))
asis_dm(composition=df$composition,dm=85,digits=2)
```

#### j_cal
```j_cal``` function converts joule into calorie.  

``` r

```

#### cal_j
```cal_j``` function converts calorie into joule.  

``` r

```

### Dataset

#### feed.nrc.beef (Not available now)
```feed.nrc.beef``` loads the feed informations from [BCNRM 2016](http://nutritionmodels.com/beef.html) (Drs. Noel Andy Cole, Clinton R. Krehbiel, Ronald P. Lemenager, Galen E. Erickson, Joel Caton, Karen A. Beauchemin, Michael L. Galyean, Joan H. Eisemann, and Luis O. Tedeschi).

``` r
feed.nrc.beef

#check the unit
attributes(feed.nrc.beef)$unit
#or
str(feed.nrc.beef)
```

## Getting helps
Email: ruminoreticulum@gmail.com
