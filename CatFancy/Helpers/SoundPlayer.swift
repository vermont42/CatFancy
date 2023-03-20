// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

import Foundation

protocol SoundPlayer {
  func play(_ sound: Sound, didSucceed: @escaping (Bool) -> ())
}

extension SoundPlayer {
  func play(_ sound: Sound) {
    play(sound, didSucceed: { _ in })
  }
}
