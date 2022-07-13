using Revise
using CSV
using DataFrames

inp = CSV.read("day2/input.csv", DataFrame, header = 0)

## part 1

frwd = sum(filter(:Column1 => ==("forward"), inp)[:,2])
up = sum(filter(:Column1 => ==("up"), inp)[:,2])
down = sum(filter(:Column1 => ==("down"), inp)[:, 2])

res1 = frwd * (down - up)

res1

## part 2

aim = 0
depth = 0
horz = 0

for i in 1:nrow(inp)

    if inp[i, 1] == "forward"
        global horz += inp[i, 2]
        global depth += aim * inp[i, 2]
    elseif inp[i, 1] == "up"
        global aim -= inp[i, 2]
    else inp[i, 1] == "down"
        global aim += inp[i, 2]
    end
end

res2 = depth * horz

res2
    