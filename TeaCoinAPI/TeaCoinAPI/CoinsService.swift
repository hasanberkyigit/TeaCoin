//
//  TeaCoinAPIClient.swift
//  TeaCoinAPI
//
//  Created by Hasanberk Yiğit on 22.01.2022.
//

import Foundation
import Alamofire

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
        
        AF.request(urlString).responseData { (response) in
            switch response.result {
            case .success(let data):
                let decoder = Decoders.plainDateDecoder
                do {
                    let response = try decoder.decode(CoinResponse.self, from: data)
                    completion(.success(response))
                } catch {
                    completion(.failure(Error.serializationError(internal: error)))
                }
            case .failure(let error):
                completion(.failure(Error.networkError(internal: error)))
            }
        }
    }
}
