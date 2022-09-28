//
//  ImageCacheLoaderTests.swift
//  CatFancyTests
//
//  Created by Josh Adams on 6/1/21.
//

@testable import CatFancy
import XCTest

class ImageCacheLoaderTests: XCTestCase {
  let timeout: TimeInterval = 1.0

  func testImageNotAvailable() {
    let badURLString = "https://zzz.zzz/zzz.jpg"
    guard let badURL = URL(string: badURLString) else {
      XCTFail("Could not initialize URL for \(badURLString).")
      return
    }

    let exp = expectation(description: "Trying in vain to get image from \(badURLString).")

    ImageCacheLoader.requestImage(url: badURL) { nilImage in
      XCTAssertNil(nilImage)
      exp.fulfill()
    }

    wait(for: [exp], timeout: timeout)
  }

  func testRequestImage() {
    ImageCacheLoader.clearCache()

    let exp1 = expectation(description: "Getting image from \(MockData.photoURL.absoluteString).")

    ImageCacheLoader.requestImage(url: MockData.photoURL) { receivedImage in
      XCTAssertNotNil(receivedImage)
      exp1.fulfill()
    }

    wait(for: [exp1], timeout: timeout)

    let exp2 = expectation(description: "Getting image from cache.")

    ImageCacheLoader.requestImage(url: MockData.photoURL) { receivedImage in
      XCTAssertNotNil(receivedImage)
      exp2.fulfill()
    }

    wait(for: [exp2], timeout: timeout)
  }
}
