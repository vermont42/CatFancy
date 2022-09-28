//
//  URLSessionExtension.swift
//  CatFancy
//
//  Created by Josh Adams on 9/16/22.
//

import Foundation

extension URLSession {
  static var didProcessURLs = false

  static var stubSession: URLSession {
    if !didProcessURLs {
      BreedsURL.allCases.forEach {
        if let path = Bundle.main.path(forResource: $0.url.lastPathComponent, ofType: nil) {
          do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            URLProtocolStub.testURLs[$0.url] = data
          } catch {
            fatalError("Unable to load mock JSON data for URL \($0.url).")
          }
        }
      }

      if let url = Bundle.main.url(forResource: MockData.mockPhotoName, withExtension: MockData.mockPhotoExtension) {
        do {
          let data = try Data(contentsOf: url)
          URLProtocolStub.testURLs[MockData.photoURL] = data
        } catch {
          fatalError("Unable to initialize Data.")
        }
      } else {
        fatalError("Unable to construct path to \(MockData.mockPhotoName).\(MockData.mockPhotoExtension).")
      }

      didProcessURLs = true
    }

    let config = URLSessionConfiguration.ephemeral
    config.protocolClasses = [URLProtocolStub.self]
    return URLSession(configuration: config)
  }
}
