// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

import Foundation

class TestSoundPlayer: SoundPlayer {
  private let alwaysFail: Bool

  init(alwaysFail: Bool = false) {
    self.alwaysFail = alwaysFail
  }

  func play(_ sound: Sound, didSucceed: @escaping (Bool) -> ()) {
    print("SOUND: \(sound.rawValue)")
    didSucceed(!alwaysFail)
  }
}
