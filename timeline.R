# My data science learning Timeline
#setwd("/Users/pacha/bowie-timeline/")
library(plyr)
library(RCurl)
library(rCharts)

discography<- read.csv("discography.csv", as.is = TRUE)
discography <- alply(discography, 1, function(x) {
  list(startDate = x$Start.Date, headline = x$Headline, text = x$Text, asset = list(media = x$Media))
})

tl = Timeline$new()
#tl$main(headline = paste0("Riad Darawish"), type = "default", text = paste0("Discography ", 
#        format(as.Date("2014-01-01"), "%Y"), "-", format(as.Date("2018-01-01"), "%Y")), 
#startDate = format(as.Date("2014-01-01"), "%Y"), asset = list(media = "img/cover.jpg"))

tl$main(headline = paste0("Riad Darawish"), type = "default", text = paste0("Data Science Learning and Experience Journey ", 
                                            format(as.Date("2014-01-01"), "%Y"), "-", format(as.Date("2018-01-01"), "%Y")), 
        startDate = format(as.Date("2014-01-01"), "%Y") )


names(discography) <- NULL
tl$event(discography)

tl$save("index.html")

# Modify JS Path
js <- paste(readLines("index.html", warn = F), collapse = "\n")
js <- gsub("/Library/Frameworks/R.framework/Versions/3.2/Resources/library/rCharts/libraries/timeline/js/storyjs-embed.js", 
           "timeline/js/storyjs-embed.js", 
           js)
writeLines(js, con = "index.html")

?Timeline()

?alply()

