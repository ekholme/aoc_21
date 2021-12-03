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
