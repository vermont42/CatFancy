//
//  BreedDetailViewTests.swift
//  CatFancyTests
//
//  Created by Josh Adams on 6/1/21.
//

@testable import CatFancy
import XCTest

class BreedDetailViewTests: XCTestCase {
  func testInitialization() {
    let bdv = BreedDetailView()
    XCTAssertNotNil(bdv)
  }
}
