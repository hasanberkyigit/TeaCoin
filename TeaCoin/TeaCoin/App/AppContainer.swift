//
//  AppContainer.swift
//  TeaCoin
//
//  Created by Hasanberk Yiğit on 24.01.2022.
//

import Foundation
import TeaCoinAPI

let app = AppContainer()

final class AppContainer {
    
    let router = AppRouter()
    let service = CoinsService()
}
