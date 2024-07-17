//
//  DigioStoreTests.swift
//  DigioStoreTests
//
//  Created by Mateus Eduardo Taufer dos Santos on 13/07/24.
//

import XCTest
@testable import DigioStore

final class DigioStoreTests: XCTestCase {

    func testHelloWorld() {
        var helloWord: String?
        
        XCTAssertNil(helloWord)
        
        helloWord = "Hello world!"
        XCTAssertEqual(helloWord, "Hello world")
    }

}
