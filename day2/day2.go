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
	file, err := os.Open("day2/input.csv")
	if err != nil {
		log.Fatal("Failed to open csv")
	}

	r := csv.NewReader(file)

	lines, err := r.ReadAll()

	return lines, err
}

type movement struct {
	direction string
	value     int
}

func main() {

	//data setup

	d, err := readData()

	if err != nil {
		log.Fatal("error reading csv")
	}

	var moves []*movement

	for _, s := range d {

		i := strings.Join(s, "")
		j := i[:len(i)-2]

		k := i[len(i)-1:]
		v, _ := strconv.Atoi(k)

		m := &movement{
			direction: j,
			value:     v,
		}

		moves = append(moves, m)

	}

	//part 1

	depth := 0
	horz := 0

	for _, v := range moves {

		if v.direction == "forward" {
			horz += v.value
		} else if v.direction == "up" {
			depth -= v.value
		} else if v.direction == "down" {
			depth += v.value
		}
	}

	res := depth * horz

	fmt.Println(res)

	//part 2
	aim := 0
	depth = 0
	horz = 0

	for _, v := range moves {

		if v.direction == "forward" {
			horz += v.value
			depth += aim * v.value
		} else if v.direction == "up" {
			aim -= v.value
		} else if v.direction == "down" {
			aim += v.value
		}
	}

	res = depth * horz

	fmt.Println(res)
}
