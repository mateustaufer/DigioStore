//
//  DigioStoreViewController.swift
//  DigioStore
//
//  Created by Mateus Eduardo Taufer dos Santos on 13/07/24.
//

import UIKit

class DigioStoreViewController: UIViewController {
    
    //IBOutlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
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
        self.title = "Digio Store"
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
            //            self.reloadSpotlightsCollectionView()
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
