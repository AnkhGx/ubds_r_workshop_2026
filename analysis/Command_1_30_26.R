x <- c(3,4,6,7,8)
x

# Naming a vector
name(x) <- c("a","b","c","d","e")
x

# Accessing value by index
x[1]

x[3:5]

x[c(3,4,5)]

# Index out of value length
x[7]

# Negative index
x[-2]

x[c(-1,-5)]
x[-1:5]

-1:5
c(-1,-5)

# Saving a sliced vectors
x <- x[-4]

x

# slice this vector to remove value at 3rd and 4th position
x <- c(1.1,2.5,6.4,8.7)
names(x) <- c("a","b","c","d")
x

# Solution
x[1:2]
x[c(-3,-4)]
x[c(1,2)]

# Access values from x using names
x[c("a","c")]

# Access values from x using LOGICAL value (TRUE/FALSE)

x[c("TRUE","FALSE","TRUE","FALSE")]

x[c(TRUE,FALSE,TRUE,FALSE)]

# Subset using logical operators (<,>,==)

x
x > 5
x[x>5]

x[x < 2]

x[x == 2]

x

x[x == 2.5]

names(x) == "c"
x[names(x) == "c"]

# More LOGICAL operators & and |

# Using & (AND) operator

x > 2 & x < 8
x[x > 2 & x < 8]

# Using !(NOT) operator

x
x >2
! x > 2

x[x > 2]
x[! x > 2]

# all() and any()

all(x > 2)
any(x > 2)

# Non-unique names

x <- 1:8
x
names(x) <- c("a","a","a","b","c","d")
x

x[names(x) == "a"]

# Using - (negative) operator for names
x
x[-7]
x[-"a"]
x["a"]

x
x[names(x) == "a"]
x[!names(x) == "a"]

x[names(x) == c("a","b","c")]

# != (NOT EQUAL) operator
x[names(x) != c("a","b","c")]

# Recycling vectors
names(x) == c("a","d")
length(names(x))
length(c("a","c"))

names(x)
names(x) == c("a","c")

# %in% operator
names(x) %in% c("a","c")

x[names(x) %in% c("a","c")]

# Data type: factors

f <- factor(c("a","a","b","c","c","d"))
f

f[f %in% c("b","c")]

f[-3]

# Matrix
set.seed(1)

m <- matrix(rnorm(6*4),ncol=4, nrow=6)
m

m[3:4,c(1,2)]

m[3,]
m[4,]
m[3, , drop = FALSE]

m[6]
m

m2 <- matrix(1:24,ncol = 4, nrow = 6)
m2
m2[8]

m2 <- matrix(1:24, ncol = 4, nrow = 6, byrow = TRUE)
m2
m[8]

# List
xlist <- list(a = "Software Carpentry",
              b = 1:10,
              data = head(mtcars))
xlist

xlist[1:2]

xlist[[1:2]]

xlist[[2]]
xlist[[2]][1]

xlist[["a"]]
xlist[["b"]]

xlist$data

# Sybsetting dataframe
gapminder <- read.csv("commands.R")
head(gapminder)

head(gapminder[["pop"]])
head(gapminder[["pop"]])

gapminder[,1:3]

gapminder[gapminder$lifeExp > 80,]

# if statement

x <- 8
if (x >= 10) {
  print("x is greater than or equal to 10")
}

# if...else statement
if (x >= 10){
  print("x is greater than or equol to 10")
} else {
  print("x is less than 10")
}

# Multiple testing conditions

if (x >= 10) {
  print("x is greater than or equol to 10")
} else if (x > 5) {
  print("x is greater than 5, but less than 10")
} else {
  print("x is 5 or less")
}

# "Use logical values directly
x <- 4 == 3
if (x) {
  print("4 equols 3")
} else {
  print("4 does not equol 3")
}

# ifelse function
y <- -3
ifelse(y < 0,"y is a negative number", "y is either positive or zero")

# multiple logicals
x <- c(TRUE, TRUE, FALSE)
if (x) {
  print("x is TURE")
}

if (any(x)) {
  print("At least one value of x is TRUE")
}
if (all(x)) {
  print("All of the values of x are TRUE")
}

# for loop
for (i in 1:10) {
  print(i)
}

# nested for loops
for (i in 1:5) {
  for (j in c("a","b","c","d","e")) {
    print(paste(i,j))
  }
}

output_vector <- c()
for (i in 1:5) {
  for (j in c("a", "b","c","d","e")) {
    temp_output <- paste(i,j)
    output_vector <- c(output_vector, temp_output)
  }
}
output_vector

# predefining the output size saves computational resources

output_matrix <- matrix(nrow = 5, ncol =5)
j_vector <- c("a","b","c","d","e")
for (i in 1:5) {
  for (j in 1:5) {
    temp_j_value <- j_vector[j]
    temp_output <- paste(i, temp_j_value)
    output_matrix[i,j] <- temp_output
  }
}
output_matrix
output_vector2 <- as.vector(output_matrix)
output_vector2

# While loops
z <- 1
while (z > 0.1) {
  z <- runif(1)
  cat(z,"\n")
}
