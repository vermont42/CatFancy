//
//  BrowseBreedsDelegate.swift
//  CatFancy
//
//  Created by Josh Adams on 9/25/22.
//

import Foundation

protocol BrowseBreedsDelegate: AnyObject {
  func showDetails(breed: Breed, animated: Bool)
}

extension BrowseBreedsDelegate {
  func showDetails(breed: Breed) {
    showDetails(breed: breed, animated: true)
  }
}
