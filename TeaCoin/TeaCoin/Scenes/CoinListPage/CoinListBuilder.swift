//
//  CoinListBuilder.swift
//  TeaCoin
//
//  Created by Hasanberk Yiğit on 24.01.2022.
//

import UIKit

final class CoinListBuilder {
    
    static func make() -> CoinListViewController {
        let storyboard = UIStoryboard(name: "CoinList", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "CoinListViewController") as! CoinListViewController
        
        return viewController
    }
}
