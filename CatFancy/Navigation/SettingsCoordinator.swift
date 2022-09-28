//
//  SettingsCoordinator.swift
//  CatFancy
//
//  Created by Josh Adams on 9/25/22.
//

import UIKit

class SettingsCoordinator: Coordinator {
  var navigationController: UINavigationController

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func start() {
    let vc = SettingsVC()
    vc.tabBarItem = UITabBarItem(title: "Settings", image: Symbols.gear, selectedImage: nil)
    navigationController.pushViewController(vc, animated: false)
  }
}
