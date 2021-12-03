#https://adventofcode.com/2021/day/3

##PART 1

library(tidyverse)

inp <- scan(here::here("day3/input.R"), what = "character")

dig_len <- nchar(inp[1])

get_digit <- function(x, n) {
  as.integer(str_sub(x, n, n))
}

dig_df <- map_dfc(seq_len(dig_len), ~get_digit(inp, .x))

gam_bin <- dig_df %>%
  summarize(across(everything(), function(x) round(sum(x)/1000))) %>%
  t() %>%
  .[,1] %>%
  as.character() %>%
  paste0(collapse = "")

gam_int <- strtoi(gam_bin, base = 2)

ep_bin <- str_replace_all(gam_bin, c("0" = "2", "1" = "0", "2" = "1"))

ep_int <- strtoi(ep_bin, base = 2)

gam_int*ep_int

##PART 2

m <- as.matrix(dig_df)
n <- nrow(m)
j <- 1
zz <- list()

##refactor to get most common digit

while (n > 1) {
  
  ones <- length(m[, j][m[, j] == 1])
  zeroes <- length(m[, j][m[, j] == 0])
  
  dig <- if (ones >= zeroes) 1 else 0
  
  # scaled <- sum(m[, j])/n
  # 
  # scaled <- if (scaled >= .5) 1 else scaled
  # 
  # dig <- round(scaled)
  
  m <- m[m[, j] == dig, ]
  
  n <- nrow(m)
  
  cat("rows remaining: ", n)

  j <- j + 1
  
  
}

ox_rating <- strtoi(paste0(as.character(m), collapse = ""), base = 2)

#resetting for co2 rating
m <- as.matrix(dig_df)
n <- nrow(m)
j <- 1

while (n > 1) {
  
  ones <- length(m[, j][m[, j] == 1])
  zeroes <- length(m[, j][m[, j] == 0])
  
  dig <- if (ones > zeroes) 0 else 1
  
  m <- m[m[, j] == dig, ]
  
  n <- nrow(m)
  
  cat("rows remaining: ", n)
  
  j <- j + 1
  
  
}

co2_rating <- strtoi(paste0(as.character(m), collapse = ""), base = 2)

co2_rating*ox_rating
#not correct right now
