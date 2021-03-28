//
//  ViewController.swift
//  HWS Swift Coding Challenges Tester
//
//  Created by Myron Dulay on 3/27/21.
//


import UIKit

private let reuseIdentifier = "Section1Cell"

class Section1Controller: UITableViewController {
	
	// MARK: - Properties
	
	private var challenges = [Challenge]()
	
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.title = "Section 1"
		configureTableView()
		getSectionDetails()
	}
	
	// MARK: - Helpers
	
	private func configureTableView() {
		view.backgroundColor = .systemBackground
		tableView.register(ChallengesCell.self, forCellReuseIdentifier: reuseIdentifier)
	}

	// MARK: - Actions
	

	@objc func checkAnswer() {
		
		print("DEBUG: check answer here...")
		
	}
	
	// MARK: - Challenges
	
	func getSectionDetails() {
		Service.getChallenges(section: ChallengeBank().section1) { challenges in
			self.challenges = challenges
		}
	}
}


	// MARK: - UITableViewDataSource
extension Section1Controller {
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ChallengesCell
		let challenge = challenges[indexPath.row]
		cell.viewModel = ChallengeViewModel(challenge: challenge)
		return cell
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return challenges.count
	}
	
}




	// MARK: - UITableViewDelegate

extension Section1Controller {
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let controller = AnswerController()
		controller.challenge = challenges[indexPath.row]
		navigationController?.pushViewController(controller, animated: false)
	}

}
