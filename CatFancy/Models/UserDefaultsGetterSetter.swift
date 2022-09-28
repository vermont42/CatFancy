//
//  UserDefaultsGetterSetter.swift
//  CatFancy
//
//  Created by Josh Adams on 1/13/19.
//

import Foundation

class UserDefaultsGetterSetter: GetterSetter {
  private let userDefaults: UserDefaults

  init(suiteName: String? = nil) {
    if let suiteName {
      userDefaults = UserDefaults(suiteName: suiteName) ?? UserDefaults.standard
    } else {
      userDefaults = UserDefaults.standard
    }
  }

  func get(key: String) -> String? {
    return userDefaults.string(forKey: key)
  }

  func set(key: String, value: String) {
    userDefaults.set(value, forKey: key)
  }
}
