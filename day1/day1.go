package main

import (
	"encoding/csv"
	"fmt"
	"log"
	"os"
	"strconv"
	"strings"
)

func main() {
	file, err := os.Open("day1/input.csv")
	if err != nil {
		log.Fatal("Failed to open csv")
	}

	r := csv.NewReader(file)

	lines, err := r.ReadAll()
	if err != nil {
		log.Fatal("Failed to read csv")
	}

	d := strings.Join(lines[0], "")
	depth, _ := strconv.Atoi(d)
	counter := 0

	for i := 1; i < len(lines); i++ {
		a := strings.Join(lines[i], "")
		b, _ := strconv.Atoi(a)

		if b > depth {
			counter++
		}
		depth = b
	}

	fmt.Println(counter)
}
