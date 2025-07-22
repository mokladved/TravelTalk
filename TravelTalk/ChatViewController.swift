//
//  ChatViewController.swift
//  TravelTalk
//
//  Created by Youngjun Kim on 7/20/25.
//

import UIKit

final class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    static let identifier = "ChatViewController"

    @IBOutlet private var enterBUTTON: UIButton!
    @IBOutlet private var chatTableView: UITableView!
    
    @IBOutlet private var viewWrappedMessageTextField: UIView!
    @IBOutlet private var messageTextField: UITextField!
    var chatRoom: ChatRoom?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chatTableView.delegate = self
        chatTableView.dataSource = self
        registerCell()
        chatTableView.rowHeight = UITableView.automaticDimension
        configureTableViewUI()
        configureNavbarUI()
        configureViewWrappedMessageTextFieldUI()
        configureMessageTextFieldUI()
        configureEnterButtonUI()
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let chatRoom = chatRoom else {
            return 0
        }
        return chatRoom.chatList.count
    }
    private func registerCell() {
        let myXib = UINib(nibName: MyChatTableViewCell.identifier, bundle: nil)
        let yourXib = UINib(nibName: YourChatTableViewCell.identifier, bundle: nil)

        chatTableView.register(myXib, forCellReuseIdentifier: MyChatTableViewCell.identifier)
        chatTableView.register(yourXib, forCellReuseIdentifier: YourChatTableViewCell.identifier)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        guard let chat = chatRoom?.chatList[indexPath.row] else {
            return UITableViewCell()
        }
        
        if chat.user == ChatList.me {
            let cell = tableView.dequeueReusableCell(withIdentifier: MyChatTableViewCell.identifier, for: indexPath) as! MyChatTableViewCell
            cell.configure(from: chat)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: YourChatTableViewCell.identifier, for: indexPath) as! YourChatTableViewCell
            cell.configure(from: chat)
            return cell
        }
    }
    
    private func configureTableViewUI() {
        chatTableView.separatorStyle = .none
        chatTableView.allowsSelection = false
    }
    
    private func configureNavbarUI() {
        navigationItem.title = chatRoom?.chatroomName
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        appearance.shadowColor = .grayForegroundColor
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func configureViewWrappedMessageTextFieldUI() {
        viewWrappedMessageTextField.backgroundColor = .lightGrayBackgroundColor
        viewWrappedMessageTextField.layer.cornerRadius = 5
        viewWrappedMessageTextField.clipsToBounds = true
        
    }
    
    private func configureMessageTextFieldUI() {
        let placeholder = "메시지를 입력하세요"
        let attribute: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.grayForegroundColor ]
        
        messageTextField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attribute)
        messageTextField.backgroundColor = .clear
        messageTextField.borderStyle = .none
    }
    
    private func configureEnterButtonUI() {
        enterBUTTON.configuration = .travelStyle(image: UIImage(systemName: "paperplane"))
    }
    
    @IBAction func keyboardDismiss(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func textFieldDidEndOnExit(_ sender: UITextField) {
    }
    
    
}
