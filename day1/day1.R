#https://adventofcode.com/2021/day/1

##PART 1

inp <- read.csv(here::here("day1/input.csv"), header = FALSE)

x <- unlist(inp)

y <- c()

for (i in seq_along(x)) {
  
  y[i] <- x[i + 1] > x[i]
  
}

sum(y, na.rm = TRUE)

##PART 2

z <- c()

for (i in 4:length(x)) {
  
  z[i] <- sum(x[(i-2):i], na.rm = TRUE) > sum(x[(i-3):(i-1)], na.rm = TRUE)
  
}

sum(z, na.rm = TRUE)
