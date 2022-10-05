//
//  URLProtocolStub.swift
//  CatFancy
//
//  Created by Josh Adams on 9/16/22.
//

import Foundation

class URLProtocolStub: URLProtocol {
  static var testURLs = [URL?: Data]()

  override class func canInit(with request: URLRequest) -> Bool {
    return true
  }

  override class func canonicalRequest(for request: URLRequest) -> URLRequest {
    return request
  }

  override func startLoading() {
    if
      let url = request.url,
      let data = URLProtocolStub.testURLs[url]
    {
      client?.urlProtocol(self, didReceive: URLResponse(), cacheStoragePolicy: .notAllowed)
      client?.urlProtocol(self, didLoad: data)
    }
    client?.urlProtocolDidFinishLoading(self)
  }

  override func stopLoading() {}
}
