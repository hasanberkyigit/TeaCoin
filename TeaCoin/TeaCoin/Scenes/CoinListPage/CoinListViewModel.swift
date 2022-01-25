//
//  CoinListViewModel.swift
//  TeaCoin
//
//  Created by Hasanberk Yiğit on 24.01.2022.
//

import Foundation
import TeaCoinAPI

enum ListedType: String, CaseIterable {
    case price = "Price", marketCap = "MarketCap", change = "Change", twentyFourHour = "24h Volume", listedAt = "ListedAt"
}

final class CoinListViewModel: CoinListViewModelProtocol {
  
    weak var delegate: CoinListViewModelDelegate?
    private let service: CoinsServiceProtocol
    private var coins: [CoinProperties] = []
    private var selectedType: ListedType = .price
    
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
                self.sortData()
            case .failure(let error):
                print(error)
            }
        }
    }
    func sortData(){
        switch selectedType {
        case .price:
            self.coins = coins.sorted(by: {$0.price.toDouble() > $1.price.toDouble()})
        case .change:
            self.coins = coins.sorted(by: {$0.change.toDouble() > $1.change.toDouble()})
        case .marketCap:
            self.coins = coins.sorted(by: {$0.marketCap.toDouble() > $1.marketCap.toDouble()})
        case .twentyFourHour:
            self.coins = coins.sorted(by: {$0.twentyFourHourVolume.toDouble() > $1.twentyFourHourVolume.toDouble()})
        case .listedAt :
            self.coins = coins.sorted(by: {$0.listedAt > $1.listedAt})
        }

        notify(.selectedType(selectedType))
        notify(.showCoinList(coins.map({ CoinPresentation(coin: $0) })))
    }
    
    func updateSelectedType(with listedType: ListedType) {
        self.selectedType = listedType
    }
   
    
    func selectCoin(at index: Int) {
        let coin = coins[index]
        let viewmodel = CoinDetailViewModel(coin: coin)
        delegate?.navigate(to: .detail(viewmodel))
    }
    
    private func notify(_ output: CoinListViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}

