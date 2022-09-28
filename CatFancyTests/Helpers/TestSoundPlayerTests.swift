//
//  TestSoundPlayerTests.swift
//  CatFancyTests
//
//  Created by Josh Adams on 6/1/21.
//

@testable import CatFancy
import XCTest

class TestSoundPlayerTests: XCTestCase {
  func testSuccess() {
    var didSucceed = false
    let soundPlayer = TestSoundPlayer()
    soundPlayer.play(.sadTrombone, didSucceed: { result in
      didSucceed = result
      XCTAssert(didSucceed)
    })
  }

  func testFailure() {
    var didSucceed = true
    let soundPlayer = TestSoundPlayer(alwaysFail: true)
    soundPlayer.play(.missingSound, didSucceed: { result in
      didSucceed = result
      XCTAssertFalse(didSucceed)
    })
  }
}
