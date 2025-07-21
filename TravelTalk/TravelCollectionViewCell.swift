//
//  TravelCollectionViewCell.swift
//  TravelTalk
//
//  Created by Youngjun Kim on 7/18/25.
//

import UIKit

final class TravelCollectionViewCell: UICollectionViewCell {
    static let identifier = "TravelCollectionViewCell"

    @IBOutlet private var profileImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var dateLabel: UILabel!
    @IBOutlet private var messageLabel: UILabel!
    
    
    
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
        profileImageView.contentMode = .scaleAspectFill
    }
    
    private func configureDateLabelUI() {
        dateLabel.textColor = UIColor.grayForegroundColor
        dateLabel.font = .systemFont(ofSize: 13)
    }
    
    func configureData(imageName: String, name: String, message: String, date: String ) {
        profileImageView.image = UIImage(named: imageName)
        nameLabel.text = name
        messageLabel.text = message
        dateLabel.text = date
    }
    
    
}
