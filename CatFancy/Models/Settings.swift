//
//  Settings.swift
//  CatFancy
//
//  Created by Josh Adams on 9/25/22.
//

import Foundation

class Settings {
  let getterSetter: GetterSetter

  var breedsURL: BreedsURL {
    didSet {
      if breedsURL != oldValue {
        getterSetter.set(key: Settings.breedsURLKey, value: breedsURL.rawValue)
      }
    }
  }
  static let breedsURLKey = "breedsURL"
  static let breedsURLDefault: BreedsURL = .standard

  var sortOrder: SortOrder {
    didSet {
      if sortOrder != oldValue {
        getterSetter.set(key: Settings.sortOrderKey, value: sortOrder.rawValue)
      }
    }
  }
  static let sortOrderKey = "sortOrder"
  static let sortOrderDefault: SortOrder = .name

  init(getterSetter: GetterSetter) {
    self.getterSetter = getterSetter

    if let breedsURLString = getterSetter.get(key: Settings.breedsURLKey) {
      breedsURL = BreedsURL(rawValue: breedsURLString) ?? Settings.breedsURLDefault
    } else {
      breedsURL = Settings.breedsURLDefault
      getterSetter.set(key: Settings.breedsURLKey, value: breedsURL.rawValue)
    }

    if let sortOrderString = getterSetter.get(key: Settings.sortOrderKey) {
      sortOrder = SortOrder(rawValue: sortOrderString) ?? Settings.sortOrderDefault
    } else {
      sortOrder = Settings.sortOrderDefault
      getterSetter.set(key: Settings.sortOrderKey, value: sortOrder.rawValue)
    }
  }
}
