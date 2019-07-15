//Package bob implements a side exercise from exercism.io
package bob

import (
	"log"
	"regexp" // Used for regular expressions
)

// A slice of patterns {regex, aswer}
var patterns = []struct {
	regex  string
	answer string
}{
	{`^[A-Z0-9,\s]+[^a-z][A-Z0-9!@#$%¨&*^(\s]*[A-Z!]$`, "Whoa, chill out!"},
	{`^[A-Z0-9,\s]+[^a-z][A-Z0-9!@#$%¨&*^(\s]*[A-Z!][?]$`, "Calm down, I know what I'm doing!"},
	{`[\?]+[\s]*$`, "Sure."},
	{`(^$)|(^[\t\s\0]*$)`, "Fine. Be that way!"},
}

// Hey function return the Bob's answer.
func Hey(remark string) string {

	// For each pattern verify if match the remark
	for _, pattern := range patterns {
		matched, err := regexp.Match(pattern.regex, []byte(remark))
		if err != nil {
			log.Fatal(err)
		}
		//If match return the answer
		if matched {
			return pattern.answer
		}
	}

	// Else return Whatever.
	return "Whatever."
}
