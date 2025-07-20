//
//  ChatViewController.swift
//  TravelTalk
//
//  Created by Youngjun Kim on 7/20/25.
//

import UIKit

final class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    static let identifier = "ChatViewController"

    @IBOutlet private var chatTableView: UITableView!
    
    var chatRoom: ChatRoom?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chatTableView.delegate = self
        chatTableView.dataSource = self
        registerCell()
        chatTableView.rowHeight = 100
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
}
