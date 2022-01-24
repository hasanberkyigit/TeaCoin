//
//  CoinListContracts.swift
//  TeaCoin
//
//  Created by Hasanberk Yiğit on 24.01.2022.
//

import Foundation


protocol CoinListViewModelProtocol {
    var delegate: CoinListViewModelDelegate? { get set }
    func load()
    func selectCoin(at index: Int)
}

enum CoinListViewModelOutput: Equatable {
    case updateTitle(String)
    case setLoading(Bool)
    case showCoinList([CoinPresentation])
}

enum CoinListViewRoute {
    case detail(CoinListViewModelProtocol)
}

protocol CoinListViewModelDelegate: class {
    func handleViewModelOutput(_ output: CoinListViewModelOutput)
}
