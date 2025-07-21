//
//  MyChatTableViewCell.swift
//  TravelTalk
//
//  Created by Youngjun Kim on 7/20/25.
//

import UIKit

class MyChatTableViewCell: UITableViewCell {

    static let identifier = "MyChatTableViewCell"
    
    @IBOutlet private var viewWrappedMessageLabel: UIView!
    
    @IBOutlet private var messageLabel: UILabel!
    @IBOutlet private var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureViewWrappedMesageLabelUI()
        configureMessageLabelUI()
        configureDateLabelUI()
        
    }
    
    func configure(from data: Chat) {
        dateLabel.text = data.formattedTime
        messageLabel.text = data.message
    }
    
    private func configureViewWrappedMesageLabelUI() {
        viewWrappedMessageLabel.layer.cornerRadius = 10
        viewWrappedMessageLabel.clipsToBounds = true
        viewWrappedMessageLabel.layer.borderWidth = 1
        viewWrappedMessageLabel.layer.borderColor = UIColor.darkGrayLineColor.cgColor
        viewWrappedMessageLabel.backgroundColor = .grayBackgroundColor
    }
    
    private func configureMessageLabelUI() {
        messageLabel.font = .systemFont(ofSize: 13)
        messageLabel.numberOfLines = 0
    }
    
    private func configureDateLabelUI() {
        dateLabel.font = .systemFont(ofSize: 11)
        dateLabel.textColor = .darkGrayForegroundColor
    }
}
