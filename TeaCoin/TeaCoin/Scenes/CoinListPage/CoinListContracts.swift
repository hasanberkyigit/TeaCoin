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
    func sortData()
    func updateSelectedType(with listedType: ListedType)
    func selectCoin(at index: Int)
}

enum CoinListViewModelOutput: Equatable {
    case updateTitle(String)
    case setLoading(Bool)
    case showCoinList([CoinPresentation])
    case selectedType(ListedType)
}

enum CoinListViewRoute {
    case detail(CoinDetailViewModelProtocol)
}

protocol CoinListViewModelDelegate: AnyObject {
    func handleViewModelOutput(_ output: CoinListViewModelOutput)
        func navigate(to route: CoinListViewRoute)
}
