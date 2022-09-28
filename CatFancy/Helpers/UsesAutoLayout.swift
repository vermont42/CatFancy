//
//  UsesAutoLayout.swift
//  CatFancy
//
//  Created by Josh Adams on 5/28/21.
//

import UIKit

@propertyWrapper
public struct UsesAutoLayout<T: UIView> {
  public var wrappedValue: T {
    didSet {
      wrappedValue.translatesAutoresizingMaskIntoConstraints = false
    }
  }

  public init(wrappedValue: T) {
    self.wrappedValue = wrappedValue
    wrappedValue.translatesAutoresizingMaskIntoConstraints = false
  }
}
