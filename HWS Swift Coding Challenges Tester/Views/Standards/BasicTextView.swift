//
//  BasicTextView.swift
//  HWS Swift Coding Challenges Tester
//
//  Created by Myron Dulay on 3/27/21.
//

import UIKit

class BasicTextView: UITextView {
	
	var answerPlaceholderText: NSAttributedString? {
		didSet { answerPlaceholderLabel.attributedText = answerPlaceholderText }
	}
	
	
	var answerPlaceholderLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: 11)
		label.lineBreakMode = .byWordWrapping
		label.numberOfLines = 0
		label.textColor = .systemGreen
		return label
	}()
	
	
	override init(frame: CGRect, textContainer: NSTextContainer?) {
		super.init(frame: frame, textContainer: textContainer)
		autocapitalizationType = .none
		
		addSubview(answerPlaceholderLabel)
		answerPlaceholderLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 7, paddingLeft: 6)
		
		backgroundColor = #colorLiteral(red: 0.1293964982, green: 0.1294215322, blue: 0.1293910444, alpha: 1)
		layer.cornerRadius = 5
		NotificationCenter.default.addObserver(self, selector: #selector(handleTextDidChange), name: UITextView.textDidChangeNotification, object: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	@objc func handleTextDidChange() {
		answerPlaceholderLabel.isHidden = !text.isEmpty
	}
	
}
