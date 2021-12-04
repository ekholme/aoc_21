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

get_mode <- function(col, fun, tie) {
  
  tb <- table(col)
  
  ret <- if (tb[1] == tb[2]) {
    tie
  } else if (fun == "max") {
    names(which.max(tb))
  } else {
    names(which.min(tb))
  }
  
  return(ret)
}


calc_gas <- function(m, fun, tie) {
  mat <- m
  n <- nrow(mat)
  i <- 1
  
  while(n > 1) {
    a <- as.integer(get_mode(mat[, i], fun, tie))
    mat <- mat[mat[, i] == a, , drop = FALSE]
    n <- nrow(mat)
    i <- i +1
  }
  
  return(mat)
}

aaa <- calc_gas(m, "max", "1")
ox_rating <- strtoi(paste0(as.character(aaa), collapse = ""), base = 2)

bbb <- calc_gas(m, "min", "0")
co2_rating <- strtoi(paste0(as.character(bbb), collapse = ""), base = 2)

ox_rating*co2_rating

