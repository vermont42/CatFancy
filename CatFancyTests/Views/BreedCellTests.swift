//
//  BreedCellTests.swift
//  CatFancyTests
//
//  Created by Josh Adams on 6/1/21.
//

@testable import CatFancy
import XCTest

class BreedCellTests: XCTestCase {
  func testBreedCell() {
    let cell = BreedCell(style: .default, reuseIdentifier: "\(BreedCell.self)")

    let breed = Breed(name: "", knownFor: "", popularity: 42, photoUrl: MockData.photoURL, infoUrl: MockData.photoURL, credit: "", license: .publicDomain, description: "")

    cell.configure(breed: breed)

    XCTAssertEqual(breed.name, cell.name.text)
    XCTAssertEqual("Popularity: \(breed.popularity)", cell.popularity.text)
    XCTAssertEqual(Symbols.pawPrint, cell.photo.image)
  }
}
