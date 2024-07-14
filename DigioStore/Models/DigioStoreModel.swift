//
//  DigioStoreModel.swift
//  DigioStore
//
//  Created by Mateus Eduardo Taufer dos Santos on 13/07/24.
//

import Foundation

// MARK: - DigioStoreModel
struct DigioStoreModel: Codable {
    let spotlights: [Spotlight]
    let products: [Product]
    let cash: Cash
}

// MARK: - Cash
struct Cash: Codable {
    let title: String
    let bannerURL: String
    let description: String
}

// MARK: - Product
struct Product: Codable {
    let name: String
    let imageURL: String
    let description: String
}

// MARK: - Spotlight
struct Spotlight: Codable {
    let name: String
    let bannerURL: String
    let description: String
}
