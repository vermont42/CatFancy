// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    #if targetEnvironment(simulator)
    Current = World.simulator
    #endif
    return true
  }
}

var Current = World.device
