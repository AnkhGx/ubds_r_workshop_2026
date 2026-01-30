# My first function
fahr_to_kelvin <- function(temp) {
  kelvin <- ((temp -32) * (5/9)) + 273.15
  return(kelvin)
}
fahr_to_kelvin(32)
fahr_to_kelvin(212)

# Combining different functions
kelvin_to_celsius <- function(temp){
  celsius <- temp - 273.15
  return(celsius)
}
kelvin_to_celsius(300)

fahr_to_celsius <- function(temp){
  temp_k <- fahr_to_kelvin(temp)
  temp_c <- kelvin_to_celsius(temp_k)
  return(temp_c)
}
fahr_to_celsius(32)


#
fahr_to_kelvin("100")

fahr_to_kelvin <- function(temp){
  if (is.numeric(temp)) {
    stop("temp must be a numeric vector.")
  }
  kelvin <- ((temp - 32) * (5/9)) + 273.15
  return(kelvin)
}
fahr_to_kelvin("100")

print("hello")

# Using stopifnot()
fahr_to_kelvin <- function(temp){
  stopifnot(is.numeric(temp))
  kelvin <- ((temp - 32)* (5/9)) + 273.15
  return(kelvin)
}
fahr_to_kelvin("100")

# complex functions
calcGDP <- function(dat){
  gdp <- dat$pop * dat$gdpPercap
  return(gdp)
}
head(gapminder)
calcGDP(head(gapminder))

# Adding more arguments
calcGDP <- function(dat, year = NULL, country = NULL){
  if(!is.null(year)){
    dat <- dat[dat$year %in% year, ]
  }
  if(!is.null(country)){
    dat <- dat[dat$country %in% country, ]
  }
  gdp <- dat$pop * dat$gdpPercap
  new <- cbind(dat, gdp = gdp)
  return(new)
}
head(calcGDP(gapminder, country = "Australia"))

head(calcGDP(gapminder, country = "Australia", year = 2007))

# Sum 5 numbers
sum()
sum_my_numbers <- function(x){
  y <- sum(x)
  z <- mean(x)
  yz <- c(y,z)
  return(yz)
}
x <- c(1,2,3,4,5)
sum_my_numbers(x)

head(gapminder)
unique(gapminder$country)
