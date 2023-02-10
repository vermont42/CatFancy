//
//  BreedsLoaderTests.swift
//  CatFancyTests
//
//  Created by Josh Adams on 6/1/21.
//

@testable import CatFancy
import XCTest

class BreedsLoaderTests: XCTestCase {
  func testLoadBreeds() async throws {
    let breeds = try await BreedsLoader.loadBreeds()
    let expectedCount = 14
    XCTAssertEqual(expectedCount, breeds.count)
  }
}
