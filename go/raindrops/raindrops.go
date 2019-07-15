/*
Package raindrops convert a number to a string, the contents of which depend on the number's factors.
If the number has 3 as a factor, output 'Pling'.
If the number has 5 as a factor, output 'Plang'.
If the number has 7 as a factor, output 'Plong'.
If the number does not have 3, 5, or 7 as a factor, just pass the number's digits straight through.*/
package raindrops

import (
	"fmt"
	"sort"
	"strconv"
)

// Convert transform a int in a phrase
func Convert(number int) string {

	mapValues := map[int]string{3: "Pling", 5: "Plang", 7: "Plong"}

	// populate a slice of keys to ordered range on map
	var keys []int
	for k := range mapValues {
		keys = append(keys, k)
	}
	sort.Ints(keys)

	// Test cases that convert and append the value to 'text'
	text := ""
	for _, k := range keys {
		if number%k == 0 {
			text = fmt.Sprintf("%s%s", text, mapValues[k])
		}
	}

	// If no pattern match return the number
	if text == "" {
		return strconv.Itoa(number)
	}

	return text
}
