## Script to reproduce Figure 4 in R
# -----------------------------------------------------------------------
# Influence of baseball construction on the increase in offensive
# statistics in the Mexican baseball league
# Juan Carlos Torres-Galván, Orlando Guarneros García, Francisco Oviedo-Tolentino
# Jaime Meade Collins, Edgar Guevara
# -----------------------------------------------------------------------

## Boxplots of the ERA and HR's per Game in each year in 
## Mexican baseball league



# Data was obtained by the web site of the Mexican baseball league


library(ggplot2)

## Obtaining the figure of HR's per Game

HRperGame <- read.csv('HRperGame.csv')
HRperGameMeans <- (colMeans(HRperGame, na.rm = TRUE))
HRperGameMeans





jpeg("Fig4a.jpg", width=10, height=5, units="in", res=900)
boxplot(HRperGame,
        names = c("2011", "2012", "2013",
                  "2014", "2015", "2016",
                  "2017", "2018", "2019",
                  "2021"),
        col = "white",
        xlab = "Year",
        ylab = "HR's per Game")
stripchart(HRperGame,
           vertical = TRUE,
           method = "jitter",
           pch = 19, add = TRUE,
           col = c("#B52735", "#B52735",
                   "#B52735", "#B52735",
                   "#B52735", "#B52735",
                   "#B52735", "#B52735",
                   "#6DA74B", "#B52735"))
lines(HRperGameMeans, col="darkgrey", lwd=4)
dev.off()

## Obtaining the figure of ERA by year

ERAperYear <- read.csv('ERAperYear.csv')
ERAperYearMeans <- (colMeans(ERAperYear, na.rm = TRUE))
ERAperYearMeans


jpeg("Fig4b.jpg", width=10, height=5, units="in", res=900)
boxplot(ERAperYear,
        names = c("2011", "2012", "2013",
                  "2014", "2015", "2016",
                  "2017", "2018", "2019",
                  "2021"),
        col = "white",
        xlab = "Year",
        ylab = "HR's per Game")
stripchart(ERAperYear,
           vertical = TRUE,
           method = "jitter",
           pch = 19, add = TRUE,
           col = c("#B52735", "#B52735",
                   "#B52735", "#B52735",
                   "#B52735", "#B52735",
                   "#B52735", "#B52735",
                   "#6DA74B", "#B52735"))
lines(ERAperYearMeans, col="darkgrey", lwd=4)
dev.off()
