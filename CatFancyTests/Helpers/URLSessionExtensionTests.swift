// Created by Josh Adams, who holds the copyright and reserves all rights, on 9/24/22.

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
