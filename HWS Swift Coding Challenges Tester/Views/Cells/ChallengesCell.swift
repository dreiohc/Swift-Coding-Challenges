//
//  ChallengesCell.swift
//  HWS Swift Coding Challenges Tester
//
//  Created by Myron Dulay on 3/28/21.
//

import UIKit

class ChallengesCell: UITableViewCell {
	
	// MARK: - Properties
	var viewModel: ChallengeViewModel? {
		didSet { configure() }
	}
	
	private let challengeTitleLabel: UILabel = {
		let label = UILabel()
		label.textAlignment = .left
		label.numberOfLines = 0
		label.lineBreakMode = .byWordWrapping
		label.font = UIFont.boldSystemFont(ofSize: 12)
		return label
	}()
	
	private let difficultyLabel: UILabel = {
		let label = UILabel()
		label.textAlignment = .right
		label.font = UIFont.systemFont(ofSize: 10)
		return label
	}()
	
	// MARK: - Lifecycle
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
	
		let stack = UIStackView(arrangedSubviews: [challengeTitleLabel, difficultyLabel])
		stack.distribution = .equalCentering
		stack.spacing = 20
		stack.alignment = .leading
		
		addSubview(stack)
		stack.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor,
								 paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 10)
	}
		
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Helpers
	
	private func configure() {
		guard let viewModel = viewModel else { return }
		challengeTitleLabel.text = viewModel.title
		difficultyLabel.text = viewModel.difficulty
	}
	
}
