//
//  ImageCacheLoader.swift
//  CatFancy
//
//  Created by Josh Adams on 9/25/22.
//

import UIKit

class ImageCacheLoader {
  private static let shared = ImageCacheLoader()
  private var cache: NSCache<NSString, UIImage>

  private init() {
    cache = NSCache()
  }

  static func requestImage(url: URL, completion: @escaping ((UIImage?) -> ())) {
    if let image = requestImageFromCache(url: url) {
      DispatchQueue.main.async {
        completion(image)
      }
    } else {
      let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
      Current.session.dataTask(with: request) { data, _, error in
        guard
          error == nil,
          let data = data,
          let image = UIImage(data: data)
        else {
          DispatchQueue.main.async {
            completion(nil)
          }
          return
        }
        shared.cache.setObject(image, forKey: url.absoluteString as NSString)
        DispatchQueue.main.async {
          completion(image)
        }
      }.resume()
    }
  }

  static func requestImageFromCache(url: URL) -> UIImage? {
    return shared.cache.object(forKey: url.absoluteString as NSString)
  }

  static func clearCache() {
    shared.cache.removeAllObjects()
  }
}
