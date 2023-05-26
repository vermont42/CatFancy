// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

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

  static let photoUrlPrefix = "https://raceconditionsoftware.s3.us-west-1.amazonaws.com/CatFancy/img/"

  static let catNames: [String] = [
    "Abyssinian",
    "Balinese",
    "Bengal",
    "Burmese",
    "CloudedLeopard",
    "DevonRex",
    "EuropeanWildcat",
    "MaineCoon",
    "Manx",
    "Ragdoll",
    "RussianBlue",
    "Sand",
    "Savannah",
    "Serval",
    "Siamese",
    "Smilodon",
    "Tonkinese",
    "TurkishAngora",
    "Van"
  ]
}
