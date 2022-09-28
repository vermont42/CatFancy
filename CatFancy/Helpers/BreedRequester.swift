//
//  BreedRequester.swift
//  CatFancy
//
//  Created by Josh Adams on 9/25/22.
//

import Foundation

struct BreedRequester {
  // This classic implementation is for unit tests.
  static func requestBreeds(completion: @escaping ([Breed]?) -> ()) {
    Current.session.dataTask(with: Current.settings.breedsURL.url) { data, _, error in
      if
        let data = data,
        error == nil
      {
        do {
          let decoder = JSONDecoder()
          decoder.keyDecodingStrategy = .convertFromSnakeCase
          let breeds = try decoder.decode(Breeds.self, from: data)
          completion(breeds.breeds)
        } catch {
          completion(nil)
        }
      } else {
        completion(nil)
      }
    }.resume()
  }

  // This async/await implementation works in production, but I have not yet gotten it working in unit tests.
  // After I do so, I will remove the classic implementation.
  static func requestBreeds() async throws -> [Breed] {
    let (data, _) = try await Current.session.data(from: Current.settings.breedsURL.url)
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    let breeds = try decoder.decode(Breeds.self, from: data)
    return breeds.breeds
  }
}
