//
//  SettingsTests.swift
//  CatFancyTests
//
//  Created by Josh Adams on 6/1/21.
//

@testable import CatFancy
import XCTest

class SettingsTests: XCTestCase {
  func testBreedsURLSetting() {
    let settings = Settings(getterSetter: DictionaryGetterSetter())
    XCTAssertEqual(Settings.breedsURLDefault, settings.breedsURL)
    XCTAssertEqual(BreedsURL.standard, settings.breedsURL)
    settings.breedsURL = .withMore
    XCTAssertNotEqual(Settings.breedsURLDefault, settings.breedsURL)
    XCTAssertEqual(BreedsURL.withMore, settings.breedsURL)
  }

  func testSortOrderSetting() {
    let settings = Settings(getterSetter: DictionaryGetterSetter())
    XCTAssertEqual(Settings.sortOrderDefault, settings.sortOrder)
    XCTAssertEqual(SortOrder.name, settings.sortOrder)
    settings.sortOrder = .popularity
    XCTAssertNotEqual(Settings.sortOrderDefault, settings.sortOrder)
    XCTAssertEqual(SortOrder.popularity, settings.sortOrder)
  }
}
