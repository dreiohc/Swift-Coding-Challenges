//
//  ChallengeViewModel.swift
//  HWS Swift Coding Challenges Tester
//
//  Created by Myron Dulay on 3/28/21.
//

import Foundation

struct ChallengeViewModel {
	
	private let challenge: Challenge
	
	var title: String {
		return challenge.title
	}
	
	var question: String {
		return challenge.question
	}
	
	var sample: String {
		return challenge.sample
	}
	
	var functionPlaceholder: String {
		return challenge.functionPlaceholder
	}
	
	var answer: String {
		return challenge.answer
	}
	
	var difficulty: String {
		return challenge.difficulty
	}
	
	init(challenge: Challenge) {
		self.challenge = challenge
	}
}

