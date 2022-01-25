//
//  UIImageView+Extension.swift
//  TeaCoin
//
//  Created by Hasanberk Yiğit on 25.01.2022.
//
import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with urlString: String){
        guard let url = URL.init(string: urlString) else {
            return
        }
        let resource = ImageResource(downloadURL: url, cacheKey: urlString)
        var kf = self.kf
        kf.indicatorType = .activity
        self.kf.setImage(with: resource)
    }
}
