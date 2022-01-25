//
//  CoinListViewModel.swift
//  TeaCoin
//
//  Created by Hasanberk Yiğit on 24.01.2022.
//

import Foundation
import TeaCoinAPI


final class CoinListViewModel: CoinListViewModelProtocol {
  
    weak var delegate: CoinListViewModelDelegate?
    private let service: CoinsServiceProtocol
    private var coins: [CoinProperties] = []
    
    init(service: CoinsServiceProtocol) {
        self.service = service
    }
    
    func load() {
        notify(.updateTitle("Coins"))
        notify(.setLoading(true))
        
        service.fetchCoins { [weak self] (result) in
            guard let self = self else { return }
            self.notify(.setLoading(false))
            
            switch result {
            case .success(let response):
                self.coins = response.coins
                let presentations = response.coins.map({ CoinPresentation(coin: $0) })
                self.notify(.showCoinList(presentations))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func selectCoin(at index: Int) {
        //TODO: Implement

    }
    
    private func notify(_ output: CoinListViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}

