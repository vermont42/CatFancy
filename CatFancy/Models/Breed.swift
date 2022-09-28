//
//  Breed.swift
//  CatFancy
//
//  Created by Josh Adams on 9/25/22.
//

import Foundation

struct Breed: Codable {
  let name: String
  let knownFor: String
  let popularity: Int
  let photoUrl: URL
  let infoUrl: URL
  let credit: String
  let license: License
  let description: String
}
