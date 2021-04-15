//
//  Constants.swift
//  HWS Swift Coding Challenges Tester
//
//  Created by Myron Dulay on 3/28/21.
//

import Foundation

// MARK: - UserDefaults

let KEY_FINISHED_CHALLENGES_1 = "finished-challenges-1"
let KEY_STORED_CHALLENGES_1 = "stored-challenges-1"

let KEY_FINISHED_SEAN_ALLEN = "finished-sean-allen"
let KEY_STORED_SEAN_ALLEN = "stored-sean-allen"


// MARK: - typealias

typealias AnsweredChallenges = [Int: Bool]
typealias FirestoreCompletion = (Error?) -> Void
