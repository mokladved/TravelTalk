    //
    //  TravelViewController.swift
    //  TravelTalk
    //
    //  Created by Youngjun Kim on 7/18/25.
    //

    import UIKit

    final class TravelViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

        @IBOutlet var travelCollectionView: UICollectionView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            registerCell()
            travelCollectionView.delegate = self
            travelCollectionView.dataSource = self
            

        }
        
        private func registerCell() {
            let xib = UINib(nibName: TravelCollectionViewCell.identifier, bundle: nil)
            travelCollectionView.register(xib, forCellWithReuseIdentifier: TravelCollectionViewCell.identifier)
            
        }

        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 10
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = travelCollectionView.dequeueReusableCell(withReuseIdentifier: TravelCollectionViewCell.identifier, for: indexPath) as! TravelCollectionViewCell
            
            return cell
        }
        
    }
