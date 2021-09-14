//
//  SpecialSeriesCVC.swift
//  NefesApp
//
//  Created by Mahmut MERCAN on 9.09.2021.
//

import UIKit

class SpecialSeriesCVC: UICollectionViewCell {
    static let identifier: String = "SpecialSeriesCVC"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var specialSeriesCollectionView: UICollectionView!
    
    var itemSize = CGSize()
    var collectionViewLayout =  UICollectionViewFlowLayout()

    override func awakeFromNib() {
        super.awakeFromNib()
        setupInterface()
        setupCollectionView()
        // Initialization code
    }
    func setupInterface() {
        titleLabel.text = "Özel Seriler"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 21)
        
        subtitleLabel.text = "Senin için özel hazırlandı"
        subtitleLabel.textColor = .lightGray
        subtitleLabel.font = subtitleLabel.font.withSize(16)

    }


    static func nib()-> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }

}

extension SpecialSeriesCVC {
    private func setupCollectionView() {
        specialSeriesCollectionView.backgroundColor = .clear
        specialSeriesCollectionView.delegate = self
        specialSeriesCollectionView.dataSource = self
        specialSeriesCollectionView.setCollectionViewLayout(collectionViewLayout, animated: true)
        specialSeriesCollectionView.showsHorizontalScrollIndicator = false
        specialSeriesCollectionView.register(SpecialSeriesDetailCVC.nib(), forCellWithReuseIdentifier: SpecialSeriesDetailCVC.identifier)

        setupCollectionLayout()
    }
    
    private func setupCollectionLayout() {
        let screenSize = UIScreen.main.bounds.width
        let minimumLineSpacingValue: CGFloat = 8
        let rowItemCount: CGFloat = 2
        let itemW = (screenSize - ((minimumLineSpacingValue * 2) + 32)) / rowItemCount
            
        let itemH :CGFloat = 180.0
        itemSize = CGSize(width: itemW, height: itemH)
            
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionViewLayout.minimumLineSpacing = minimumLineSpacingValue
            
    }
}

extension SpecialSeriesCVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SpecialSeriesDetailCVC.identifier, for: indexPath) as! SpecialSeriesDetailCVC
        cell.cellConfigure(time: "36dk", mode: "KURS", title: "Bilinçaltı Arındırma Atölyesi Deneme Tahtası", imageName: "nattu-adnan")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize
    }

}



