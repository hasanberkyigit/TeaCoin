//
//  String+Extension.swift
//  TeaCoin
//
//  Created by Hasanberk Yiğit on 25.01.2022.
//

import Foundation

extension String {
    
    
    public func svgToPng() -> String{
        return self.replacingOccurrences(of: ".svg", with: ".png")
    }
    
    func toDouble() -> Double {
        return Double(self) ?? 0.00
    }
    
}

extension Double {
    
    func percentageFormatter() -> String {
        return String(format: "%.2f", self)
    }
}
