//
//  Result.swift
//  TeaCoinAPI
//
//  Created by Hasanberk Yiğit on 23.01.2022.
//

import Foundation

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}
