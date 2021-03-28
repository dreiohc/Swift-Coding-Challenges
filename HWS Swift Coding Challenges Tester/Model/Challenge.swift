//
//  Challenge.swift
//  HWS Swift Coding Challenges Tester
//
//  Created by Myron Dulay on 3/27/21.
//

import Foundation

struct Challenge {
	let question: String
	let sample: String
	let answer: String
	let upperPlaceholder: String
	let lowerPlaceholder: String
	
	init(question: String, sample: String, answer: String, upperPlaceholder: String, lowerPlaceholder: String) {
		self.question = question
		self.sample = sample
		self.answer = answer
		self.upperPlaceholder = upperPlaceholder
		self.lowerPlaceholder = lowerPlaceholder
	}
}
