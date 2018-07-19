# libary ####
pacman::p_load("rvest","dplyr","stringr")

url <- "https://www.feedipedia.org/node/345"
html <- read_html(url, encoding="UTF-8")

#names
names <- html %>% html_nodes("h3") %>% html_text()
names <- names[-c(1:5)]

#nutrients
list <- html %>% html_nodes("table") %>% html_table()
list <- list[-c(1:2)]

a <- list[[1]][,1:3]

#way1
colnames(a) <- c("a","b","c")
a[which(c == "Avg"), idx := which(c == "Avg")]
a[, idx := na.locf(idx)]
split(a, a$idx)

#way2
a[which(a$c == "Avg", "idx" = which(a$c == "Avg")]


#from 이정호
library(data.table)
library(zoo)

ex <- data.table(x = c("avg",2,3, "", "avg", 5, 6, "", "avg", 8, 9))
ex[which(x == "avg"), idx := which(x == "avg")]
ex[, idx := na.locf(idx)]
split(ex, ex$idx)



#example templete
Main_analysis <- a[1:6,]
colnames(Main_analysis) <- Main_analysis[1,]
Main_analysis <- Main_analysis[-1,]

Minerals <- a[8:10,]
colnames(Minerals) <- Minerals[1,]
Minerals <- Minerals[-1,]

Ruminant_nutritive_value <- a[12:13,]
colnames(Ruminant_nutritive_value) <- Ruminant_nutritive_value[1,]
Ruminant_nutritive_value <- Ruminant_nutritive_value[-1,]

Pig_nutritive_value <- a[15:17,]
colnames(Pig_nutritive_value) <- Pig_nutritive_value[1,]
Pig_nutritive_value <- Pig_nutritive_value[-1,]

example <- list(Main_analysis, Minerals, Ruminant_nutritive_value, Pig_nutritive_value)



##
colnames(a) <- a[1,]

my_colnm <- list[[1]][[1,]]
my_colnm <- t(my_colnm)
                      
# library(agridat)
# ?agridat

feedipedia <- function(url){
  names <- read_html(url, encoding="UTF-8") %>%
    html_nodes("h3") %>%
    html_text()
  names <- names[-c(1:5)]
  print(names)
}

feedipedia("https://www.feedipedia.org/node/345")


# search
keyword <- "corn"
url <- paste0("https://www.feedipedia.org/search/node/",keyword)
html <- read_html(url, encoding="UTF-8")

html %>% html_nodes("h3") %>% html_children() %>% html_text() # search results
html %>% html_nodes("h3 a") %>% html_




