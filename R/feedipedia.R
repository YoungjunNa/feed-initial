# libary ####
pacman::p_load("rvest","dplyr","stringr")
url <- "https://www.feedipedia.org/node/556"

# feed.search
feed.search <- function(keyword) {
  url <- paste0("https://www.feedipedia.org/search/node/",keyword)
  html <- read_html(url, encoding="UTF-8")
  
  result <- html %>% html_nodes("h3") %>% html_children() %>% html_text() # search results
  url <- html %>% html_nodes("h3 a") %>% html_attr("href")
  
  df <- data.frame(result,url)
  print(df)
}

#feed.list
feed.list <- function(url){
  html <- read_html(url, encoding="UTF-8")
  
  #names
  h1 <- html %>% html_nodes("h1") %>% html_text()
  h2 <- html %>% html_nodes("h2") %>% html_text()
  h3 <- html %>% html_nodes("h3") %>% html_text()
  
  #nutrients
  list <- html %>% html_nodes("table") %>% html_table()
  
  print(h1)
  print(h2)
  print(h3)
  print(list[1:ifelse(length(list)-1==0,1,length(list)-1)])
}

#feed.extract
feed.extract <- function(url,n) {
  html <- read_html(url, encoding="UTF-8")
  
  #nutrients
  list <- html %>% html_nodes("table") %>% html_table()
  a <- list[[n]]
  
  end <- c(which(a[,2] == '') - 1,nrow(a))
  start <- c(2,which(a[,2] == '') + 2)
  
  df <- list()
  for(i in 1:length(end)){
    df[[i]] <- a[start[i]:end[i],]
    names(df[i]) <- a[start[i]-1,1]
    colnames(df[[i]]) <- a[start[i]-1,]
  }

  print(df)
}

#feed.t
feed.t <- function(df) {
  tt <- t(df) 
  colnames(tt) <- tt[1,]
  # df <- df[-1,]  
  # tt$Unit <- as.character(tt$Unit)
  # tt$Avg <- as.numeric(tt$Avg)
  # tt$SD <- as.numeric(tt$SD)
  # tt$Min <- as.numeric(tt$Min)
  # tt$Max <- as.numeric(tt$Max)
  # tt$Nb <- as.numeric(tt$Nb)
  print(tt)
}

#test
feed.search("alfalfa")
feed.list("https://www.feedipedia.org/node/556")
feed.extract("https://www.feedipedia.org/node/556",11)
df <- feed.extract("https://www.feedipedia.org/node/556",11)[[1]]
df1 <- feed.t(df)

# library(agridat)
# ?agridat




