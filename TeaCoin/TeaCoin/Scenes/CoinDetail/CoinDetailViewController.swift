//
//  CoinDetailViewController.swift
//  TeaCoin
//
//  Created by Hasanberk Yiğit on 25.01.2022.
//

import UIKit

class CoinDetailViewController: UIViewController {
    
    @IBOutlet weak var currentPriceLabel: UILabel!
    @IBOutlet weak var shortCodeLabel: UILabel!
    @IBOutlet weak var changeRateLabel: UILabel!
    @IBOutlet weak var highestPriceLabel: UILabel!
    @IBOutlet weak var lowestPriceLabel: UILabel!
    
    var viewModel: CoinDetailViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.load()
    }
    
}

extension CoinDetailViewController: CoinDetailViewModelDelegate {
    
    func showDetail(_ presentation: CoinDetailPresentation) {
        currentPriceLabel.text = presentation.price
        shortCodeLabel.text = presentation.symbol
        changeRateLabel.text = presentation.change
        highestPriceLabel.text = presentation.sparkLine.last
        lowestPriceLabel.text = presentation.sparkLine.first
    }
    
}
