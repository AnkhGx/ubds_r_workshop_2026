library(ggplot2)
gapminder <- read.csv("analysis/data/gapminder_data.csv")

download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/main/episodes/data/gapminder_data.csv", destfile = "data/gapminder_data.csv")

library(ggplot2)
gapminder <- read.csv("data/gapminder_data.csv")

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) + geom_point()
