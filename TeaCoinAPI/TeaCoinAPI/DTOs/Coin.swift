//
//  Coin.swift
//  TeaCoinAPI
//
//  Created by Hasanberk Yiğit on 22.01.2022.
//

import Foundation

public struct CoinsResponse: Decodable{
    let data: Coin
}
public struct Coin: Decodable {
    public let coins: [List]
    
}
public struct List: Decodable {
    
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
    public let color:  String
    public let iconUrl: URL
    public let marketCap: String
    public let price: String
    public let listedAt: Int
    public let change: String
    public let sparkLine: [String]
    public let twentyFourHourVolume: String
}
