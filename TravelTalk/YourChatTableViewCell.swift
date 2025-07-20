//
//  YourChatCollectionViewCell.swift
//  TravelTalk
//
//  Created by Youngjun Kim on 7/20/25.
//

import UIKit

final class YourChatTableViewCell: UITableViewCell {
    
    static let identifier = "YourChatTableViewCell"
    
    @IBOutlet var profileImageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var messageLabel: UILabel!
    
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var viewWrappedMessageLabel: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLabelUI()
        configureMessageLabelUI()
    }
    
    private func configureLabelUI() {
        viewWrappedMessageLabel.layer.borderColor = UIColor.darkGrayLineColor.cgColor
        viewWrappedMessageLabel.layer.borderWidth = 1
    }
    
    private func configureMessageLabelUI() {
        messageLabel.numberOfLines = 0
    }
    
    private func configureDateLabelUI() {
        dateLabel.textColor = .darkGrayForegroundColor
    }
    
    func configure(from data: Chat) {
        nameLabel.text = data.user.name
        profileImageView.image = UIImage(named: data.user.image)
        messageLabel.text = data.message
        dateLabel.text = data.formattedDate
    }
    
}


