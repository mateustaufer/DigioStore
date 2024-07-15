//
//  DigioStoreViewController.swift
//  DigioStore
//
//  Created by Mateus Eduardo Taufer dos Santos on 13/07/24.
//

import UIKit

class DigioStoreViewController: UIViewController {
    
    //IBOutlets
    @IBOutlet weak var spotlightsCollectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var userImageView: UIImageView!
    
    //ViewModels
    var viewModel: DigioStoreViewModel = DigioStoreViewModel()
    
    //Variables
    var spotlightsDataSource: [SpotlightViewModel] = []
    var cashDataSource: CashViewModel = CashViewModel(cash: Cash(title: "", bannerURL: "", description: ""))
    var productsDataSource: [ProductViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
        bindViewModel()
    }
    
    func configView() {
        self.userImageView.layer.borderWidth = 1.0
        self.userImageView.layer.masksToBounds = false
        self.userImageView.layer.borderColor = UIColor.white.cgColor
        self.userImageView.layer.cornerRadius = self.userImageView.frame.size.width / 2
        self.userImageView.clipsToBounds = true
        
        self.setupSpotlightsCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }
    
    func bindViewModel() {
        viewModel.isLoadingData.bind { [weak self] isLoading in
            guard let isLoading = isLoading else {
                return
            }
            
            DispatchQueue.main.async {
                if isLoading {
                    self?.activityIndicator.startAnimating()
                } else {
                    self?.activityIndicator.stopAnimating()
                }
            }
        }
        
        viewModel.spotlights.bind { [weak self] spotlights in
            guard let self = self,
                  let spotlights = spotlights else {
                return
            }
            
            self.spotlightsDataSource = spotlights
            self.reloadSpotlightsCollectionView()
        }
        
        viewModel.cash.bind { [weak self] cash in
            guard let self = self,
                  let cash = cash else {
                return
            }
            
            self.cashDataSource = cash
            //            self.reloadCashView()
        }
        
        viewModel.products.bind { [weak self] products in
            guard let self = self,
                  let products = products else {
                return
            }
            
            self.productsDataSource = products
            //            self.reloadProductsCollectionView()
        }
    }
    
}
