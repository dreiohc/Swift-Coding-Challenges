//
//  AnswerController.swift
//  HWS Swift Coding Challenges Tester
//
//  Created by Myron Dulay on 3/27/21.
//

import UIKit

protocol AnswerControllerDelegate: class {
	func didTapDoneOnAnswerController(finishedChallenges: AnsweredChallenges)
}

class AnswerController: UIViewController {
	
	// MARK: - Properties
	
	var challenge: Challenge?
	var finishedChallenges = [Int: Bool]()
	var indexRow = 0
	weak var delegate: AnswerControllerDelegate?
	
	private lazy var titleBarLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.font = UIFont.boldSystemFont(ofSize: 16.0)
		label.textAlignment = .center
		return label
	}()
	
	private lazy var submitAnswerBarButton: UIButton = {
		let button = UIButton(type: .system)
		button.setTitle("Submit", for: .normal)
		button.sizeToFit()
		button.addTarget(self, action: #selector(didTapSubmitAnswer), for: .touchUpInside)
		return button
	}()
	
	var challengeLabel: UILabel = {
		let label = UILabel()
		label.lineBreakMode = .byWordWrapping
		label.numberOfLines = 0
		return label
	}()
	
	var functionPlaceholderLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 11)
		label.lineBreakMode = .byWordWrapping
		label.numberOfLines = 0
		return label
	}()
	
	private lazy var answerTextView: BasicTextView = {
		let tv = BasicTextView()
		tv.answerPlaceholderText = answerPlaceholderAttributedText(placeholder: "Enter your answer here and tap ", buttonTitle: "Submit")
		tv.font = UIFont.systemFont(ofSize: 11)
		return tv
	}()
	
	private var lowerPlaceholderLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 11)
		label.lineBreakMode = .byWordWrapping
		label.numberOfLines = 0
		label.text = "\n}"
		return label
	}()
	
	private let resultLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.boldSystemFont(ofSize: 17)
		label.textAlignment = .center
		label.textColor = .systemRed
		return label
	}()

	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configure()
		hideKeyboardWhenTappedAround()
		setupUI()
	}
	
	// MARK: - Actions
	
	@objc func didTapSubmitAnswer() {
		
		guard let challenge = self.challenge else { return }
		
		if challenge.answer == answerTextView.text {
			resultLabel.textColor = .systemGreen
			resultLabel.text = "CORRECT!"
			finishedChallenges[indexRow] = true
			UserDefaults.standard.set(object: finishedChallenges, forKey: KEY_FINISHED_CHALLENGES)
			delegate?.didTapDoneOnAnswerController(finishedChallenges: finishedChallenges)
		} else if answerTextView.text.isEmpty {
			resultLabel.text = "Enter your answer first"
		} else {
			resultLabel.text = "Try again.."
		}
		
	}
	

	// MARK: - Helpers
	
	private func configure() {
		titleBarLabel.text = challenge?.title
		navigationItem.titleView = titleBarLabel
		view.backgroundColor = .systemBackground
		view.addSubview(challengeLabel)
		challengeLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor,
													left: view.safeAreaLayoutGuide.leftAnchor,
													right: view.safeAreaLayoutGuide.rightAnchor,
													paddingTop: 10,
													paddingLeft: 8,
													paddingRight: 8)
		
		view.addSubview(functionPlaceholderLabel)
		functionPlaceholderLabel.anchor(top: challengeLabel.bottomAnchor,
																			 left: view.safeAreaLayoutGuide.leftAnchor,
																			 right: view.safeAreaLayoutGuide.rightAnchor,
																			 paddingLeft: 8,
																			 paddingRight: 8)
		view.addSubview(answerTextView)
		answerTextView.anchor(top: functionPlaceholderLabel.bottomAnchor,
													left: view.safeAreaLayoutGuide.leftAnchor,
													right: view.safeAreaLayoutGuide.rightAnchor,
													paddingTop: 5,
													paddingLeft: 10,
													paddingRight: 10)
		
		view.addSubview(lowerPlaceholderLabel)
		lowerPlaceholderLabel.anchor(top: answerTextView.bottomAnchor,
																 left: view.safeAreaLayoutGuide.leftAnchor,
																 right: view.safeAreaLayoutGuide.rightAnchor,
																 paddingTop: -8,
																 paddingLeft: 8,
																 paddingRight: 8)
		
		view.addSubview(resultLabel)
		resultLabel.anchor(top: lowerPlaceholderLabel.bottomAnchor,
											 left: view.safeAreaLayoutGuide.leftAnchor,
											 bottom: view.safeAreaLayoutGuide.bottomAnchor,
											 right: view.safeAreaLayoutGuide.rightAnchor,
											 paddingTop: 10,
											 paddingLeft: 8,
											 paddingBottom: 8,
											 paddingRight: 8)
	
		navigationItem.rightBarButtonItem = UIBarButtonItem(customView: submitAnswerBarButton)
	}
	
	func setupUI() {
		guard let challenge = self.challenge else { return }
		challengeLabel.attributedText = attributedStatText(challenge: challenge.question, sample: challenge.sample)
		functionPlaceholderLabel.text = challenge.functionPlaceholder
	}
	
	func attributedStatText(challenge: String, sample: String?) -> NSAttributedString {
		
		let newLineString = "\n\n"
		let newLineSample = sample?.replacingOccurrences(of: ". ", with: ".\n")
		
		
		let attributedText = NSMutableAttributedString(string: challenge + newLineString, attributes: [.font: UIFont.boldSystemFont(ofSize: 13)])
		attributedText.append(NSAttributedString(string: (newLineSample ?? "") + newLineString,
																						 attributes: [.font: UIFont.systemFont(ofSize: 13),
																													.foregroundColor: UIColor.darkGray]))
		
		return attributedText
	}
	
	func answerPlaceholderAttributedText(placeholder: String, buttonTitle: String) -> NSAttributedString {
		
		
		let attributedText = NSMutableAttributedString(string: placeholder,
																									 attributes: [.font: UIFont.systemFont(ofSize: 11),
																																.foregroundColor: UIColor.systemGreen])
		
		attributedText.append(NSAttributedString(string: buttonTitle,
																						 attributes: [.font: UIFont.boldSystemFont(ofSize: 12),
																													.foregroundColor: UIColor.systemGreen]))
		
		attributedText.append(NSAttributedString(string: "...",
																						 attributes: [.font: UIFont.systemFont(ofSize: 11),
																													.foregroundColor: UIColor.systemGreen]))
		
		return attributedText
	}
}


// MARK: - Extensions



