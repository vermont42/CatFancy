//
//  NSLayoutConstraintExtension.swift
//  CatFancy
//
//  Created by Josh Adams on 5/28/21.
//

import UIKit

extension NSLayoutConstraint {
  @discardableResult func activate() -> NSLayoutConstraint {
    isActive = true
    return self
  }
}
