//
//  TravelCollectionViewCell.swift
//  TravelTalk
//
//  Created by Youngjun Kim on 7/18/25.
//

import UIKit

class TravelCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TravelCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    func configureUI() {
        backgroundColor = .red
    }
}
