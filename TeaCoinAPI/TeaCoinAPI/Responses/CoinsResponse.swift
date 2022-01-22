//
//  CoinsResponse.swift
//  TeaCoinAPI
//
//  Created by Hasanberk Yiğit on 22.01.2022.
//

import Foundation


public struct CoinResponse: Decodable {
    
    private enum RootCodingKeys: String, CodingKey {
        case data
    }
    
    private enum CoinsCodingKeys: String, CodingKey {
        case coins
    }
    
    public let coins: [Coins]
    
    init(coins: [Coins]) {
        self.coins = coins
    }
    
    init(with decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        let coinsContainer = try rootContainer.nestedContainer(keyedBy: CoinsCodingKeys.self, forKey: .data)
        self.coins = try coinsContainer.decode([Coins].self, forKey: .coins)
        
    }
    
}
