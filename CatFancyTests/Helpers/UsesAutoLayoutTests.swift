// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

@testable import CatFancy
import XCTest

class UsesAutoLayoutTests: XCTestCase {
  @UsesAutoLayout
  var wrappedView = UIView()

  func testUsesAutoLayout() {
    let vanillaView = UIView()
    XCTAssert(vanillaView.translatesAutoresizingMaskIntoConstraints)

    XCTAssertFalse(wrappedView.translatesAutoresizingMaskIntoConstraints)

    let chocolateView = UIView()
    XCTAssert(chocolateView.translatesAutoresizingMaskIntoConstraints)
    var chocolateWrappedView = UsesAutoLayout<UIView>(wrappedValue: chocolateView)
    XCTAssertFalse(chocolateWrappedView.wrappedValue.translatesAutoresizingMaskIntoConstraints)
    chocolateWrappedView.wrappedValue = chocolateView
    XCTAssertFalse(chocolateWrappedView.wrappedValue.translatesAutoresizingMaskIntoConstraints)
  }
}
