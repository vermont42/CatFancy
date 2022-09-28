//
//  TestingRootVC.swift
//  CatFancyTests
//
//  Created by Josh Adams on 9/16/22.
//

@testable import CatFancy
import UIKit

class TestingRootViewController: UIViewController {
  override func loadView() {
    let label = UILabel()
    label.text = "Running unit tests..."
    label.textAlignment = .center
    label.textColor = .white
    label.font = Fonts.heading
    view = label
  }
}
