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
        let screenSize = UIScreen.main.bounds.width / 3
        print(screenSize)
        let minimumLineSpacingValue: CGFloat = 8
        let rowItemCount: CGFloat = 3
        let itemW = ((screenSize - (32 + (minimumLineSpacingValue * 2))) / rowItemCount) - 60
//        let itemW = (screenSize - (minimumLineSpacingValue * (rowItemCount - 1))) / rowItemCount
        print(itemW)
            
        let itemH :CGFloat = 120.0
        itemSize = CGSize(width: screenSize, height: itemH)
        print(itemSize)
            
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
        cell.cellConfigure(imageName: "nattu-adnan", iconName: "nattu-adnan", title: "Nasılsın", subtitle: "Nefes")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize
    }

}



