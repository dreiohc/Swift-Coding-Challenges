//
//  Constants.swift
//  HWS Swift Coding Challenges Tester
//
//  Created by Myron Dulay on 3/28/21.
//

import Foundation

// MARK: - UserDefaults

let KEY_FINISHED_CHALLENGES = "finished-challenges"
let KEY_STORED_CHALLENGES = "stored-challenges"


// MARK: - typealias

typealias AnsweredChallenges = [Int: Bool]
typealias FirestoreCompletion = (Error?) -> Void
