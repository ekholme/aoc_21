#https://adventofcode.com/2021/day/2

##PART 1
inp <- read.csv(here::here("day2/input.csv"), header = FALSE)

x <- unlist(inp)

nms <- gsub(" \\d+", "", x)
vals <- as.numeric(gsub("\\D+", "", x))

names(vals) <- nms

y <- sum(vals[names(vals) == "forward"]) * (sum(vals[names(vals) == "down"]) - sum(vals[names(vals) == "up"]))


