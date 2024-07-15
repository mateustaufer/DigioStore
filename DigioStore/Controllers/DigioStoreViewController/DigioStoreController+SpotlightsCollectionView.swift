//
//  DigioStoreController+CollectionView.swift
//  DigioStore
//
//  Created by Mateus Eduardo Taufer dos Santos on 15/07/24.
//

import Foundation
import UIKit

extension DigioStoreViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func setupSpotlightsCollectionView() {
        self.spotlightsCollectionView.delegate = self
        self.spotlightsCollectionView.dataSource = self
        
        self.registerSpotlightsCells()
    }
    
    func reloadSpotlightsCollectionView() {
        DispatchQueue.main.async {
            self.spotlightsCollectionView.reloadData()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.numberOfSections()
    }
    
    func registerSpotlightsCells() {
        self.spotlightsCollectionView.register(SpotlightCollectionViewCell.register(), forCellWithReuseIdentifier: SpotlightCollectionViewCell.identifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.numberOfSpotlights(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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
    
}
