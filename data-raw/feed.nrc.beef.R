feed.nrc.beef <-
  read.csv("feed.nrc.beef.txt")
devtools::use_data(feed.nrc.beef,overwrite = TRUE)
