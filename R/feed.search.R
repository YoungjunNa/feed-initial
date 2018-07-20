#' feed.search
#'
#' This function search a keyword at feedipedia.org.
#' @param keyword A keyword that you want to find.
#' @keywords feed, feedipedia
#' @importFrom rvest dplyr stingr
#' @export
#' @examples
#' feed.search("alfalfa")

feed.search <- function(keyword) {
  stopifnot(require(rvest), require(dplyr), require(stringr))
  url <- paste0("https://www.feedipedia.org/search/node/",keyword)
  html <- read_html(url, encoding="UTF-8")
  
  result <- html %>% html_nodes("h3") %>% html_children() %>% html_text() # search results
  url <- html %>% html_nodes("h3 a") %>% html_attr("href")
  
  df <- data.frame(result,url)
  print(df)
}