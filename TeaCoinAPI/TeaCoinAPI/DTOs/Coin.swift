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
    public let uuid: String
    public let symbol: String
    public let name: String
    public let color:  String
    public let iconUrl: URL
    public let marketCap: String
    public let price: String
    public let listedAt: Int
    public let change: String
    public let sparkline: [String]
}
