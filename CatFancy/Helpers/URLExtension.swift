//
//  URLExtension.swift
//  CatFancy
//
//  Created by Josh Adams on 9/26/22.
//

import Foundation

extension URL {
  static func couldNotInit(urlString: String) -> String {
    "Could not initialize URL from \(urlString)."
  }
}
