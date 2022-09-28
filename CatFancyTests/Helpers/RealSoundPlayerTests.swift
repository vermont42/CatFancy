//
//  RealSoundPlayerTests.swift
//  CatFancyTests
//
//  Created by Josh Adams on 6/1/21.
//

@testable import CatFancy
import XCTest

class RealSoundPlayerTests: XCTestCase {
  func testSuccess() {
    let soundPlayer = RealSoundPlayer()
    soundPlayer.play(.sadTrombone) { didSucceed in
      XCTAssert(didSucceed)
    }
  }

  func testFailure() {
    let soundPlayer = RealSoundPlayer()
    soundPlayer.play(.missingSound) { didSucceed in
      XCTAssertFalse(didSucceed)
    }
  }
}
