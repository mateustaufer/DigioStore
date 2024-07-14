//
//  cashViewModel.swift
//  DigioStore
//
//  Created by Mateus Eduardo Taufer dos Santos on 14/07/24.
//

import Foundation

class CashViewModel {
    var title: String
    var bannerURL: URL?
    var description: String
    
    init(cash: Cash) {
        self.title = cash.title
        self.bannerURL = URL(string: cash.bannerURL)
        self.description = cash.description
    }
}
