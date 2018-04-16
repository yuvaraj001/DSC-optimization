gc()

#Set base working directory
baseWD<-"C:\\Users\\yourid\\Desktop\\Email"

# Read Target Data
Email_File<-paste(baseWD,"\\bhpb.csv",sep="")
Emails = read.csv(Email_File)
head(Emails)
names(Emails)
nrow(Emails)

#Include libraries
library(tm)
library(SnowballC)
library(RColorBrewer)
library(wordcloud2)
library(stringr)
library(stringi)

#Remove the duplicates from the final Emails
Email.deduped = unique(Emails, by = "Importance")
#Take Subject alone for word cloud formation
subject = Email.deduped$Subject
head(subject, 10)
#Convert to corpus
docs <- Corpus(VectorSource(subject))
#Remove the comma(,) in the tags column
docs <- tm_map(docs, removePunctuation)
inspect(docs)

docs <- tm_map(docs, tolower)
inspect(docs)

toSpace <- function (x , pattern ) gsub(pattern, " ", x)
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, ")")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\(")
docs <- tm_map(docs, toSpace, "\\|")
docs <- tm_map(docs, toSpace, "\\bre\\b")
docs <- tm_map(docs, toSpace, "\\bfw\\b")
docs <- tm_map(docs, toSpace, "\\bfwd\\b")
inspect(docs)

#docs <- tm_map(docs, removeNumbers)
#inspect(docs)

docs <- tm_map(docs, stripWhitespace)
inspect(docs)

docs <- tm_map(docs, removeWords, stopwords("english"))
inspect(docs)

docs <- tm_map(docs, stripWhitespace)
inspect(docs)


#Convert to dataframe with words and frequency against it
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)
set.seed(1234)

#Used scale for displaying all the text in the word cloud
# wordcloud(words = d$word, freq = d$freq, min.freq = 1,
#           max.words=200, scale=c(6,0.25), random.order=FALSE, rot.per=0.45,
#           colors=brewer.pal(8, "Dark2"))

#Wordcloud2
wordcloud2(d, size = 1, minSize = 0, gridSize = 0,
           fontFamily = 'Segoe UI', fontWeight = 'bold',
           #color = 'random-dark', backgroundColor = "white",
           color = brewer.pal(8, "Dark2"), backgroundColor = "white",
           minRotation = -pi/4, maxRotation = pi/4, shuffle = TRUE,
           rotateRatio = 0.4, shape = 'circle', ellipticity = 0.65,
           widgetsize = NULL, figPath = NULL, hoverFunction = NULL)
gc()
