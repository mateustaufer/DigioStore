//
//  SpotlightViewModel.swift
//  DigioStore
//
//  Created by Mateus Eduardo Taufer dos Santos on 14/07/24.
//

import Foundation

class SpotlightViewModel {
    var name: String
    var bannerURL: URL?
    var description: String
    
    init(spotlight: Spotlight) {
        self.name = spotlight.name
        self.bannerURL = URL(string: spotlight.bannerURL)
        self.description = spotlight.description
    }
}
