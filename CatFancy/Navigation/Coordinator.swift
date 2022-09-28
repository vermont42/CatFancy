//
//  Coordinator.swift
//  CatFancy
//
//  Created by Josh Adams on 9/25/22.
//

import UIKit

protocol Coordinator {
  var navigationController: UINavigationController { get set }
  func start()
}
