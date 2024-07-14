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
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfSpotlights(in section: Int) -> Int {
        return digioStoreData?.spotlights.count ?? 0
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
                self?.mapSpotlightData()
            case .failure(let err):
                print(err)
            }
        }
    }
    
    private func mapSpotlightData() {
        spotlights.value = self.digioStoreData?.spotlights.compactMap({SpotlightViewModel(spotlight: $0)})
    }
    
    func retriveSpotlight(withId name: String) -> Spotlight? {
        guard let spotlight = digioStoreData?.spotlights.first(where: {$0.name == name}) else {
            return nil
        }
        
        return spotlight
    }
    
}
