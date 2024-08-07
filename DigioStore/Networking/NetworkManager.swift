//
//  APICaller.swift
//  DigioStore
//
//  Created by Mateus Eduardo Taufer dos Santos on 13/07/24.
//

import Foundation
import UIKit

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
}

public class NetworkManager {
    static let shared = NetworkManager()
    
    func getDigioStore(completionHandler: @escaping (_ result: Result<DigioStoreModel, NetworkError>) -> Void) {
        let urlString = NetworkConstants.shared.serverAddress + "products"
        
        guard let url = URL(string: urlString) else {
            completionHandler(Result.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, err in
            if err == nil,
               let data = dataResponse,
               let resultData = try? JSONDecoder().decode(DigioStoreModel.self, from: data) {
                completionHandler(.success(resultData))
            } else {
                print(err.debugDescription)
                completionHandler(.failure(.invalidResponse))
            }
        }.resume()
    }
    
}
