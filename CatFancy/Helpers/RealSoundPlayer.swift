// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

import AVFoundation

class RealSoundPlayer: SoundPlayer {
  private var sounds: [String: AVAudioPlayer]
  private let soundExtension = "mp3"

  init () {
    sounds = Dictionary()
  }

  func play(_ sound: Sound, didSucceed: @escaping (Bool) -> ()) {
    if sounds[sound.rawValue] == nil {
      if let audioURL = Bundle.main.url(forResource: sound.rawValue, withExtension: soundExtension) {
        do {
          try sounds[sound.rawValue] = AVAudioPlayer.init(contentsOf: audioURL)
        } catch {
          didSucceed(false)
        }
      }
    }

    if let retrievedSound = sounds[sound.rawValue] {
      retrievedSound.play()
      didSucceed(true)
    } else {
      didSucceed(false)
    }
  }
}
