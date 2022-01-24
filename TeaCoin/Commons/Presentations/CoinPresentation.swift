//
//  CoinPresentation.swift
//  TeaCoin
//
//  Created by Hasanberk Yiğit on 24.01.2022.
//

import Foundation

final class CoinPresentation: NSObject {
    
    let symbol: String
    let name: String
    let price: String
    let change: String
    let icon: URL
    
    init(symbol: String, name: String, price: String, change: String, icon: URL) {
        self.symbol = symbol
        self.name = name
        self.price = price
        self.change = change
        self.icon = icon
        super.init()
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? CoinPresentation else {return false}
        return self.symbol == other.symbol && self.name == other.name && self.price == other.price && self.change == other.change && self.icon == other.icon
        
        
    }
}
