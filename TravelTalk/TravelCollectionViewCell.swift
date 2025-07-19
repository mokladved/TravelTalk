//
//  TravelCollectionViewCell.swift
//  TravelTalk
//
//  Created by Youngjun Kim on 7/18/25.
//

import UIKit

class TravelCollectionViewCell: UICollectionViewCell {
    static let identifier = "TravelCollectionViewCell"

    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureProfileImageVeiwUI()
    }
    
    
    func configureUI() {
        configureNameLabelUI()
        configureDateLabelUI()
        configureMessasgeLabelUI()
    }
    
    
    func configureNameLabelUI() {
        nameLabel.font = .boldSystemFont(ofSize: 13)
    }
    
    func configureMessasgeLabelUI() {
        messageLabel.font = .systemFont(ofSize: 13)
        messageLabel.textColor = UIColor.grayForegroundColor
        
    }
    
    
    func configureProfileImageVeiwUI() {
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        profileImageView.clipsToBounds = true
    }
    
    func configureDateLabelUI() {
        dateLabel.textColor = UIColor.grayForegroundColor
        dateLabel.font = .systemFont(ofSize: 13)
    }
}
