    //
    //  TravelViewController.swift
    //  TravelTalk
    //
    //  Created by Youngjun Kim on 7/18/25.
    //

    import UIKit

    final class TravelViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
        
        private let chatLists = ChatList.list
        
        @IBOutlet var viewWrappedTextField: UIView!
        
        
        @IBOutlet var searchButton: UIButton!
        @IBOutlet var lineView: UIView!
        
        @IBOutlet var searchTextField: UITextField!
        @IBOutlet var travelCollectionView: UICollectionView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            registerCell()
            travelCollectionView.delegate = self
            travelCollectionView.dataSource = self
            travelCollectionView.collectionViewLayout = configureCollectionViewUI()
            configureNavTitleUI()
            configureLineViewUI()
            configureSearchButtonUI()
            configureSearchTextFieldUI()
            configureImageWrappedTextFieldUI()
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return chatLists.count
        }
        
        
        // TODO: 마지막 채팅 선택 리팩토링
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = travelCollectionView.dequeueReusableCell(withReuseIdentifier: TravelCollectionViewCell.identifier, for: indexPath) as! TravelCollectionViewCell
            
            let chat = chatLists[indexPath.item]
            let chatroomImage = chat.chatroomImage
            let lastChatUser = chat.chatList[chat.chatList.count - 1].user.name
            let lastChatMessage = chat.chatList[chat.chatList.count - 1].message
            let lastChatDate = chat.chatList[chat.chatList.count - 1].formattedDate
            
            cell.configureData(imageName: chatroomImage, name: lastChatUser, message: lastChatMessage, date: lastChatDate)
            
            
            return cell
        }
        
        private func registerCell() {
            let xib = UINib(nibName: TravelCollectionViewCell.identifier, bundle: nil)
            travelCollectionView.register(xib, forCellWithReuseIdentifier: TravelCollectionViewCell.identifier)
        }
        
        private func configureCollectionViewUI() -> UICollectionViewFlowLayout {
            let layout = UICollectionViewFlowLayout()
            let cellWidth = VCConstants.cellWidth()
            let cellHeight = VCConstants.cellHeight
            let spacing = VCConstants.spacing
            layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
            layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
            layout.minimumLineSpacing = spacing
            layout.minimumInteritemSpacing = 0
            layout.scrollDirection = .vertical

            return layout
        }
        
        private func configureNavTitleUI() {
            navigationItem.title = "TRAVEL TALK"
        }
        
        private func configureLineViewUI() {
            lineView.backgroundColor = UIColor.lightGrayForegroundColor
        }
        
        private func configureSearchTextFieldUI() {
            let placeholder = "친구 이름을 검색해 보세요."
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.darkGrayForegroundColor,
            ]
            searchTextField.attributedPlaceholder = NSAttributedString(
                        string: placeholder, attributes: attributes
            )
            searchTextField.backgroundColor =  .clear
            searchTextField.borderStyle = . none
        }
        
        private func configureSearchButtonUI() {
            searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
            searchButton.tintColor = .darkGrayForegroundColor
        }
        
        private func configureImageWrappedTextFieldUI() {
            viewWrappedTextField.backgroundColor = UIColor.lightGrayBackgroundColor
            viewWrappedTextField.layer.cornerRadius = 10
            viewWrappedTextField.clipsToBounds = true
        }
    }
