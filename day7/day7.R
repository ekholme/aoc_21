#https://adventofcode.com/2021/day/7

#PART 1
input <- strsplit(readLines(here::here("day7/input.txt")), split = ",") |>
  unlist() |>
  as.numeric()

med <- median(input)

y <- sum(abs(input - med))

#PART 2
loss_fn <- function(y, x) {
  loss <- c()
  
  for (i in seq_len(length(x))) {
    loss[i] <- ((x[i]-y)^2 + (abs(x[i] - y)))/2
  }
  
  sum(loss)
}

o <- optimize(loss_fn, interval = range(input), x = input)

loss_fn(floor(o$minimum), input)
