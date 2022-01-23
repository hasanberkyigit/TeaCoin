//
//  TeaCoinAPIClient.swift
//  TeaCoinAPI
//
//  Created by Hasanberk Yiğit on 22.01.2022.
//

import Foundation

public protocol CoinsServiceProtocol {
    func fetchCoins(completion: @escaping (Result<CoinResponse>) -> Void)
}

public class CoinsService: CoinsServiceProtocol{
    
    public enum Error: Swift.Error {
        case serializationError(internal: Swift.Error)
        case networkError(internal: Swift.Error)
    }
    public init() {}
    public func fetchCoins(completion: @escaping (Result<CoinResponse>) -> Void) {
       
        let urlString = "https://psp-merchantpanel-service-sandbox.ozanodeme.com.tr/api/v1/dummy/coins"
        
        
            }
}
