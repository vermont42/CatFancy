//
//  SettingsViewTests.swift
//  CatFancyTests
//
//  Created by Josh Adams on 6/1/21.
//

@testable import CatFancy
import XCTest

class SettingsViewTests: XCTestCase {
  func testInitialization() {
    let sv = SettingsView()
    XCTAssertNotNil(sv)
  }
}
