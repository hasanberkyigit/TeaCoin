//
//  String+Extension.swift
//  TeaCoin
//
//  Created by Hasanberk Yiğit on 25.01.2022.
//

import Foundation

extension String {
    
   
    public static func splitAtFirst(str: String, delimiter: String) -> (a: String, b: String)? {
       guard let upperIndex = (str.range(of: delimiter)?.upperBound), let lowerIndex = (str.range(of: delimiter)?.lowerBound) else { return nil }
       let firstPart: String = .init(str.prefix(upTo: lowerIndex))
       let lastPart: String = .init(str.suffix(from: upperIndex))
       return (firstPart, lastPart)
    }
    
    public func svgToPng(_ string: String) -> String{
         
        let pngString = String.splitAtFirst(str: string, delimiter: "svg")
        let firstPart = pngString?.a
        guard let firstPart = firstPart else {return ""}
        let toPng = "\(firstPart)png"
        
         return toPng
     }
    //TODO: toDouble
}
