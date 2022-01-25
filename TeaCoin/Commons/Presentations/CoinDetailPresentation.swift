//
//  CoinDetailPresentation.swift
//  TeaCoin
//
//  Created by Hasanberk Yiğit on 25.01.2022.
//

import Foundation

struct CoinDetailPresentation: Equatable {
    let name: String
    let symbol: String
    let price: Double
    let change: Double
    let sparkLine: [Double]
}

extension CoinDetailPresentation {
    
    public var minimumAmount: String {
        sparkLine.sorted().first?.percentageFormatter() ?? ""
    }
    public var maximumAmount: String {
        sparkLine.sorted().last?.percentageFormatter() ?? ""
    }
    
}
