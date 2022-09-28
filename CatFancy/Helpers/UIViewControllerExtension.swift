//
//  UIViewControllerExtension.swift
//  CatFancy
//
//  Created by Josh Adams on 5/28/21.
//

import UIKit

extension UIViewController {
  func fatalCastMessage(view: Any) -> String {
    return "Could not cast \(self).view to \(view)."
  }
}
