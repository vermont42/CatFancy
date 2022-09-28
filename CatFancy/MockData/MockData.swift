//
//  MockData.swift
//  CatFancy
//
//  Created by Josh Adams on 9/25/22.
//

import Foundation

enum MockData {
  private static let mockPhotoURLString = "https://raceconditionsoftware.s3.us-west-1.amazonaws.com/CatFancy/img/"
  static let mockPhotoName = "Abyssinian"
  static let mockPhotoExtension = ".jpg"

  static var photoURL: URL {
    let urlString = mockPhotoURLString + mockPhotoName + mockPhotoExtension
    if let url = URL(string: urlString) {
      return url
    } else {
      fatalError(URL.couldNotInit(urlString: urlString))
    }
  }
}
