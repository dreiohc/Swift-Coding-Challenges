//
//  Service.swift
//  HWS Swift Coding Challenges Tester
//
//  Created by Myron Dulay on 3/28/21.
//

import Foundation

class Service {
	
	static func getChallenges(section: Data, completion: ([Challenge]) -> Void) {
		do {
			let section = try JSONDecoder().decode([Challenge].self, from: section)
			completion(section)
		} catch let error {
			print("DEBUG: error decoding section \(error)")
		}
	}
}
