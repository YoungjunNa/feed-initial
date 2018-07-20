#' feed.extract
#'
#' This function extract and re-combine the list from feed.list().
#' @param url A URL that you want to scraping.
#' @param n A number of list from feed.list().
#' @keywords feed, feedipedia
#' @importFrom rvest dplyr stingr
#' @export
#' @examples
#' feed.extract("https://www.feedipedia.org/node/556",2)


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
