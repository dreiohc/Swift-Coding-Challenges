//
//  UserDefaultsBacked.swift
//  HWS Swift Coding Challenges Tester
//
//  Created by Myron Dulay on 3/29/21.
//

import Foundation

private protocol AnyOptional {
	var isNil: Bool { get }
}

extension Optional: AnyOptional {
	var isNil: Bool { self == nil }
}

@propertyWrapper struct UserDefaultsBacked<Value> {
	
	let key: String
	let defaultValue: Value
	let storage: UserDefaults = .standard
	
	var wrappedValue: Value {
		get {
			let value = storage.value(forKey: key) as? Value
			return value ?? defaultValue
		}
		set {
			if let optional = newValue as? AnyOptional, optional.isNil {
				storage.removeObject(forKey: key)
			} else {
				storage.setValue(newValue, forKey: key)
			}
		}
	}
}

extension UserDefaultsBacked where Value: ExpressibleByNilLiteral {
	init(key: String, storage: UserDefaults = .standard) {
		self.init(key: key, defaultValue: nil)
	}
}


@propertyWrapper struct UserDefaultsBackedRaw<Value: RawRepresentable> {
	
	let key: String
	let defaultValue: Value
	let storage: UserDefaults = .standard
	
	var wrappedValue: Value {
		get {
			if let value = storage.value(forKey: key), let obj = Value(rawValue: value as! Value.RawValue) {
				return obj
			} else {
				return defaultValue
			}
		}
		set {
			if let optional = newValue.rawValue as? AnyOptional, optional.isNil {
				storage.removeObject(forKey: key)
			} else {
				storage.setValue(newValue.rawValue, forKey: key)
			}
		}
	}
}

extension UserDefaultsBackedRaw where Value: ExpressibleByNilLiteral {
	init(key: String, storage: UserDefaults = .standard) {
		self.init(key: key, defaultValue: nil)
	}
}

