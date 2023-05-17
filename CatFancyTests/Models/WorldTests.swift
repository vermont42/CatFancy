// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

@testable import CatFancy
import XCTest

class WorldTests: XCTestCase {
  func testProductionWorld() {
    let world = World.production
    XCTAssert(world.settings.getterSetter is GetterSetterReal)
    XCTAssertEqual(world.session, URLSession.shared)
    XCTAssert(world.soundPlayer is SoundPlayerReal)
  }

  func testUnitTestWorld() {
    let world = World.unitTest
    XCTAssert(world.settings.getterSetter is GetterSetterFake)
    XCTAssertNotEqual(URLSession.shared, world.session)
    let expectedProtocolClassesCount = 1
    XCTAssertEqual(expectedProtocolClassesCount, world.session.configuration.protocolClasses?.count)
    XCTAssert(world.soundPlayer is SoundPlayerDummy)
  }
}
