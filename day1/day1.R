#https://adventofcode.com/2021/day/1

##PART 1

inp <- read.csv(here::here("day1/input.csv"), header = FALSE)

x <- unlist(inp)

y <- c()

for (i in seq_along(x)) {
  
  y[i] <- x[i + 1] > x[i]
  
}

sum(y, na.rm = TRUE)
