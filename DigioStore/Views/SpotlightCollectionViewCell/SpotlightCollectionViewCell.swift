//
//  SpotlightCollectionViewCell.swift
//  DigioStore
//
//  Created by Mateus Eduardo Taufer dos Santos on 14/07/24.
//

import UIKit

class SpotlightCollectionViewCell: UICollectionViewCell {
    
    static var identifier: String {
        get {
            "SpotlightCollectionViewCell"
        }
    }
    
    static func register() -> UINib {
        UINib(nibName: "SpotlightCollectionViewCell", bundle: nil)
    }
    
    @IBOutlet weak var spotlightImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        spotlightImageView.round(8)
    }
    
    
    func setupSpotlightCell(viewModel: SpotlightViewModel) {
        self.spotlightImageView.load(url: viewModel.bannerURL!)
    }
    
}
