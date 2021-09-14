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
        setupCollectionView()
        setupPageControl()
        // Initialization code
    }
    static func nib()-> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    func setupPageControl() {
        carouselPageControl.currentPage = 0
        carouselPageControl.numberOfPages = 7
    }


}

extension CarouselCVC {
    private func setupCollectionView() {
        carouselCollectionView.backgroundColor = .clear
        carouselCollectionView.delegate = self
        carouselCollectionView.dataSource = self
        carouselCollectionView.setCollectionViewLayout(collectionViewLayout, animated: true)
        carouselCollectionView.showsHorizontalScrollIndicator = false
        carouselCollectionView.register(CarouselDetailCVC.nib(), forCellWithReuseIdentifier: CarouselDetailCVC.identifier)


        setupCollectionLayout()
    }
    
    private func setupCollectionLayout() {
        let screenSize = UIScreen.main.bounds.width
        let minimumLineSpacingValue: CGFloat = 8
        let rowItemCount: CGFloat = 1
        let itemW = (screenSize) / rowItemCount
            
        let itemH :CGFloat = 280.0
        itemSize = CGSize(width: itemW, height: itemH)
            
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionViewLayout.minimumLineSpacing = minimumLineSpacingValue
            
    }
}

extension CarouselCVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselDetailCVC.identifier, for: indexPath) as! CarouselDetailCVC
        cell.cellConfigure(imageName: "nattu-adnan", title: "deneme", subtitle: "deneme2")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        carouselPageControl.currentPage = indexPath.row
    }

}



