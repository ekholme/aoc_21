#https://adventofcode.com/2021/day/6

x <- c(1,1,1,1,3,1,4,1,4,1,1,2,5,2,5,1,1,1,4,3,1,4,1,1,1,1,1,1,1,2,1,2,4,1,1,1,1,1,1,1,3,1,1,5,1,1,2,1,5,1,1,1,1,1,1,1,1,4,3,1,1,1,2,1,1,5,2,1,1,1,1,4,5,1,1,2,4,1,1,1,5,1,1,1,1,5,1,3,1,1,4,2,1,5,1,2,1,1,1,1,1,3,3,1,5,1,1,1,1,3,1,1,1,4,1,1,1,4,1,4,3,1,1,1,4,1,2,1,1,1,2,1,1,1,1,5,1,1,3,5,1,1,5,2,1,1,1,1,1,4,4,1,1,2,1,1,1,4,1,1,1,1,5,3,1,1,1,5,1,1,1,4,1,4,1,1,1,5,1,1,3,2,2,1,1,1,4,1,3,1,1,1,2,1,3,1,1,1,1,4,1,1,1,1,2,1,4,1,1,1,1,1,4,1,1,2,4,2,1,2,3,1,3,1,1,2,1,1,1,3,1,1,3,1,1,4,1,3,1,1,2,1,1,1,4,1,1,3,1,1,5,1,1,3,1,1,1,1,5,1,1,1,1,1,2,3,4,1,1,1,1,1,2,1,1,1,1,1,1,1,3,2,2,1,3,5,1,1,4,4,1,3,4,1,2,4,1,1,3,1)

##Part 1

gen_fish <- function(x, len = 80) {
  
  j <- x
  
  for (i in seq_len(len)) {
    
    j <- j - 1
    num_new <- length(j[j == -1])
    j <- replace(j, j == -1, 6)
    j <- append(j, rep(8, num_new))
    
    cat("There are currently ", length(j), " fish\n")
    
  }
  
  return(j)
  
}

y <- gen_fish(x)

length(y)

##Part 2

library(tidyverse)

xt <- table(x)
inp <- c(0, 0, xt, 0, 0, 0)

xx <- tibble(
  counter = -1:8,
  cur = inp
)

get_big_fish <- function(inp, len) {
  
  total <- c()
  
  for (i in seq_len(len)) {
  inp <- inp %>%
    mutate(nxt = lead(cur))
  
  new <- filter(inp, counter == -1) %>% pull(-1)
  sixes <- inp$nxt[inp$counter == 6] + new
  
  inp <- inp %>%
    mutate(nxt = case_when(
      counter == 6 ~ sixes,
      counter == 8 ~ new,
      counter == -1 ~ 0,
      TRUE ~ nxt
    ),
    cur = nxt)
  
  total <- sum(inp$cur)
  
  cat("There are ", total, "total fish\n")
    
  }
  
  return(total)
}

aa <- get_big_fish(xx, 256)
