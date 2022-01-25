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
    
    private let pngString:String = ""
    
    private var coinList: [CoinPresentation] = []
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func cellConfigure(data: CoinPresentation){
        
        let str = pngString.svgToPng(data.icon)
        coinImage.setImage(with: str )
        shortCodeLabel.text = data.symbol
        coinNameLabel.text = data.name
        priceLabel.text = data.price
        //TODO: Change me
        if Double(data.change) ?? 0 < 0 {
            priceChangeLabel.textColor = UIColor.red
            shortCodeLabel?.text = data.symbol
        }else {
            priceChangeLabel.textColor = UIColor.green
            shortCodeLabel?.text = data.symbol
        }
    }
}

