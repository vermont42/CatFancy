//
//  BreedRequesterTests.swift
//  CatFancyTests
//
//  Created by Josh Adams on 6/1/21.
//

@testable import CatFancy
import XCTest

class BreedRequesterTests: XCTestCase {
  func testRequestBreeds() async {
    let breeds = await BreedRequester.requestBreeds()
    let expectedCount = 14
    XCTAssertEqual(expectedCount, breeds?.count ?? 0)
  }
}
