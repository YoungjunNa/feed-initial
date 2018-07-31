df <- feed.extract("https://www.feedipedia.org/node/556",2)
df1 <- feed.extract("https://www.feedipedia.org/node/556",3)

df[[1]]$Avg <- as.numeric(df[[1]]$Avg)
df1[[1]]$Avg <- as.numeric(df1[[1]]$Avg)

df <- df[[1]][,c(1,3)]
df1 <- df1[[1]][,c(1,3)]

colnames(df) <- c("composition","1")
colnames(df1) <- c("composition","2")

df
df1

join <- plyr::join(df,df1, by="composition") #id로 조인!

join %>% ggplot(aes())
