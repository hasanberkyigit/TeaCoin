//
//  CoinDetailBuilder.swift
//  TeaCoin
//
//  Created by Hasanberk Yiğit on 25.01.2022.
//

import UIKit

final class CoinDetailBuilder {
    
    static func make(with viewModel: CoinDetailViewModelProtocol) -> CoinDetailViewController {
        let storyboard = UIStoryboard(name: "CoinDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "CoinDetailViewController") as! CoinDetailViewController
        viewController.viewModel = viewModel
        return viewController
    }
}
