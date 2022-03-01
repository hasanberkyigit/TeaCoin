//
//  CoinDetailViewModel.swift
//  TeaCoin
//
//  Created by Hasanberk Yiğit on 25.01.2022.
//

import Foundation
import TeaCoinAPI

final class CoinDetailViewModel: CoinDetailViewModelProtocol {
    
    weak var delegate: CoinDetailViewModelDelegate?
    private let presentation: CoinDetailPresentation
    
    init(coin: CoinProperties) {
        self.presentation = CoinDetailPresentation(coin: coin)
    }
    
    func load() {
        delegate?.showDetail(presentation)
    }
    
}
