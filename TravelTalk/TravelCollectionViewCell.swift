//
//  TravelCollectionViewCell.swift
//  TravelTalk
//
//  Created by Youngjun Kim on 7/18/25.
//

import UIKit

final class TravelCollectionViewCell: UICollectionViewCell {
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
    
    
    private func configureUI() {
        configureNameLabelUI()
        configureDateLabelUI()
        configureMessasgeLabelUI()
    }
    
    
    private func configureNameLabelUI() {
        nameLabel.font = .boldSystemFont(ofSize: 13)
    }
    
    private func configureMessasgeLabelUI() {
        messageLabel.font = .systemFont(ofSize: 13)
        messageLabel.textColor = UIColor.grayForegroundColor
        
    }
    
    
    private func configureProfileImageVeiwUI() {
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        profileImageView.clipsToBounds = true
    }
    
    private func configureDateLabelUI() {
        dateLabel.textColor = UIColor.grayForegroundColor
        dateLabel.font = .systemFont(ofSize: 13)
    }
    
    
}
