import pandas as pd

data = pd.read_csv("day1/input.csv", header = None)[0]

#PART 1

counter = 0
ln = len(data) - 1

for i in range(ln):
    if data[i + 1] > data[i]:
        counter += 1

print(counter)

#PART 2

#Resume here