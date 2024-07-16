//
//  DigioStoreController+CollectionView.swift
//  DigioStore
//
//  Created by Mateus Eduardo Taufer dos Santos on 15/07/24.
//

import Foundation
import UIKit

extension DigioStoreViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func setupCollectionView() {
        self.spotlightsCollectionView.delegate = self
        self.spotlightsCollectionView.dataSource = self
        
        self.cashCollectionView.delegate = self
        self.cashCollectionView.dataSource = self
        
        self.productsCollectionView.delegate = self
        self.productsCollectionView.dataSource = self
        
        self.registerCells()
    }
    
    func registerCells() {
        self.spotlightsCollectionView.register(SpotlightCollectionViewCell.register(), forCellWithReuseIdentifier: SpotlightCollectionViewCell.identifier)
        
        self.cashCollectionView.register(CashCollectionViewCell.register(), forCellWithReuseIdentifier: CashCollectionViewCell.identifier)
        
        self.productsCollectionView.register(ProductsCollectionViewCell.register(), forCellWithReuseIdentifier: ProductsCollectionViewCell.identifier)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.numberOfSections()
    }
    
    func reloadSpotlightsCollectionView() {
        DispatchQueue.main.async {
            self.spotlightsCollectionView.reloadData()
        }
    }
    
    func reloadCashCollectionView() {
        DispatchQueue.main.async {
            self.cashCollectionView.reloadData()
        }
    }
    
    func reloadProductsCollectionView() {
        DispatchQueue.main.async {
            self.productsCollectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == self.spotlightsCollectionView) {
            return self.viewModel.numberOfSpotlights(in: section)
        }
        
        if (collectionView == self.cashCollectionView) {
            return 1
        }
        
        return self.viewModel.numberOfProducts(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == self.spotlightsCollectionView) {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SpotlightCollectionViewCell.identifier, for: indexPath) as? SpotlightCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.setupSpotlightCell(viewModel: spotlightsDataSource[indexPath.row])
            cell.layer.cornerRadius = 8.0
            cell.layer.borderWidth = 0.0
            cell.layer.shadowColor = UIColor.lightGray.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 0)
            cell.layer.shadowRadius = 2.0
            cell.layer.shadowOpacity = 0.6
            cell.layer.masksToBounds = false
            
            return cell
        }
        
        if (collectionView == self.cashCollectionView) {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CashCollectionViewCell.identifier, for: indexPath) as? CashCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.setupCashCell(viewModel: cashDataSource)
            cell.layer.cornerRadius = 8.0
            cell.layer.borderWidth = 0.0
            cell.layer.shadowColor = UIColor.lightGray.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 0)
            cell.layer.shadowRadius = 2.0
            cell.layer.shadowOpacity = 0.6
            cell.layer.masksToBounds = false
            
            return cell
        }
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsCollectionViewCell.identifier, for: indexPath) as? ProductsCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.setupProductCell(viewModel: productsDataSource[indexPath.row])
        cell.layer.cornerRadius = 16.0
        cell.layer.borderWidth = 0.0
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.layer.shadowRadius = 3.0
        cell.layer.shadowOpacity = 0.6
        cell.layer.masksToBounds = false
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (collectionView == self.productsCollectionView) {
            let productName = productsDataSource[indexPath.row].name
            self.openProductDetail(productName: productName)
        }
    }
    
}
