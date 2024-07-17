//
//  DigioStoreTests.swift
//  DigioStoreTests
//
//  Created by Mateus Eduardo Taufer dos Santos on 13/07/24.
//

import XCTest
@testable import DigioStore

final class DigioStoreTests: XCTestCase {
    var viewModel: DigioStoreViewModel!
    
    override func setUpWithError() throws {
        viewModel = DigioStoreViewModel(networkManager: MockNetworkManager())
    }
    
    func testFetchData() {
        let expectation = XCTestExpectation(description: "Data fetched successfully")
        
        viewModel.getDataTest() { result in
            switch result {
            case .success(let data):
                let responseString = String(data: data, encoding: .utf8)
                XCTAssertEqual(responseString, "Mock API Response")
                expectation.fulfill()
            case .failure(let error):
                XCTFail("API call failed with error: \(error)")
            }
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
}
