//
//  WorldTests.swift
//  CatFancyTests
//
//  Created by Josh Adams on 6/1/21.
//

@testable import CatFancy
import XCTest

class WorldTests: XCTestCase {
  func testDeviceWorld() {
    let world = World.device
    XCTAssert(world.settings.getterSetter is UserDefaultsGetterSetter)
    XCTAssertEqual(world.session, URLSession.shared)
    XCTAssert(world.soundPlayer is RealSoundPlayer)
  }

  func testSimulatorWorld() {
    let world = World.simulator
    XCTAssert(world.settings.getterSetter is UserDefaultsGetterSetter)
    XCTAssertEqual(world.session, URLSession.shared)
    XCTAssert(world.soundPlayer is RealSoundPlayer)
  }

  func testUnitTestWorld() {
    let world = World.unitTest
    XCTAssert(world.settings.getterSetter is DictionaryGetterSetter)
    XCTAssertNotEqual(URLSession.shared, world.session)
    let expectedProtocolClassesCount = 1
    XCTAssertEqual(expectedProtocolClassesCount, world.session.configuration.protocolClasses?.count)
    XCTAssert(world.soundPlayer is TestSoundPlayer)
  }
}
