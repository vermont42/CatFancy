//
//  URLExtensionTests.swift
//  CatFancyTests
//
//  Created by Josh Adams on 9/27/22.
//

@testable import CatFancy
import XCTest

class URLExtensionTests: XCTestCase {
  func testCouldNotInit() {
    let 🙀 = "🙀"
    XCTAssertEqual("Could not initialize URL from \(🙀).", URL.couldNotInit(urlString: 🙀))
  }
}
