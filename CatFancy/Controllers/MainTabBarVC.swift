//
//  MainTabBarVC.swift
//  CatFancy
//
//  Created by Josh Adams on 9/25/22.
//

import UIKit

class MainTabBarVC: UITabBarController {
  private let breedCoordinator = BreedCoordinator(navigationController: UINavigationController())
  private let settingsCoordinator = SettingsCoordinator(navigationController: UINavigationController())

  override func viewDidLoad() {
    breedCoordinator.start()
    settingsCoordinator.start()
    viewControllers = [breedCoordinator.navigationController, settingsCoordinator.navigationController]
  }
}
