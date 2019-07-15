//Package scrabble implements e exercise "Given a word, compute the scrabble score for that word."
package scrabble

import "strings"

var scores = []struct {
	letters string
	value   int
}{
	{"AEIOULNRST", 1},
	{"DG", 2},
	{"BCMP", 3},
	{"FHVWY", 4},
	{"K", 5},
	{"JX", 8},
	{"QZ", 10},
}

// Score compute the scrabble score for that word.
func Score(word string) (score int) {
	// Map to upper case because our rules are in upper case
	word = strings.ToUpper(word)

	// For each caracter of each rule
	for _, rule := range scores {
		for _, caracter := range rule.letters {
			// Add to score how many points
			score += rule.value * strings.Count(word, string(caracter))
		}
	}
	return score
}
