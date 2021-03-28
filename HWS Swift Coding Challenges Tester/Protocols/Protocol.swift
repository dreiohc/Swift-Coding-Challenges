//
//  Protocol.swift
//  HWS Swift Coding Challenges Tester
//
//  Created by Myron Dulay on 3/27/21.
//

import Foundation

protocol SectionDelegate: class {
	func saveChallenge(challenge: Challenge)
}
