//
//  Coin.swift
//  TeaCoinAPI
//
//  Created by Hasanberk Yiğit on 22.01.2022.
//

import Foundation

public struct Coins: Decodable{
    let data: CoinList
}
public struct CoinList: Decodable {
    public let stats: Stats
    public let coins: [CoinProperties]
    
}
public struct CoinProperties: Decodable {
    
    public enum CodingKeys: String, CodingKey {
        case uuid
        case symbol
        case name
        case color
        case iconUrl
        case marketCap
        case price
        case listedAt
        case change
        case sparkLine = "sparkline"
        case twentyFourHourVolume = "24hVolume"
    }
    
    public let uuid: String
    public let symbol: String
    public let name: String
    public let color:  String?
    public let iconUrl: String
    public let marketCap: String
    public let price: String
    public let listedAt: Int
    public let change: String
    public let sparkLine: [String]
    public let twentyFourHourVolume: String
}
// MARK: - Stats
 public struct Stats: Codable {
    public let total, totalCoins, totalMarkets, totalExchanges: Int
    public let totalMarketCap, total24HVolume: String

    public enum CodingKeys: String, CodingKey {
        case total, totalCoins, totalMarkets, totalExchanges, totalMarketCap
        case total24HVolume = "total24hVolume"
    }
}
