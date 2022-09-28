//
//  URLSessionExtensionTests.swift
//  CatFancyTests
//
//  Created by Josh Adams on 6/1/21.
//

@testable import CatFancy
import XCTest

class URLSessionExtensionTests: XCTestCase {
  override class func setUp() {
    URLSession.didProcessURLs = false
  }

  override class func tearDown() {
    URLSession.didProcessURLs = false
  }

  func testStubData() {
    let session = URLSession.stubSession
    XCTAssert(session.configuration.protocolClasses?[0] is URLProtocolStub.Type)
    let expectedTestURLCount = 5
    XCTAssertEqual(expectedTestURLCount, URLProtocolStub.testURLs.count)
  }
}
