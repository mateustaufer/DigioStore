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
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var digioLabel: UILabel!
    @IBOutlet weak var cashLabel: UILabel!
    @IBOutlet weak var cashCollectionView: UICollectionView!
    @IBOutlet weak var productsLabel: UILabel!
    @IBOutlet weak var productsCollectionView: UICollectionView!
    
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
        self.userImageView.isHidden = true
        
        self.userNameLabel.isHidden = true
        
        self.spotlightsCollectionView.isHidden = true
        
        self.digioLabel.isHidden = true
        self.cashLabel.isHidden = true
        self.cashCollectionView.isHidden = true
        
        self.productsLabel.isHidden = true
        self.productsCollectionView.isHidden = true
        
        self.setupCollectionView()
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
                    self?.userImageView.isHidden = false
                    self?.userNameLabel.isHidden = false
                    self?.spotlightsCollectionView.isHidden = false
                    self?.digioLabel.isHidden = false
                    self?.cashLabel.isHidden = false
                    self?.cashCollectionView.isHidden = false
                    self?.productsLabel.isHidden = false
                    self?.productsCollectionView.isHidden = false
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
            self.reloadCashCollectionView()
        }
        
        viewModel.products.bind { [weak self] products in
            guard let self = self,
                  let products = products else {
                return
            }
            
            self.productsDataSource = products
            self.reloadProductsCollectionView()
        }
    }
    
}
