//
//  CoinTests.swift
//  TeaCoinAPITests
//
//  Created by Hasanberk Yiğit on 22.01.2022.
//

import XCTest
@testable import TeaCoinAPI

class CoinTests: XCTestCase {

    func testParsing() throws {
        let bundle = Bundle(for: CoinTests.self)
        let url = bundle.url(forResource: "coin", withExtension: "json")
        guard let url = url else { return }
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let coin = try decoder.decode(CoinsResponse.self, from: data)
        print(coin)
    }

    
}
