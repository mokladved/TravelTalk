//
//  ChatViewController.swift
//  TravelTalk
//
//  Created by Youngjun Kim on 7/20/25.
//

import UIKit

final class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {
    
    static let identifier = "ChatViewController"

    @IBOutlet private var enterBUTTON: UIButton!
    @IBOutlet private var chatTableView: UITableView!
    
    @IBOutlet var placeholderLabel: UILabel!
    @IBOutlet var messageTextView: UITextView!
    @IBOutlet private var viewWrappedMessageTextView: UIView!
    
    var chatRoom: ChatRoom?
    var travelViewController: TravelViewController?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        messageTextView.delegate = self
        chatTableView.delegate = self
        chatTableView.dataSource = self
        registerCell()
        chatTableView.rowHeight = UITableView.automaticDimension
        configureTableViewUI()
        configureNavbarUI()
        configureViewWrappedMessageTextFieldUI()
        configurePlaceholderLabelUI()
        configureEnterButtonUI()
        configureTextViewUI()
        
    }
    
    override func viewDidLayoutSubviews() {
        moveLastCell()
    }
    
    private func moveLastCell() {
        guard let chatRoom = chatRoom else { 
            return
        }
        let lastIndexPath = IndexPath(row: chatRoom.chatList.count - 1, section: 0)
        chatTableView.scrollToRow(at: lastIndexPath, at: .bottom, animated: true)
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
        viewWrappedMessageTextView.backgroundColor = .lightGrayBackgroundColor
        viewWrappedMessageTextView.layer.cornerRadius = 5
        viewWrappedMessageTextView.clipsToBounds = true
        
    }
    
    
    
    private func configurePlaceholderLabelUI() {
        let placeholder = "메시지를 입력하세요"
        placeholderLabel.backgroundColor = .clear
        placeholderLabel.text = placeholder
        placeholderLabel.textColor = .darkGrayForegroundColor
    }
    
    private func configureTextViewUI() {
        messageTextView.backgroundColor = .clear
        messageTextView.textContainer.lineFragmentPadding = 0

    }
    
    private func configureEnterButtonUI() {
        enterBUTTON.configuration = .travelStyle(image: UIImage(systemName: "paperplane"))
    }
    
    @IBAction func keyboardDismiss(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func textFieldDidEndOnExit(_ sender: UITextField) {
    }
    
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
    @IBAction private func EnterButtonTapped(_ sender: UIButton) {
        guard let text = messageTextView.text, !text.trimmingCharacters(in: .whitespaces).isEmpty else { return }
                
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let now = formatter.string(from: Date())
        let newChat = Chat(user: ChatList.me, date: now, message: text)

        chatRoom?.chatList.append(newChat) // 자신의 데이터(복사본)만 수정합니다.
                
        chatTableView.reloadData()
        moveLastCell()
        
        if let travelVC = travelViewController,
            let newRoom = self.chatRoom {
            travelVC.updateChatRoom(newData: newRoom)
        }
           
        messageTextView.text = ""
        textViewDidChange(messageTextView)
    }
    
}
