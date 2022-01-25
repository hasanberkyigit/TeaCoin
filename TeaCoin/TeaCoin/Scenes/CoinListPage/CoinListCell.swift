//
//  CoinListCell.swift
//  TeaCoin
//
//  Created by Hasanberk Yiğit on 24.01.2022.
//

import UIKit
import Kingfisher

final class CoinListCell: UITableViewCell {
    
    @IBOutlet weak var coinImage: UIImageView!
    @IBOutlet weak var shortCodeLabel: UILabel!
    @IBOutlet weak var coinNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var priceChangeLabel: UILabel!
    
    func cellConfigure(data: CoinPresentation){
        
        let changeRate = (data.price*(data.change))/100
        coinImage.setImage(with: data.icon.svgToPng())
        shortCodeLabel.text = data.symbol
        coinNameLabel.text = data.name
        priceLabel.text = "$\(data.price.percentageFormatter())"
        priceChangeLabel.textColor = data.change < 0 ? .red : .green
        priceChangeLabel?.text = "\(data.change)%(\(changeRate.percentageFormatter()))"
    }
}

