import Foundation


// MARK: - Challenge

func challenge(input: String) -> (vowelCount: Int, consonantCount: Int) {
	let vowels = "aeiou"
	let consonants = "bcdfghjklmnpqrstvwxyz"
	var vowelCount = 0
	var consonantCount = 0
	for letter in input.lowercased() {
		if vowels.contains(letter) {
			vowelCount += 1
		} else if consonants.contains(letter) {
			consonantCount += 1 }
	}
	return (vowelCount, consonantCount)
}

challenge(input: "sssase") // 2: currentLetter = s, letterCounter = 2, returnValue = s1s2

// MARK: - Playground



// MARK: - Converter

let doubleQuote = """
\\\\"\\\\"
"""

let singleQuote = """
\"\"
"""


func convertToSinglineLine(input: String) -> String {
	return input.replacingOccurrences(of: "\n", with: "\\\\n")
	
}


let question = """
let vowels = "aeiou"
let consonants = "bcdfghjklmnpqrstvwxyz"
var vowelCount = 0
var consonantCount = 0
for letter in input.lowercased() {
	if vowels.contains(letter) {
		vowelCount += 1
	} else if consonants.contains(letter) {
		consonantCount += 1
	}
}
return (vowelCount, consonantCount)
"""

let sample = """
The string \\"abcde\\" and \\"eabcd\\" should return true. The string \\"abcdde\\" and \\"cdeab\\" should return true. the string \\"abcde\\" and \\"abced\\" should return false; this is not a string rotation. The string \\"abc\\" and \\"a\\" should return false; this is not a string rotation.
"""

//print(convertToSinglineLine(input: question))


