//
//  UIViewControllerExtensionTests.swift
//  CatFancyTests
//
//  Created by Josh Adams on 6/1/21.
//

@testable import CatFancy
import XCTest

class UIViewControllerExtensionTests: XCTestCase {
  func testFatalCastMessage() {
    let vc = SettingsVC()
    let view = SettingsView()
    let message = vc.fatalCastMessage(view: view.self)
    XCTAssert(message.contains("Could not cast <CatFancy.SettingsVC:"))
    XCTAssert(message.contains("to <CatFancy.SettingsView:"))
  }
}
