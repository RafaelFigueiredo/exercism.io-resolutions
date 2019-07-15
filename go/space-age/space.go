package space

type Planet string

const earthYear = 31557600

func Age(seconds float64, planet Planet) (age float64) {
	switch planet {
	case "Earth":
		age = seconds / earthYear

	case "Mercury":
		age = seconds / (earthYear * 0.2408467)

	case "Venus":
		age = seconds / (earthYear * 0.61519726)

	case "Mars":
		age = seconds / (earthYear * 1.8808158)

	case "Jupiter":
		age = seconds / (earthYear * 11.862615)

	case "Saturn":
		age = seconds / (earthYear * 29.447498)

	case "Uranus":
		age = seconds / (earthYear * 84.016846)

	case "Neptune":
		age = seconds / (earthYear * 164.79132)

	}

	return age
}
