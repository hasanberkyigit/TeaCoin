//
//  TeaCoinAPIClient.swift
//  TeaCoinAPI
//
//  Created by Hasanberk Yiğit on 22.01.2022.
//

import Foundation

protocol CoinsServiceProtocol {
    func fetchCoins(completion: ([Coins]) -> Void)
}

class CoinsService: CoinsServiceProtocol{
    
    func fetchCoins(completion: ([Coins]) -> Void) {
        <#code#>
    }
    
    
}
