feed.nrc.beef <-
  read.csv("feed.nrc.beef.txt",stringsAsFactors = FALSE)

attr(feed.nrc.beef,"unit") <- feed.nrc.beef[1,]
feed.nrc.beef <- feed.nrc.beef[-1,]
feed.nrc.beef[,-c(1:2)] <- as.numeric(unlist(feed.nrc.beef[,-c(1:2)]))

devtools::use_data(feed.nrc.beef,overwrite = TRUE)
