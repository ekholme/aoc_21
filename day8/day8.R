#https://adventofcode.com/2021/day/8

##PART 1
library(tidyverse)

inp <- readLines(here::here("day8/input.txt"))

segs <- c(2, 4, 3, 7)

inp_list <- str_split(inp, " \\| ") %>%
  transpose() %>%
  map(as.character)

names(inp_list) <- c("x", "y")

count_digits <- function(input, segs) {
  
  i <- str_split(input, " ", simplify = TRUE)
  ints <- map_int(i, str_length)
  
  sum(ints %in% segs)
}

out <- sum(map_int(inp_list$y, ~count_digits(.x, segs)))

##PART 2

tst <- str_split(inp_list$x[1], " ", simplify = TRUE)
lens <- map_int(tst, str_length)

split_simp <- function(input) {
  str_split(input, "", simplify = TRUE)
}

zz <- map(tst, split_simp)

lens <- map_int(zz, length)

z1 <- zz[[which(lens == 2)]]
z4 <- zz[[which(lens == 4)]]
z7 <- zz[[which(lens == 3)]]
z8 <- zz[[which(lens == 7)]]




p1 <- tst[str_length(tst) == 2]
p4 <- tst[str_length(tst) == 4]
p7 <- tst[str_length(tst) == 3]
p8 <- tst[str_length(tst) == 7]

p74 <- unique(c(str_split(p4, "", simplify = TRUE), str_split(p7, "", simplify = TRUE)))


