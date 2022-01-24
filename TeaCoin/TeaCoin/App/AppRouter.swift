//
//  AppRouter.swift
//  TeaCoin
//
//  Created by Hasanberk Yiğit on 24.01.2022.
//

import UIKit

final class AppRouter {
    
    let window: UIWindow?
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start(){
        let viewController = CoinListBuilder.make()
        let navigationController =  UINavigationController(rootViewController: viewController)
        window!.rootViewController = navigationController
        window!.makeKeyAndVisible()
    }
}
