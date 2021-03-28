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
	"sample": "The string 'No duplicates' should return true. The string 'abcdefghijklmnopqrstuvwxyz' should return true. The string 'AaBbCc' should return true because the challenge is case-sensitive. The String 'Hello, world' should return false because of the double Ls and double Os.",
	"function_placeholder": "func challenge(input: String) -> Bool {",
	"answer": "return Set(input).count == input.count"
	},{
	"title": "Is a string a palindrome?",
	"difficulty": "Easy",
	"question": "Write a function that accepts a String as its only parameter, and returns true if the string reads the same when reversed, ignoring case.",
	"sample": "sample 2",
	"function_placeholder": "func challenge(input: String) -> Bool {",
	"answer": "return input.lowercased().reversed() == Array(input.lowercased())"
	},{
	"title": "Do two strings contain the same characters?",
	"difficulty": "Easy",
	"question": "question 3",
	"sample": "sample 3",
	"function_placeholder": "function 3",
	"answer": "answer 3"
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
