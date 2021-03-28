//
//  AnswerController.swift
//  HWS Swift Coding Challenges Tester
//
//  Created by Myron Dulay on 3/27/21.
//

import UIKit


class AnswerController: UIViewController {
	
	// MARK: - Properties
	
	var challenge: Challenge?
	
	var challengeLabel: UILabel = {
		let label = UILabel()
		label.lineBreakMode = .byWordWrapping
		label.numberOfLines = 0
		return label
	}()
	
	var upperAnswerPlaceholderLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 11)
		label.lineBreakMode = .byWordWrapping
		label.numberOfLines = 0
		return label
	}()
	
	private var lowerPlaceholderLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 11)
		label.lineBreakMode = .byWordWrapping
		label.numberOfLines = 0
		label.text = "\n}"
		return label
	}()
	
	
	private lazy var answerTextView: BasicTextView = {
		let tv = BasicTextView()
		tv.answerPlaceholderText = "Enter your answer here.."
		tv.font = UIFont.systemFont(ofSize: 16)
		return tv
	}()
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configure()
		setupUI()
		
	}
	
	// MARK: - Actions
	
	

	// MARK: - Helpers
	
	private func configure() {
		self.title = "Answer"
		
		view.addSubview(challengeLabel)
		challengeLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor,
													left: view.safeAreaLayoutGuide.leftAnchor,
													right: view.safeAreaLayoutGuide.rightAnchor,
													paddingTop: 10,
													paddingLeft: 8,
													paddingRight: 8)
		
		view.addSubview(upperAnswerPlaceholderLabel)
		upperAnswerPlaceholderLabel.anchor(top: challengeLabel.bottomAnchor,
																			 left: view.safeAreaLayoutGuide.leftAnchor,
																			 right: view.safeAreaLayoutGuide.rightAnchor,
																			 paddingLeft: 8,
																			 paddingRight: 8)
		view.addSubview(answerTextView)
		answerTextView.anchor(top: upperAnswerPlaceholderLabel.bottomAnchor,
													left: view.safeAreaLayoutGuide.leftAnchor,
													right: view.safeAreaLayoutGuide.rightAnchor,
													paddingTop: 10,
													paddingLeft: 10,
													paddingRight: 10)
		
		view.addSubview(lowerPlaceholderLabel)
		lowerPlaceholderLabel.anchor(top: answerTextView.bottomAnchor,
																 left: view.safeAreaLayoutGuide.leftAnchor,
																 bottom: view.safeAreaLayoutGuide.bottomAnchor,
																 right: view.safeAreaLayoutGuide.rightAnchor,
																 paddingTop: 10,
																 paddingLeft: 8,
																 paddingBottom: 8,
																 paddingRight: 8)
		
	}
	
	func setupUI() {
		
		guard let challenge = self.challenge else { return }
		
		challengeLabel.attributedText = attributedStatText(challenge: challenge.question, sample: challenge.sample)
		upperAnswerPlaceholderLabel.text = challenge.upperPlaceholder
	}
	
	func attributedStatText(challenge: String, sample: String?) -> NSAttributedString {
		let attributedText = NSMutableAttributedString(string: challenge, attributes: [.font: UIFont.boldSystemFont(ofSize: 12)])
		attributedText.append(NSAttributedString(string: sample ?? "",
																						 attributes: [.font: UIFont.systemFont(ofSize: 11),
																													.foregroundColor: UIColor.darkGray]))
		
		attributedText.append(NSAttributedString(string: "type your answer below:\n\n",
																						 attributes: [.font: UIFont.systemFont(ofSize: 11)]))
		
		return attributedText
	}
}


// MARK: - Extensions


