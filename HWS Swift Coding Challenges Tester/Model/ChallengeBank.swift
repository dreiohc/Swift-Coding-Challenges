//
//  ChallengeBank.swift
//  HWS Swift Coding Challenges Tester
//
//  Created by Myron Dulay on 3/28/21.
//

import Foundation

struct ChallengeBank {
		
	let section1 = """
	[{
	"title": "Are the letters unique?",
	"difficulty": "Easy",
	"question": "Write a function that accepts a String as its only parameter, and returns true if the string has only unique letters, taking letter case into account.",
	"sample": "The string \\"No duplicates\\" should return true. The string \\"abcdefghijklmnopqrstuvwxyz\\" should return true. The string \\"AaBbCc\\" should return true because the challenge is case-sensitive. The String \\"Hello, world\\" should return false because of the double Ls and double Os.",
	"function_placeholder": "func challenge(input: String) -> Bool {",
	"answer": "return Set(input).count == input.count"
	},{

	"title": "Is a string a palindrome?",
	"difficulty": "Easy",
	"question": "Write a function that accepts a String as its only parameter, and returns true if the string reads the same when reversed, ignoring case.",
	"sample": "The string \\"rotator\\" shoud return true. The string \\"Rats live on no evil star\\" should return true. The string \\"Never odd or even\\" should return false; even though the letters are the same in reverse the spaces are in different places. The string \\"Hello, world\\" should return false because it reads \\"dlrow, olleH\\" backwards.",
	"function_placeholder": "func challenge(input: String) -> Bool {",
	"answer": "return input.lowercased().reversed() == Array(input.lowercased())"
	},{

	"title": "Do two strings contain the same characters?",
	"difficulty": "Easy",
	"question": "Write a function that accepts two String parameters, and returns true if they contain the same characters in any order taking into account letter case.",
	"sample": "The strings \\"abca\\" and \\"abca\\" should return true. The strings \\"abc\\" and \\"cba\\" should return true. The strings \\"a1 b2\\" and \\"b 1 a 2\\" should return true. The strings \\"abc\\" and \\"abca\\" should return false. The strings \\"abc\\" and \\"Abc\\" should return false. The strings \\"abc\\" and \\"cbAa\\" should return false.",
	"function_placeholder": "func challenge(string1: String, string2: String) -> Bool {",
	"answer": " "
	},{

	"title": "Does one string contain another",
	"difficulty": "Easy",
	"question": "Write your own version of the contains() method on String that ignores letter case, and without using the existing contains() method.",
	"sample": "The code \\"Hello, world\\".fuzzyContains(\\"Hello\\") should return true. The code \\"Hello, world\\".fuzzyContains(\\"WORLD\\") should return true. The code \\"Hello, world\\".fuzzyContains(\\"Goodbye\\") should return false.",
	"function_placeholder": "extension String {\\n\\nfunc fuzzyContains(_ string: String) -> Bool {",
	"answer": "return self.uppercased().range(of: string.uppercased()) != nil"
	},{

	"title": "Count the characters",
	"difficulty": "Tricky",
	"question": "Write a function that accepts a string, and returns how many times a specific character appears, taking case into account.",
	"sample": "The letter \\"a\\" appears twice in \\"The rain in Spain\\". The letter \\"i\\" appears four times in \\"Mississippi\\". The letter \\"i\\" appears three times in \\"Hacking with Swift\\".",
	"function_placeholder": "func challenge(input: String, character: Character) -> Int {",
	"answer": "return input.reduce(0) {\\n  $1 == character ? $0 + 1 : $0\\n}"
	},{
	
	"title": "Remove duplicate letters from a string",
	"difficulty": "Easy",
	"question": "Write a function that accepts a string as its input, and returns the same string just with duplicate letters removed.",
	"sample": "The string \\"wombat\\" should print \\"wombat\\". The string \\"hello\\" should print \\"helo\\". The string \\"Mississippi\\" should print \\"Misp\\".",
	"function_placeholder": "func challenge(string: String) -> String {",
	"answer": "var used = [Character]()\\nfor letter in string {\\n  if !used.contains(letter) {\\n    used.append(letter)\\n  }\\n}\\nreturn String(used)"
	},{
	
	"title": "Condense whitespace",
	"difficulty": "Easy",
	"question": "Write a function that accepts a string as its input, and returns the same string just with duplicate letters removed.",
	"sample": "The string \\"a[space][space][space]b[space][space][space]c\\" should return \\"a[space]b[space]c\\". The string \\"[space][space][space][space]a\\" should return \\"[space]a\\". The string \\"abc\\" should return \\"abc\\".",
	"function_placeholder": "func challenge(input: String) -> String {",
	"answer": "var seenSpace = false\\nvar returnValue = \\"\\"\\n\\nfor character in input {\\n  if character == \\" \\" {\\n    if seenSpace { continue }\\n    seenSpace = true\\n  } else {\\n    seenSpace = false\\n  }\\n  returnValue.append(character)\\n}\\nreturn returnValue"
	}]
	""".data(using: .utf8)!
	
}


//
//private func challenge14(input: String = "abc", current: String = "") {
//	
//	let strArray = Array(input)
//	let length = strArray.count
//	
//	if length == 0 {
//		print(current)
//	} else {
//		for i in 0..<length {
//			let left = String(strArray[i..<length])
//			let right = String(strArray[i + 1..<length])
//			
//			challenge14(input: left + right, current: current + String(strArray[i]))
//		}
//	}
//}
