//
//  DigioStoreViewModel.swift
//  DigioStore
//
//  Created by Mateus Eduardo Taufer dos Santos on 13/07/24.
//

import Foundation

class DigioStoreViewModel {
    
    var isLoadingData: Observable<Bool> = Observable(false)
    var digioStoreData: DigioStoreModel?
    var spotlights: Observable<[SpotlightViewModel]> = Observable(nil)
    var cash: Observable<CashViewModel> = Observable(nil)
    var products: Observable<[ProductViewModel]> = Observable(nil)
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfSpotlights(in section: Int) -> Int {
        digioStoreData?.spotlights.count ?? 0
    }
    
    func numberOfProducts(in section: Int) -> Int {
        digioStoreData?.products.count ?? 0
    }
    
    func getData() {
        if isLoadingData.value ?? true {
            return
        }
        
        isLoadingData.value = true
        
        APICaller.getDigioStore{[weak self] result in
            self?.isLoadingData.value = false
            
            switch result {
            case .success(let data):
                self?.digioStoreData = data
                self?.mapSpotlightsData()
                self?.mapCashData()
                self?.mapProductsData()
            case .failure(let err):
                print(err)
            }
        }
    }
    
    private func mapSpotlightsData() {
        spotlights.value = self.digioStoreData?.spotlights.compactMap({SpotlightViewModel(spotlight: $0)})
    }
    
    func retriveSpotlight(withId name: String) -> Spotlight? {
        guard let spotlight = digioStoreData?.spotlights.first(where: {$0.name == name}) else {
            return nil
        }
        
        return spotlight
    }
    
    private func mapCashData() {
        cash.value = CashViewModel(cash: self.digioStoreData?.cash ?? Cash(title: "", bannerURL: "", description: ""))
    }
    
    private func mapProductsData() {
        products.value = self.digioStoreData?.products.compactMap({ProductViewModel(product: $0)})
    }
    
    func retriveProduct(withId name: String) -> Product? {
        guard let product = digioStoreData?.products.first(where: {$0.name == name}) else {
            return nil
        }
        
        return product
    }
    
}
