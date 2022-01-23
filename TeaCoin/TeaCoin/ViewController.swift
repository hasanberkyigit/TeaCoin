//
//  ViewController.swift
//  TeaCoin
//
//  Created by Hasanberk Yiğit on 22.01.2022.
//

import UIKit
import TeaCoinAPI

class ViewController: UIViewController {
    
    let service: CoinsServiceProtocol = CoinsService()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        service.fetchCoins{ result in
            
            print(result)
        }
        
    
    }


}

