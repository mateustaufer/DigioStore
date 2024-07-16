//
//  ProductViewModel.swift
//  DigioStore
//
//  Created by Mateus Eduardo Taufer dos Santos on 14/07/24.
//

import Foundation

class ProductViewModel {
    var product: Product
    var name: String
    var imageURL: URL?
    var description: String
    
    init(product: Product) {
        self.product = product
        self.name = product.name
        self.imageURL = URL(string: product.imageURL)
        self.description = product.description
    }
}
