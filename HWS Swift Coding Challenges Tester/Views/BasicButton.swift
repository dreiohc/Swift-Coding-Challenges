//
//  BasicButton.swift
//  HWS Swift Coding Challenges Tester
//
//  Created by Myron Dulay on 3/27/21.
//

import UIKit

class BasicButton: UIButton {
	
	
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		backgroundColor = .systemYellow
		layer.cornerRadius = 5
		setTitleColor(.black, for: .normal)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	
	
}

