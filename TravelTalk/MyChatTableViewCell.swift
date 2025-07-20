//
//  MyChatTableViewCell.swift
//  TravelTalk
//
//  Created by Youngjun Kim on 7/20/25.
//

import UIKit

class MyChatTableViewCell: UITableViewCell {

    static let identifier = "MyChatTableViewCell"
    
    @IBOutlet var viewWrappedMessageLabel: UIView!
    
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureViewWrappedMesageLabelUI()
        
    }
    
    func configure(from data: Chat) {
        dateLabel.text = data.formattedTime
        messageLabel.text = data.message
        
    }
    
    private func configureViewWrappedMesageLabelUI() {
        viewWrappedMessageLabel.layer.cornerRadius = 5
        viewWrappedMessageLabel.clipsToBounds = true
        viewWrappedMessageLabel.layer.borderWidth = 1
        viewWrappedMessageLabel.layer.borderColor = UIColor.darkGrayLineColor.cgColor
    }
}
