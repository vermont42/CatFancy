//
//  TestSoundPlayer.swift
//  CatFancy
//
//  Created by Josh Adams on 5/28/21.
//

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
