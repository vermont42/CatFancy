//
//  Sound.swift
//  CatFancy
//
//  Created by Josh Adams on 9/25/22.
//

import Foundation

enum Sound: String {
  case chime
  case sadTrombone
  // The following case does not correspond to a sound in the bundle but rather exists to facilitate testing playback failure.
  case missingSound
}
