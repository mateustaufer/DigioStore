//
//  SpotlightCollectionViewCell.swift
//  DigioStore
//
//  Created by Mateus Eduardo Taufer dos Santos on 14/07/24.
//

import UIKit
import SDWebImage

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
        
    }
    
    
    func setupSpotlightCell(viewModel: SpotlightViewModel) {
        self.spotlightImageView.sd_setImage(with: viewModel.bannerURL)
    }
    
}
