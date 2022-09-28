//
//  URLProtocolStubTests.swift
//  CatFancyTests
//
//  Created by Josh Adams on 6/1/21.
//

@testable import CatFancy
import XCTest

class URLProtocolStubTests: XCTestCase {
  private static var backupTestURLs = [URL?: Data]()

  override class func setUp() {
    backupTestURLs = URLProtocolStub.testURLs
  }

  override class func tearDown() {
    URLProtocolStub.testURLs = backupTestURLs
  }

  var url: URL {
    let urlString = "https://racecondition.software"
    if let url = URL(string: urlString) {
      return url
    } else {
      fatalError(URL.couldNotInit(urlString: urlString))
    }
  }

  var request: URLRequest {
    return URLRequest(url: url)
  }

  func testCanInit() {
    XCTAssert(URLProtocolStub.canInit(with: request))
  }

  func testCanonicalRequest() {
    XCTAssertEqual(request, URLProtocolStub.canonicalRequest(for: request))
  }

  func testStartLoading() {
    URLProtocolStub.testURLs = [url: Data()]
    let exp = expectation(description: "Waiting for load.")
    let stub: URLProtocolStub
    let client = TestProtocolClient { urlProtocol in
      XCTAssert(urlProtocol is URLProtocolStub)
      exp.fulfill()
    }
    stub = URLProtocolStub(request: request, cachedResponse: nil, client: client)
    stub.startLoading()
    let timeout: TimeInterval = 1.0
    wait(for: [exp], timeout: timeout)
  }
}

private class TestProtocolClient: NSObject, URLProtocolClient {
  let didFinishLoading: (URLProtocol) -> ()

  init(didFinishLoading: @escaping (URLProtocol) -> ()) {
    self.didFinishLoading = didFinishLoading
  }

  func urlProtocolDidFinishLoading(_ protocol: URLProtocol) {
    didFinishLoading(`protocol`)
  }

  func urlProtocol(_ protocol: URLProtocol, wasRedirectedTo request: URLRequest, redirectResponse: URLResponse) {}
  func urlProtocol(_ protocol: URLProtocol, cachedResponseIsValid cachedResponse: CachedURLResponse) {}
  func urlProtocol(_ protocol: URLProtocol, didReceive response: URLResponse, cacheStoragePolicy policy: URLCache.StoragePolicy) {}
  func urlProtocol(_ protocol: URLProtocol, didLoad data: Data) {}
  func urlProtocol(_ protocol: URLProtocol, didFailWithError error: Error) {}
  func urlProtocol(_ protocol: URLProtocol, didReceive challenge: URLAuthenticationChallenge) {}
  func urlProtocol(_ protocol: URLProtocol, didCancel challenge: URLAuthenticationChallenge) {}
}
