//
//  DictionaryGetterSetterTests.swift
//  CatFancyTests
//
//  Created by Josh Adams on 6/1/21.
//

@testable import CatFancy
import XCTest

class DictionaryGetterSetterTests: XCTestCase {
  func testGetAndSet() {
    let settings = Settings(getterSetter: DictionaryGetterSetter())
    let initialOrder = settings.sortOrder
    XCTAssertEqual(SortOrder.name, initialOrder)
    settings.sortOrder = .popularity
    XCTAssertEqual(settings.sortOrder, .popularity)
  }

  func testInitialization() {
    let 🦖 = "🦖"
    let 🪐 = "🪐"
    let getterSetter = DictionaryGetterSetter(dictionary: [🦖: 🪐])
    XCTAssertEqual(getterSetter.get(key: 🦖), 🪐)
  }
}
