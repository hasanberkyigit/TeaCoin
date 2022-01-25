//
//  CoinDetailPresentation+API.swift
//  TeaCoin
//
//  Created by Hasanberk Yiğit on 25.01.2022.
//

import Foundation
import TeaCoinAPI


extension CoinDetailPresentation {
    
    init(coin: CoinProperties){
        self.init(name: coin.name, symbol: coin.symbol, price: coin.price, change: coin.change, sparkLine: coin.sparkLine.sorted())
    }
}
