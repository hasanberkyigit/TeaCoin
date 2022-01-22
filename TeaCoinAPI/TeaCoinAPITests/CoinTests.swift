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
        
        XCTAssertEqual(coin.data.coins.first?.uuid, "Qwsogvtv82FCd")
        XCTAssertEqual(coin.data.coins.first?.symbol, "BTC")
        XCTAssertEqual(coin.data.coins.first?.name, "Bitcoin")
        XCTAssertEqual(coin.data.coins.first?.color, "#f7931A")
        XCTAssertEqual(coin.data.coins.first?.iconUrl, URL(string: "https://cdn.coinranking.com/bOabBYkcX/bitcoin_btc.svg"))
        XCTAssertEqual(coin.data.coins.first?.marketCap, "1064845170034")
        XCTAssertEqual(coin.data.coins.first?.price, "56373.67522635439")
        XCTAssertEqual(coin.data.coins.first?.listedAt, 1330214400)
        XCTAssertEqual(coin.data.coins.first?.change, "-3.61")
        XCTAssertEqual(coin.data.coins.first?.sparkline[0], "58484.1797527997004874770000")
    }
    
}
