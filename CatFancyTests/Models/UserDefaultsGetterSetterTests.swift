// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

@testable import CatFancy
import XCTest

class UserDefaultsGetterSetterTests: XCTestCase {
  private static let settings = Settings(getterSetter: UserDefaultsGetterSetter(suiteName: "tests"))

  override class func tearDown() {
    UserDefaultsGetterSetterTests.settings.sortOrder = .name
  }

  func testGetAndSet() {
    let initialOrder = UserDefaultsGetterSetterTests.settings.sortOrder
    XCTAssertEqual(SortOrder.name, initialOrder)
    UserDefaultsGetterSetterTests.settings.sortOrder = .popularity
    XCTAssertEqual(UserDefaultsGetterSetterTests.settings.sortOrder, .popularity)
  }
}
