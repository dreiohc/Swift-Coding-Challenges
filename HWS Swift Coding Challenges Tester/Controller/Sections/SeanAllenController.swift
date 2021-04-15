//
//  Section5Controller.swift
//  HWS Swift Coding Challenges Tester
//
//  Created by Myron Dulay on 3/27/21.
//

import UIKit

private let reuseIdentifier = "SeanAllenCell"

class SeanAllenController: UITableViewController {
	
	// MARK: - Properties
	
	private var challenges = [Challenge]()
	private var finishedChallenges = AnsweredChallenges()
	
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configure()
		getSectionDetails()
		getFinishedChallenges()
	}
	
	// MARK: - Helpers
	
	private func configure() {
		self.title = "Sean Allen's"
		view.backgroundColor = .systemBackground
		tableView.register(SeanAllenCell.self, forCellReuseIdentifier: reuseIdentifier)
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Clear Progress",
																											 style: .plain,
																											 target: self,
																											 action: #selector(clearChallenges))
	}

	// MARK: - Actions
	
	@objc func clearChallenges() {
		UserDefaults.standard.removeObject(forKey: KEY_FINISHED_SEAN_ALLEN)
		UserDefaults.standard.removeObject(forKey: KEY_STORED_SEAN_ALLEN)
		finishedChallenges = [:]
		getSectionDetails()
		tableView.reloadData()
	}
	
	func getSectionDetails() {
		
		if let storedChallenges = UserDefaults.standard.object([Challenge].self, with: KEY_STORED_SEAN_ALLEN) {
			self.challenges = storedChallenges
		} else {
			Service.getChallenges(section: "SeanAllen") { challenges in
				let shuffledChallenges = challenges.shuffled()
				self.challenges = shuffledChallenges
				UserDefaults.standard.set(object: shuffledChallenges, forKey: KEY_STORED_SEAN_ALLEN)
			}
		}
	}
	
	func getFinishedChallenges() {
		if let finishedChallenges = UserDefaults.standard.object(AnsweredChallenges.self, with: KEY_FINISHED_SEAN_ALLEN) {
			self.finishedChallenges = finishedChallenges
		}
	}
		
}

	// MARK: - UITableViewDataSource
extension SeanAllenController {
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SeanAllenCell
		let challenge = challenges[indexPath.row]
		let finishedChallenge = finishedChallenges[indexPath.row] ?? false
		cell.accessoryType = finishedChallenge ? .checkmark : .none
		cell.viewModel = ChallengeViewModel(challenge: challenge)
		return cell
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return challenges.count
	}
}

	// MARK: - UITableViewDelegate

extension SeanAllenController {
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let controller = AnswerController()
		controller.challenge = challenges[indexPath.row]
		controller.indexRow = indexPath.row
		controller.finishedChallenges = finishedChallenges
		controller.delegate = self
		navigationController?.pushViewController(controller, animated: true)
	}
}

	// MARK: - AnswerControllerDelegate

extension SeanAllenController: AnswerControllerDelegate {
	func didTapDoneOnAnswerController(finishedChallenges: AnsweredChallenges) {
		self.finishedChallenges = finishedChallenges
		tableView.reloadData()
	}
}
