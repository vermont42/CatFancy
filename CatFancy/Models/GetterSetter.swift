//
//  GetterSetter.swift
//  CatFancy
//
//  Created by Josh Adams on 1/13/19.
//

import Foundation

protocol GetterSetter {
  func get(key: String) -> String?
  func set(key: String, value: String)
}
