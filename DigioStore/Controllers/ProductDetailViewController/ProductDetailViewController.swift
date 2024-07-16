//
//  ProductDetailViewController.swift
//  DigioStore
//
//  Created by Mateus Eduardo Taufer dos Santos on 15/07/24.
//

import UIKit

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var viewModel: ProductViewModel
    
    init(viewModel: ProductViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "ProductDetailViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
    }
    
    func configView() {
        productImageView.load(url: viewModel.imageURL!)
        titleLabel.text = viewModel.name
        descriptionLabel.text = viewModel.description
    }
    
}
