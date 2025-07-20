//
//  VCConstants.swift
//  TravelTalk
//
//  Created by Youngjun Kim on 7/19/25.
//

import UIKit

struct VCConstants {
    static let cellHeight: CGFloat = 70
    static let spacing: CGFloat = 16
    static let columns: CGFloat = 1
    static func cellWidth() -> CGFloat {
        let deviceWidth = UIScreen.main.bounds.width
        return (deviceWidth - spacing * (columns + 1)) / columns
    }
}
