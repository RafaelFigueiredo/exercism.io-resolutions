// Two-fer or 2-fer is short for two for one. One for you and one for me

package twofer

import "fmt"

// ShareWith return "One for X, one for me." where X is the name passed as parameter
// If no name is passed as parameter the function will return "One for you, one for me."
func ShareWith(name string) string {
	// For a empty name, change name value to "you". To avoid output string repeating
	if name == "" {
		name = "you"
	}

	// String concatenation using package 'fmt'
	return fmt.Sprintf("One for %s, one for me.", name)
}
