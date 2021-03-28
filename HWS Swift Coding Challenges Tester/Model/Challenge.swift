//
//  Challenge.swift
//  HWS Swift Coding Challenges Tester
//
//  Created by Myron Dulay on 3/27/21.
//

import Foundation

struct Challenge: Codable {
	let title: String
	let difficulty: String
	let question: String
	let sample: String
	let functionPlaceholder: String
	let answer: String
	
	
	enum CodingKeys: String, CodingKey {
		case title
		case difficulty
		case question
		case sample
		case functionPlaceholder = "function_placeholder"
		case answer
		
	}
}
