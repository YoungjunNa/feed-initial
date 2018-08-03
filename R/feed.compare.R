#' feed.compare
#'
#' A function to compare each result of feed composition.
#' @param feed1 1st feed chemical composition that you want to compare.
#' @param feed2 2nd feed chemical composition that you want to compare.
#' @param name1 1st feed name that you want to compare.
#' @param name1 2nd feed name that you want to compare.
#' @keywords feed formulation
#' @import dplyr
#' @export
#' @examples
#'feed1 <- feed::feed.extract("https://www.feedipedia.org/node/556",2)
#'feed2 <- feed::feed.extract("https://www.feedipedia.org/node/556",3)
#'feed1 <- feed1[[1]]
#'feed2 <- feed2[[1]]
#'feed.compare(feed1,feed2,name1="corn_europe",name2="corn_africa")

feed.compare <- function(feed1,feed2,name1="first",name2="second") {
  feed1$Avg <- as.numeric(feed1$Avg)
  feed2$Avg <- as.numeric(feed2$Avg)
  
  feed1 <- feed1[,c(1:3)]
  feed2 <- feed2[,c(1,3)]
  
  colnames(feed1) <- c("composition","unit",name1)
  colnames(feed2) <- c("composition",name2)
  
  join <- dplyr::left_join(feed1,feed2, by="composition")
  join$diff <- join[,3]-join[,4]
  join$percentage <- round(join[,4]/join[,3],3)
  
  return(join)
}
