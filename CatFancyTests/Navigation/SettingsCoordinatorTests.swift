//
//  SettingsCoordinatorTests.swift
//  CatFancyTests
//
//  Created by Josh Adams on 6/1/21.
//

@testable import CatFancy
import XCTest

class SettingsCoordinatorTests: XCTestCase {
  func testStart() {
    let nc = UINavigationController()
    let coordinator = SettingsCoordinator(navigationController: nc)
    XCTAssertNil(coordinator.navigationController.topViewController)
    coordinator.start()
    XCTAssert(coordinator.navigationController.topViewController is SettingsVC)
  }
}
