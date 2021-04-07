//
//  Service.swift
//  HWS Swift Coding Challenges Tester
//
//  Created by Myron Dulay on 3/28/21.
//

import Foundation

class Service {
	
	static func getChallenges(section: String, completion: ([Challenge]) -> Void) {
		guard let sourcesURL = Bundle.main.url(forResource: section, withExtension: "json") else { fatalError("could not find json") }
		
		do {
			let sectionData = try Data(contentsOf: sourcesURL)
			let decoder = JSONDecoder()
			let section = try decoder.decode([Challenge].self, from: sectionData)
			completion(section)			
		} catch let error {
			print("DEBUG: \(error.localizedDescription)")
			return
		}
		
	}
}
