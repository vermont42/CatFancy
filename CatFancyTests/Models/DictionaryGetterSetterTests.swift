// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

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
