//
//  UIButton+Extensions.swift
//  TravelTalk
//
//  Created by Youngjun Kim on 7/21/25.
//

import UIKit

@available(iOS 15.0, *)
extension UIButton.Configuration {
    static func travelStyle(image: UIImage?) -> UIButton.Configuration {
        var configuration = UIButton.Configuration.plain()
        configuration.image = image
        configuration.baseForegroundColor = .darkGrayForegroundColor
        return configuration
    }
}
