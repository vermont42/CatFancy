//
//  BreedRequester.swift
//  CatFancy
//
//  Created by Josh Adams on 9/25/22.
//

import Foundation

enum BreedRequester {
  static func requestBreeds() async -> [Breed]? {
    do {
      let (data, _) = try await Current.session.data(from: Current.settings.breedsURL.url)
      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase
      let breeds = try decoder.decode(Breeds.self, from: data)
      return breeds.breeds
    } catch {
      return nil
    }
  }
}
