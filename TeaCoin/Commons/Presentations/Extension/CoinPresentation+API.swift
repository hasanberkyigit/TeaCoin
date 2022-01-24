//
//  CoinPresentation+API.swift
//  TeaCoin
//
//  Created by Hasanberk Yiğit on 24.01.2022.
//

import Foundation
import TeaCoinAPI

extension CoinPresentation {
    
    convenience init(coin: CoinProperties) {
        self.init(symbol: coin.symbol, name: coin.name, price: coin.price, change: coin.change, icon: coin.iconUrl)
    }
}
