//
//  DigioStoreTestViewModel.swift
//  DigioStoreTests
//
//  Created by Mateus Eduardo Taufer dos Santos on 17/07/24.
//

import Foundation
@testable import DigioStore

class DigioStoreViewModel {
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = .shared) {
        self.networkManager = networkManager
    }
    
    func getDataTest(completionHandler: @escaping (_ result: Result<Data, NetworkError>) -> Void) {
        networkManager.getDigioStore{result in
            switch result {
            case .success(let data):
                print(data)
            case .failure(let err):
                print(err)
            }
        }
    }
    
}
