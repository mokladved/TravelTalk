    //
    //  TravelViewController.swift
    //  TravelTalk
    //
    //  Created by Youngjun Kim on 7/18/25.
    //

    import UIKit

    final class TravelViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

        private let chatLists = ChatList.list
        
        
        @IBOutlet var travelCollectionView: UICollectionView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            registerCell()
            travelCollectionView.delegate = self
            travelCollectionView.dataSource = self
            travelCollectionView.collectionViewLayout = configureCollectionViewUI()
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return chatLists.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = travelCollectionView.dequeueReusableCell(withReuseIdentifier: TravelCollectionViewCell.identifier, for: indexPath) as! TravelCollectionViewCell
            
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

        
    }
