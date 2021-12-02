#https://adventofcode.com/2021/day/2

##PART 1
inp <- read.csv(here::here("day2/input.csv"), header = FALSE)

x <- unlist(inp)

nms <- gsub(" \\d+", "", x)
vals <- as.numeric(gsub("\\D+", "", x))

names(vals) <- nms

y <- sum(vals[names(vals) == "forward"]) * (sum(vals[names(vals) == "down"]) - sum(vals[names(vals) == "up"]))

##PART 2
library(tidyverse)

#sum of forward will remain the same
f <- sum(vals[names(vals) == "forward"])

df <- tibble(
  cmd = names(vals),
  val = vals
) %>%
  mutate(aim_delta = case_when(
    cmd == "forward" ~ 0,
    cmd == "down" ~ vals,
    cmd == "up" ~ -1*vals
  ),
  aim_cur = cumsum(aim_delta))

depth <- df %>% 
  filter(cmd == "forward") %>%
  mutate(depth = aim_cur*val) %>%
  summarize(sum(depth)) %>%
  pull()

f*depth
