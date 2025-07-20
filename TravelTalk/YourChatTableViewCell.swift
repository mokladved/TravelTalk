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
        configureViewWrappedMessageLabelUI()
        configureDateLabelUI()
        configureNameLabel()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
            profileImageView.clipsToBounds = true
        
    }
    
    private func configureLabelUI() {
        viewWrappedMessageLabel.layer.borderColor = UIColor.darkGrayLineColor.cgColor
        viewWrappedMessageLabel.layer.borderWidth = 1
    }
    
    private func configureMessageLabelUI() {
        messageLabel.numberOfLines = 0
        messageLabel.font = .systemFont(ofSize: 13)
    }
    
    private func configureViewWrappedMessageLabelUI() {
        viewWrappedMessageLabel.layer.borderColor = UIColor.darkGrayLineColor.cgColor
        viewWrappedMessageLabel.clipsToBounds = true
        viewWrappedMessageLabel.layer.cornerRadius = 5
    }
    
    private func configureDateLabelUI() {
        dateLabel.textColor = .darkGrayForegroundColor
        dateLabel.font = .systemFont(ofSize: 11)
    }
    
    func configure(from data: Chat) {
        nameLabel.text = data.user.name
        profileImageView.image = UIImage(named: data.user.image)
        messageLabel.text = data.message
        dateLabel.text = data.formattedTime
    }
    
    private func configureNameLabel() {
        nameLabel.font = .systemFont(ofSize: 13)
    }
    
    private func configureProfileImageView() {
        DispatchQueue.main.async {
            self.profileImageView.layer.cornerRadius = self.profileImageView.frame.width / 2
        }
        profileImageView.clipsToBounds = true
    }
    
    
}
