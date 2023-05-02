// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

import Foundation

extension URLSession {
  static var urlDataDict = [URL: Data]()
  static var didProcessURLs = false

  static var stubSession: URLSession {
    if !didProcessURLs {
      for breedsURL in BreedsURL.allCases {
        guard let breedData = jsonDataFromBundle(url: breedsURL.url) else {
          fatalError("Unable to load mock JSON data for URL \(breedsURL.url).")
        }
        urlDataDict[breedsURL.url] = breedData
      }

      guard let photoData = photoDataFromBundle else {
        fatalError("Unable to load mock photo data.")
      }
      urlDataDict[MockData.photoURL] = photoData

      didProcessURLs = true
    }

    let config = URLSessionConfiguration.ephemeral
    config.protocolClasses = [URLProtocolStub.self]
    return URLSession(configuration: config)
  }

  static func jsonDataFromBundle(url: URL) -> Data? {
    if
      let path = Bundle.main.path(forResource: url.lastPathComponent, ofType: nil),
      let data = try? Data(contentsOf: URL(fileURLWithPath: path))
    {
      return data
    } else {
      return nil
    }
  }

  static var photoDataFromBundle: Data? {
    if
      let url = Bundle.main.url(forResource: MockData.mockPhotoName, withExtension: MockData.mockPhotoExtension),
      let data = try? Data(contentsOf: url)
    {
      return data
    } else {
      return nil
    }
  }
}
