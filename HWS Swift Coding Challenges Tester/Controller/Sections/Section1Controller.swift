//
//  ViewController.swift
//  HWS Swift Coding Challenges Tester
//
//  Created by Myron Dulay on 3/27/21.
//


import UIKit

enum SelectedButton: Int {
	
	case challenge1
	case challenge2
	case challenge3
	case challenge4
	case challenge5
	case challenge6
	case challenge7
	case challenge8
	case challenge9
	case challenge10
	
	var tag: Int {
		return self.rawValue
	}
}

class Section1Controller: UIViewController {
	
	// MARK: - Properties
	
	private var challenge: Challenge?
	
	weak var delegate: SectionDelegate?
	
	private let button1: BasicButton = {
		let button = BasicButton()
		button.setTitle("Are the letters unique?", for: .normal)
		button.addTarget(self, action: #selector(callAction), for: .touchUpInside)
		return button
	}()
	
	private let button2: BasicButton = {
		let button = BasicButton()
		button.setTitle("Challenge 2", for: .normal)
		button.addTarget(self, action: #selector(callAction), for: .touchUpInside)
		return button
	}()
	
	private let button3: BasicButton = {
		let button = BasicButton()
		button.setTitle("Challenge 3", for: .normal)
		button.addTarget(self, action: #selector(callAction), for: .touchUpInside)
		return button
	}()
	
	private let button4: BasicButton = {
		let button = BasicButton()
		button.setTitle("Challenge 4", for: .normal)
		button.addTarget(self, action: #selector(callAction), for: .touchUpInside)
		return button
	}()
	
	private let button5: BasicButton = {
		let button = BasicButton()
		button.setTitle("Challenge 5", for: .normal)
		button.addTarget(self, action: #selector(callAction), for: .touchUpInside)
		return button
	}()
	
	private let button6: BasicButton = {
		let button = BasicButton()
		button.setTitle("Challenge 6", for: .normal)
		button.addTarget(self, action: #selector(callAction), for: .touchUpInside)
		return button
	}()
	
	private let button7: BasicButton = {
		let button = BasicButton()
		button.setTitle("Challenge 7", for: .normal)
		button.addTarget(self, action: #selector(callAction), for: .touchUpInside)
		return button
	}()
	
	private let button8: BasicButton = {
		let button = BasicButton()
		button.setTitle("Challenge 8", for: .normal)
		button.addTarget(self, action: #selector(callAction), for: .touchUpInside)
		return button
	}()
	
	private let button9: BasicButton = {
		let button = BasicButton()
		button.setTitle("Challenge 9", for: .normal)
		button.addTarget(self, action: #selector(callAction), for: .touchUpInside)
		return button
	}()
	
	private let button10: BasicButton = {
		let button = BasicButton()
		button.setTitle("Challenge 10", for: .normal)
		button.addTarget(self, action: #selector(callAction), for: .touchUpInside)
		return button
	}()
	
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.title = "Section 1"
		configure()
		
		
		
	}
	
	// MARK: - Helpers
	
	private func configure() {
		view.backgroundColor = .systemBackground
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done,
																														 target: self,
																													 action: #selector(checkAnswer))
		let stack = UIStackView(arrangedSubviews: [button1,
																							 button2,
																							 button3,
																							 button4,
																							 button5,
																							 button6,
																							 button7,
																							 button8,
																							 button9,
																							 button10])
		
		stack.axis = .vertical
		stack.distribution = .fillEqually
		stack.spacing = 10
		view.addSubview(stack)
		
		stack.anchor(top: view.safeAreaLayoutGuide.topAnchor,
								 left: view.leftAnchor,
								 bottom: view.safeAreaLayoutGuide.bottomAnchor,
								 right: view.rightAnchor,
								 paddingTop: 10,
								 paddingLeft: 20,
								 paddingBottom: 10,
								 paddingRight: 20)
	}

	// MARK: - Actions
	
	@objc func callAction(_ sender: UIButton) {
		
		switch sender.tag {
		case SelectedButton.challenge1.tag:
			challenge1(input: "hello, world")
			presentAnswerController()
		default:
			break
		}
		
		
	}

	@objc func checkAnswer() {
		
		print("DEBUG: check answer here...")
		
	}
	
	func presentAnswerController() {
		let controller = AnswerController()
		controller.challenge = challenge
		navigationController?.pushViewController(controller, animated: false)
	}
	// MARK: - Challenges
	
	
	
	func challenge1(input: String) -> String {
		let question = "Write a function that acceps a String as its only parameter, and returns true if the string has only unique letters, taking letter case into account.\n\n"
		let sample = "The string 'No duplicates' should return true.\nThe string 'abcdefghijklmnopqrstuvwxyz' should return true.\nThe string 'AaBbCc' should return true because the challenge is case-sensitive.\nThe String 'Hello, world' should return false because of the double Ls and double Os.\n\n"
		
		let answer: String = "return Set(input).count == input.count"
		
		let upperAnswerPlaceholderText = "func challenge1(input: String) -> Bool {"
		
		self.challenge = Challenge(question: question, sample: sample, answer: answer, upperPlaceholder: upperAnswerPlaceholderText, lowerPlaceholder: "}")
		
		return answer
	}
	
	/// `Challenge 2`: Write a function that acceps a String as its only parameter, and returns true if the string reads the same when reversed, ignoring case. A palindrome

	func challenge2(input: String) -> Bool {
		
		return input.lowercased().reversed() == Array(input.lowercased())
	}
	
	
	private func challenge14(input: String = "abc", current: String = "") {
		
		let strArray = Array(input)
		let length = strArray.count
		
		if length == 0 {
			print(current)
		} else {
			for i in 0..<length {
				let left = String(strArray[i..<length])
				let right = String(strArray[i + 1..<length])
				
				challenge14(input: left + right, current: current + String(strArray[i]))
			}
		}
	}
	
	// MARK: - Testing only
	
}




