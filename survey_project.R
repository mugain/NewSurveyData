#Title: R survey Project

#install and load library
install.packages("dplyr")
library(dplyr)

#visualization with ggplot2
install.packages("ggplot2")

#download data set
download.file("http://files.figshare.com/2236372/combined.csv",  "data/portal_data_joined.csv")
#import a file
surveys <- read.csv('data/portal_data_joined.csv')
#filter to narrow to one year
filter(surveys, year ==1995)
#selet columns
select(surveys, plot_id, taxa, weight)
#filter to one taxa
filter(surveys, year ==1995, taxa == Rodent)
# re-install ggplot library
install.packages("ggplot2")
library(ggplot2)
#make scatter plot for relationship of mnth to weight
ggplot(data=surveys, aes(x=month, y=weight)) + geom_point()
ggsave("figures/figure1.pdf")
# make box plot to compare weight disribution of different sexes
select(surveys, species_id, sex, weight)
ggplot(data=surveys, aes(x=sex, y=weight)) + geom_boxplot()
ggsave("figures/figure2.pdf")
# make scater plot of weight distribution of the rodent species
ggplot(data=surveys, aes(x=weight, y=species)) +geom_point()
ggsave("figures/figure3.pdf")
# preform anova test of corrilation of weight to species
fit <- aov(weight ~ species_id, data=surveys)
summary(fit)
