//
//  AppDelegateTests.swift
//  CatFancyTests
//
//  Created by Josh Adams on 9/27/22.
//

@testable import CatFancy
import XCTest

class AppDelegateTests: XCTestCase {
  func testDidFinishLaunching() {
    let appDelegate = AppDelegate()
    XCTAssert(appDelegate.application(UIApplication.shared, didFinishLaunchingWithOptions: nil))
  }
}
