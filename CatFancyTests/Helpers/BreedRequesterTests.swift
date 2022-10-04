//
//  BreedRequesterTests.swift
//  CatFancyTests
//
//  Created by Josh Adams on 6/1/21.
//

@testable import CatFancy
import XCTest

class BreedRequesterTests: XCTestCase {
  func testRequestBreeds() {
    Current.settings.breedsURL = .standard
    let exp = expectation(description: "Loading breeds.")
    BreedRequester.requestBreeds { breeds in
      guard let breeds else {
        XCTFail("No breeds were returned.")
        return
      }
      let expectedCount = 14
      XCTAssertEqual(expectedCount, breeds.count)
      exp.fulfill()
    }

    let timeout: TimeInterval = 10.0
    wait(for: [exp], timeout: timeout)
  }
}
