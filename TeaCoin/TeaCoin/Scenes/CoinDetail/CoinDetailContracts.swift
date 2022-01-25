//
//  CoinDetailContracts.swift
//  TeaCoin
//
//  Created by Hasanberk Yiğit on 25.01.2022.
//

import Foundation

protocol CoinDetailViewModelDelegate: AnyObject {
    func showDetail(_ presentation: CoinDetailPresentation)
}

protocol CoinDetailViewModelProtocol: AnyObject {
    var delegate: CoinDetailViewModelDelegate? {get set}
    func load()
}
