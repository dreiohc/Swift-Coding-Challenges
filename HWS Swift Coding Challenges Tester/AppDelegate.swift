//
//  AppDelegate.swift
//  HWS Swift Coding Challenges Tester
//
//  Created by Myron Dulay on 3/27/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		setupDefaults()
		return true
	}
	
	private func setupDefaults() {
		let userdefaults = UserDefaults.standard
		if userdefaults.value(forKey: KEY_FINISHED_CHALLENGES) == nil {
			userdefaults.set(object: [0: false], forKey: KEY_FINISHED_CHALLENGES)
		}
	}

	// MARK: UISceneSession Lifecycle

	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
		// Called when a new scene session is being created.
		// Use this method to select a configuration to create the new scene with.
		return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
	}

	func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
		// Called when the user discards a scene session.
		// If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
		// Use this method to release any resources that were specific to the discarded scenes, as they will not return.
	}


}

