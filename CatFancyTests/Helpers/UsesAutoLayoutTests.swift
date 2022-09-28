//
//  UsesAutoLayoutTests.swift
//  CatFancyTests
//
//  Created by Josh Adams on 6/1/21.
//

@testable import CatFancy
import XCTest

class UsesAutoLayoutTests: XCTestCase {
  @UsesAutoLayout
  var wrappedView: UIView = {
    return UIView()
  }()

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
