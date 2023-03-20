// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

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
    } else {
      client?.urlProtocol(self, didFailWithError: LoadingError.loadFailed)
    }
    client?.urlProtocolDidFinishLoading(self)
  }

  override func stopLoading() {}

  enum LoadingError: Error {
    case loadFailed
  }
}
