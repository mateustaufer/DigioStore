//
//  CashCollectionViewCell.swift
//  DigioStore
//
//  Created by Mateus Eduardo Taufer dos Santos on 15/07/24.
//

import UIKit

class CashCollectionViewCell: UICollectionViewCell {
    
    static var identifier: String {
        get {
            "CashCollectionViewCell"
        }
    }
    
    static func register() -> UINib {
        UINib(nibName: "CashCollectionViewCell", bundle: nil)
    }
    
    @IBOutlet weak var cashImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cashImageView.round(8)
    }
    
    
    func setupCashCell(viewModel: CashViewModel) {
        self.cashImageView.load(url: (viewModel.bannerURL ?? URL(string: "https://s3-sa-east-1.amazonaws.com/digio-exame/cash_banner.png")!))
    }
    
}
