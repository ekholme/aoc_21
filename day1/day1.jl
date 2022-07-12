using Revise
using CSV
using DataFrames

df = CSV.read("day1/input.csv", DataFrame, header = 0)

col = df[:, 1]

## part 1

counter = 0
ln = length(col) - 1

for i in 1:ln
    if col[i] < col[i+1]
        global counter += 1
    end
end

counter

## part 2

counter = 0
ln = length(col) - 3

for i in 1:ln
    a = sum(col[i:i+2])
    b = sum(col[i+1:i+3])

    if b > a
        global counter += 1
    end
end

counter