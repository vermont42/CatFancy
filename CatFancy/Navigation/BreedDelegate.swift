//
//  BreedDelegate.swift
//  CatFancy
//
//  Created by Josh Adams on 9/25/22.
//

import Foundation

protocol BreedDelegate: AnyObject {
  func showWebpage(url: URL, didSucceed: ((Bool) -> ())?)
}
