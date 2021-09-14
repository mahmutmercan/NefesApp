//
//  CarouselCVC.swift
//  NefesApp
//
//  Created by Mahmut MERCAN on 9.09.2021.
//

import UIKit

class CarouselCVC: UICollectionViewCell {
    static let identifier: String = "CarouselCVC"

    @IBOutlet weak var carouselCollectionView: UICollectionView!
    @IBOutlet weak var carouselPageControl: UIPageControl!
        
    
    var itemSize = CGSize()
    var collectionViewLayout =  UICollectionViewFlowLayout()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    static func nib()-> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }


}

extension CarouselCVC {
    private func setupCollectionView() {
//        carouselCollectionView.backgroundColor = .clear
        carouselCollectionView.delegate = self
        carouselCollectionView.dataSource = self
        carouselCollectionView.setCollectionViewLayout(collectionViewLayout, animated: true)
        carouselCollectionView.showsHorizontalScrollIndicator = false
        
        carouselCollectionView.register(RecommentedCVC.nib(), forCellWithReuseIdentifier: RecommentedCVC.identifier)

        setupCollectionLayout()
    }
    
    private func setupCollectionLayout() {
        let screenSize = UIScreen.main.bounds.width
        let minimumLineSpacingValue: CGFloat = 16
        let rowItemCount: CGFloat = 1
        let itemW = ((screenSize - (minimumLineSpacingValue * 2)) / rowItemCount)
        print(itemW)
            
        let itemH :CGFloat = 229.0
        itemSize = CGSize(width: screenSize, height: itemH)
        print(itemSize)
            
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionViewLayout.minimumLineSpacing = minimumLineSpacingValue
            
    }
}

extension CarouselCVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommentedCVC.identifier, for: indexPath) as! RecommentedCVC
        cell.cellConfigure(imageName: "nattu-adnan", title: "21 GÜNDE DÜŞÜNCE DETOKSU", subtitle: "SINGLE", suggested: "ÖNERİLEN")
        cell.backgroundColor = .orange
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize
    }

}


