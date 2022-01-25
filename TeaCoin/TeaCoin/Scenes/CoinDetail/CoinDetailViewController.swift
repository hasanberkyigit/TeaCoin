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
    @IBOutlet weak var coinNameLabel: UILabel!
    
    var viewModel: CoinDetailViewModelProtocol!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.load()
    }
    
}

extension CoinDetailViewController: CoinDetailViewModelDelegate {
    
    func showDetail(_ presentation: CoinDetailPresentation) {
       
        let changeRate = (presentation.price*(presentation.change))/100
        currentPriceLabel.text = "$\(presentation.price.percentageFormatter())"
        shortCodeLabel.text = presentation.symbol
        coinNameLabel.text = presentation.name
        changeRateLabel.textColor = presentation.change < 0 ? .red : .green
        changeRateLabel?.text = "\(presentation.change)%(\(changeRate.percentageFormatter()))"
        lowestPriceLabel.text = "Low:\(presentation.minimumAmount)"
        highestPriceLabel.text = "High:\(presentation.maximumAmount)"
    }
    
}
