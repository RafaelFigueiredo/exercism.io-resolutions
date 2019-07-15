// Package hamming calculate the Hamming difference between two
// DNA strands.
package hamming

import "errors"

// Distance calculate how many mutations ocurr on 2 dna strands
func Distance(a, b string) (int, error) {
	// variables
	distance := 0

	// check the strand lenghts
	if len(a) != len(b) {
		return 0, errors.New("Strands must be the same lenght")
	}

	// interact on string
	for i, c := range a {
		if string(c) != string(b[i]) {
			distance++
		}
	}
	return distance, nil
}
