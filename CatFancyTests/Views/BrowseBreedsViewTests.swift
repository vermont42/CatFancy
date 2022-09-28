//
//  BrowseBreedsViewTests.swift
//  CatFancyTests
//
//  Created by Josh Adams on 6/1/21.
//

@testable import CatFancy
import XCTest

class BrowseBreedsViewTests: XCTestCase {
  func testInitialization() {
    let bbv = BrowseBreedsView()
    XCTAssertNotNil(bbv)
  }
}
