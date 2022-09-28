//
//  World.swift
//  CatFancy
//
//  Created by Josh Adams on 9/25/22 based on concepts described here:
//  https://www.pointfree.co/blog/posts/21-how-to-control-the-world

import Foundation

struct World {
  var settings: Settings
  var session: URLSession
  var soundPlayer: SoundPlayer
  var getterSetter: GetterSetter

  init(settings: Settings, session: URLSession, soundPlayer: SoundPlayer, getterSetter: GetterSetter) {
    self.settings = settings
    self.session = session
    self.soundPlayer = soundPlayer
    self.getterSetter = getterSetter
  }

  static let device: World = {
    let getterSetter = UserDefaultsGetterSetter()
    return World(
      settings: Settings(getterSetter: UserDefaultsGetterSetter()),
      session: URLSession.shared,
      soundPlayer: RealSoundPlayer(),
      getterSetter: getterSetter
    )
  }()

  static let simulator: World = {
    let getterSetter = UserDefaultsGetterSetter()
    return World(
      settings: Settings(getterSetter: getterSetter),
      session: URLSession.shared,
      soundPlayer: RealSoundPlayer(),
      getterSetter: getterSetter
    )
  }()

  static let unitTest: World = {
    let getterSetter = DictionaryGetterSetter()
    return World(
      settings: Settings(getterSetter: getterSetter),
      session: URLSession.stubSession,
      soundPlayer: TestSoundPlayer(),
      getterSetter: getterSetter
    )
  }()
}
