//
//  MainTabController.swift
//  HWS Swift Coding Challenges Tester
//
//  Created by Myron Dulay on 3/27/21.
//

import UIKit

class MainTabController: UITabBarController {
	
	// MARK: - Properties
	
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configureViewControllers()
	}
	
	// MARK: - Actions
	
	
	
	// MARK: - Helpers
	
	func configureViewControllers() {
		let section1 = templateNavigationController(title: "Section 1", rootViewController: Section1Controller())
		let section2 = templateNavigationController(title: "Section 2", rootViewController: Section2Controller())
		let section3 = templateNavigationController(title: "Section 3", rootViewController: Section3Controller())
		let section4 = templateNavigationController(title: "Section 4", rootViewController: Section4Controller())
		let section5 = templateNavigationController(title: "Sean Allen's", rootViewController: SeanAllenController())
		
		viewControllers = [section1, section2, section3, section4, section5]
		
		tabBar.tintColor = .systemYellow
		
	}
	
	func templateNavigationController(title: String, rootViewController: UIViewController) -> UINavigationController {
		let navVC = UINavigationController(rootViewController: rootViewController)
		navVC.tabBarItem.title = title
		return navVC
	}
	
}


// MARK: - Extensions


