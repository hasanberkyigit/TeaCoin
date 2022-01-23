//
//  Decoders.swift
//  TeaCoinAPI
//
//  Created by Hasanberk Yiğit on 22.01.2022.
//

import Foundation

public enum Decoders {
    //TODO: - Decoder for timestamps.
    static let plainDateDecoder: JSONDecoder = {
         //1330214400
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        decoder.dateDecodingStrategy = .secondsSince1970
        return decoder
    }()
}
