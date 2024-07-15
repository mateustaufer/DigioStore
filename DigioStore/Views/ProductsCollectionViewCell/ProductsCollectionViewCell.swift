//
//  ProductsCollectionViewCell.swift
//  DigioStore
//
//  Created by Mateus Eduardo Taufer dos Santos on 15/07/24.
//

import UIKit

class ProductsCollectionViewCell: UICollectionViewCell {
    
    static var identifier: String {
        get {
            "ProductsCollectionViewCell"
        }
    }
    
    static func register() -> UINib {
        UINib(nibName: "ProductsCollectionViewCell", bundle: nil)
    }
    
    @IBOutlet weak var productView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        productView.round(16)
        productImageView.layer.borderWidth = 0.0
    }
    
    
    func setupProductCell(viewModel: ProductViewModel) {
        self.productImageView.load(url: (viewModel.imageURL!))
    }
    
}
