//
//  MoodCVC.swift
//  NefesApp
//
//  Created by Mahmut MERCAN on 9.09.2021.
//

import UIKit

class MoodCVC: UICollectionViewCell {
    static let identifier: String = "MoodCVC"
    
    @IBOutlet weak var moodCollectionView: UICollectionView!
    
    var itemSize = CGSize()
    var collectionViewLayout =  UICollectionViewFlowLayout()

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        // Initialization code
    }

    static func nib()-> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }

}

extension MoodCVC {
    private func setupCollectionView() {
        moodCollectionView.backgroundColor = .clear
        moodCollectionView.delegate = self
        moodCollectionView.dataSource = self
        moodCollectionView.setCollectionViewLayout(collectionViewLayout, animated: true)
        moodCollectionView.showsHorizontalScrollIndicator = false
        moodCollectionView.register(MoodDetailCVC.nib(), forCellWithReuseIdentifier: MoodDetailCVC.identifier)


        setupCollectionLayout()
    }
    
    private func setupCollectionLayout() {
        let screenSize = UIScreen.main.bounds.width
        let minimumLineSpacingValue: CGFloat = 8
        let rowItemCount: CGFloat = 3
        let itemW = (screenSize - ((minimumLineSpacingValue * 2 + 32))) / rowItemCount
            
        let itemH :CGFloat = 100.0
        itemSize = CGSize(width: itemW, height: itemH)
            
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionViewLayout.minimumLineSpacing = minimumLineSpacingValue
            
    }
}

extension MoodCVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoodDetailCVC.identifier, for: indexPath) as! MoodDetailCVC
        cell.backgroundColor = .green
        cell.cellConfigure(imageName: "nattu-adnan",
                           iconName: "nattu-adnan",
                           title: "Nasılsın?",
                           subtitle: "Duygu Defteri")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize
    }

}



