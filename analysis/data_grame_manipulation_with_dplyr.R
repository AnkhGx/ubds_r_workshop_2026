library(dplyr)
gapminder <- read.csv("./data/gapminder_data.csv")
mean(gapminder$gdpPercap[gapminder$continent == "Africa"])
mean(gapminder$gdpPercap[gapminder$continent == "Americas"])

# Select() function
year_country_gdp <- dplyr::select(gapminder, year, country, gdpPercap)
head(year_country_gdp)

smaller_gapminder_data <- select(gapminder, -continent)
head(smaller_gapminder_data)

# dplyr pipes
year_country_gdp <- gapminder %>% select(year, country, gdpPercap)
head(year_country_gdp)

# Rename()
tidy_gdp <- year_country_gdp %>% rename(gdp_per_capita = gdpPercap)
head(tidy_gdp)

# filter()
# Filter the countries in Europe and select by year, country and gdpPercap
year_country_gdp_euro <- gapminder %>% filter(continent == "Europe") %>%
  select(year, country, gdpPercap)
head(year_country_gdp_euro)

#  Filter the countries in Europe and during 2007, and select by country and life expectancy
year_country_gdp_euro <- gapminder %>% filter(continent == "Europe", year == 2007) %>%
  select(country, lifeExp)
head(year_country_gdp_euro)

# dplyr-group_by()
str(gapminder)
str(gapminder %>% group_by(continent))

#dplyr-summarize()
# Summarize GDP per catita by continent
gdp_bycontinents <- gapminder %>%
  group_by(continent) %>%
  summarize(mean_gdpPercap = mean(gdpPercap))
gdp_bycontinents

# group_by() multiple variables

gdp_bycontinents_byyear <- gapminder %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap))
head(gdp_bycontinents_byyear)

# Calculate multiple summary statistics
gdp_pop_bycontinents_byyear <- gapminder %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap),
            sd_gdpPercap = sd(gdpPercap),
            mean_pop = mean(pop),
            sd_pop = sd(pop))
head(gdp_pop_bycontinents_byyear, n = 10)

# count() and n() function
gapminder %>%
  filter(year == 2002) %>%
  count(continent, sort = TRUE)

gapminder %>%
  group_by(continent) %>%
  summarize(se_le = sd(lifeExp)/sqrt(n()))

# Mutate function mutate()
gdp_pop_bycontinents_byyear <- gapminder %>%
  mutate(gdp_billion = gdpPercap * pop / 10^9) %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap),
            sd_gdpPercap = sd(gdpPercap),
            mean_pop = mean(pop),
            sd_pop = sd(pop),
            mean_gdp_billion = sd(gdp_billion))
head(gdp_pop_bycontinents_byyear)

# Combining ifesle with mutate
gdp_pop_bycontinent <- gapminder %>%
  mutate(gdp_billion = ifelse(lifeExp > 25, gdpPercap / 10^9), NA) %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap),
            sd_gdpPercap = sd(gdpPercap),
            mean_pop = mean(pop),
            sd_pop = sd(pop),
            mean_gdp_billion = sd(gdp_billion))
head(gdp_pop_bycontinent)

# Combining ggplot and dplyr
gapminder %>%
  filter(continent == "Americas") %>%
  ggplot(mapping = aes(
    x = year, y = lifeExp)) + geom_line() +
  facet_wrap( ~ country) +
  theme(axis.text.x = element_text(angle = 45))
