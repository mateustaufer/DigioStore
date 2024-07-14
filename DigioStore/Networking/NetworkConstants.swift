//
//  NetworkConstants.swift
//  DigioStore
//
//  Created by Mateus Eduardo Taufer dos Santos on 13/07/24.
//

import Foundation

class NetworkConstants {
    
    public static var shared: NetworkConstants = NetworkConstants()
    
    public var serverAddress: String {
        get {
            "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/"
        }
    }
}
