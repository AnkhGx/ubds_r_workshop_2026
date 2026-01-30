library(ggplot2)
gapminder <- read.csv("analysis/data/gapminder_data.csv")

download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/main/episodes/data/gapminder_data.csv", destfile = "data/gapminder_data.csv")

library(ggplot2)
gapminder <- read.csv("data/gapminder_data.csv")
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) + geom_point()

ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp)) + geom_point()

ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, color = continent)) + geom_line() 

ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, group = country, color = continent)) + geom_line() +geom_point()

ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, group = country)) + geom_line(mapping = aes(color = continent)) + geom_point()

ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, group = country)) + geom_point() + geom_line(mapping = aes(color = continent))

# original Plot
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) + geom_point()


# Scaling and alpha
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) + geom_point(alpha = 0.5) + scale_x_log10()

# Use lm method with geom_smooth
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) + geom_point(alpha = 0.5) + scale_x_log10() +geom_smooth(method = "lm", linewidth = 1.5, color = "red")

# Creating a multipanel plot
americas <- gapminder[gapminder$continent == "Americas", ]
ggplot(data = americas, mapping = aes(x = year, y = lifeExp)) + geom_line() + facet_wrap( ~ country) + theme(axis.text.x = element_text(angle = 45))

# Add labels
americas <- gapminder[gapminder$continent == "Americas", ]
ggplot(data = americas, mapping = aes(x = year, y = lifeExp, color = continent)) + geom_line() + facet_wrap( ~ country) + theme(axis.text.x = element_text(angle = 45)) + labs(x = "Year", y = "Life Expectancy", title = "Figure 1", color = "continent") + theme_minimal()

# Export the plot
americas <- gapminder[gapminder$continent == "Americas", ]

life_exp_plot <- ggplot(data = americas, mapping = aes(x = year, y = lifeExp, color = continent)) + geom_line() + facet_wrap( ~ country) + theme(axis.text.x = element_text(angle = 45)) + labs(x = "Year", y = "Life Expectancy", title = "Figure 1", color = "continent") + theme_minimal()

# Export as PNG
ggsave(filename = "analysis/life_exp.png",
       plot = life_exp_plot, 
       width = 12,
       height = 10,
       dpi = 1200,
       units = "cm")
