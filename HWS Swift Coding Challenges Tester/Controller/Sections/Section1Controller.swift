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
		self.title = "Section 1"
		view.backgroundColor = .systemBackground
		tableView.register(ChallengesCell.self, forCellReuseIdentifier: reuseIdentifier)
		navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Clear Progress",
																											 style: .plain,
																											 target: self,
																											 action: #selector(clearChallenges))
	}

	// MARK: - Actions
	
	@objc func clearChallenges() {
		UserDefaults.standard.removeObject(forKey: KEY_FINISHED_CHALLENGES)
		finishedChallenges = [:]
		tableView.reloadData()
	}
	
	// MARK: - Challenges
	
	func getSectionDetails() {
		Service.getChallenges(section: ChallengeBank().section1) { challenges in
			self.challenges = challenges
		}
	}
	
	func getFinishedChallenges() {
		if let finishedChallenges = UserDefaults.standard.object(AnsweredChallenges.self, with: KEY_FINISHED_CHALLENGES) {
			self.finishedChallenges = finishedChallenges
		}
	}
		
}


	// MARK: - UITableViewDataSource
extension Section1Controller {
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! ChallengesCell
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

extension Section1Controller {
	
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

extension Section1Controller: AnswerControllerDelegate {
	func didTapDoneOnAnswerController(finishedChallenges: AnsweredChallenges) {
		self.finishedChallenges = finishedChallenges
		tableView.reloadData()
	}
}
