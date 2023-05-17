// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.
// https://www.pointfree.co/blog/posts/21-how-to-control-the-world

import Foundation

struct World {
  var settings: Settings
  var session: URLSession
  var soundPlayer: SoundPlayer
  var getterSetter: GetterSetter

  static let production: World = {
    let getterSetter = GetterSetterReal()
    return World(
      settings: Settings(getterSetter: getterSetter),
      session: URLSession.shared,
      soundPlayer: SoundPlayerReal(),
      getterSetter: getterSetter
    )
  }()

  static let unitTest: World = {
    let getterSetter = GetterSetterFake()
    return World(
      settings: Settings(getterSetter: getterSetter),
      session: URLSession.stubSession,
      soundPlayer: SoundPlayerDummy(),
      getterSetter: getterSetter
    )
  }()
}
