// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

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
