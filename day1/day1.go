package main

import (
	"encoding/csv"
	"fmt"
	"log"
	"os"
	"strconv"
	"strings"
)

func readData() ([][]string, error) {
	file, err := os.Open("day1/input.csv")
	if err != nil {
		log.Fatal("Failed to open csv")
	}

	r := csv.NewReader(file)

	lines, err := r.ReadAll()

	return lines, err
}

func convertStrings(s [][]string) []int {
	var js []int

	for i := 0; i < len(s); i++ {
		a := strings.Join(s[i], "")
		j, err := strconv.Atoi(a)

		if err != nil {
			log.Fatal("Failed to convert strings to ints")
		}

		js = append(js, j)

	}

	return js
}

func main() {

	//setting up data

	lines, err := readData()
	if err != nil {
		log.Fatal("Failed to read csv")
	}

	data := convertStrings(lines)

	//part 1

	d := data[0]
	counter := 0

	for i := 1; i < len(data); i++ {
		a := data[i]

		if a > d {
			counter++
		}
		d = a
	}

	fmt.Println(counter)

	//part 2

	baseline := data[0] + data[1] + data[2]

	counter = 0

	for i := 1; i < len(data)-2; i++ {
		s := data[i] + data[i+1] + data[i+2]

		if s > baseline {
			counter++
		}

		baseline = s
	}

	fmt.Println(counter)
}
