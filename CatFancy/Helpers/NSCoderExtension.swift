//
//  NSCoderExtension.swift
//  CatFancy
//
//  Created by Josh Adams on 5/28/21.
//

import Foundation

extension NSCoder {
  static func fatalErrorNotImplemented() -> Never {
    fatalError("init(coder:) has not been implemented.")
  }
}
