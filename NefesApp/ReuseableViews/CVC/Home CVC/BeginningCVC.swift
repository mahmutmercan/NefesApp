//
//  BeginningCVC.swift
//  NefesApp
//
//  Created by Mahmut MERCAN on 9.09.2021.
//

import UIKit

class BeginningCVC: UICollectionViewCell {
    static let identifier: String = "BeginningCVC"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var beginningCollectionView: UICollectionView!
    
    var itemSize = CGSize()
    var collectionViewLayout =  UICollectionViewFlowLayout()

    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupInterface()
        setupCollectionView()
        // Initialization code
    }
    
    func setupInterface() {
        titleLabel.text = "Nefes21'e Başlarken"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 21)
        
        subtitleLabel.text = "Abone olmadan dinleyebilirsin"
        subtitleLabel.textColor = .lightGray
        subtitleLabel.font = subtitleLabel.font.withSize(16)

    }

    static func nib()-> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }

}

extension BeginningCVC {
    private func setupCollectionView() {
        beginningCollectionView.backgroundColor = .clear
        beginningCollectionView.delegate = self
        beginningCollectionView.dataSource = self
        beginningCollectionView.setCollectionViewLayout(collectionViewLayout, animated: true)
        beginningCollectionView.showsHorizontalScrollIndicator = false
        beginningCollectionView.register(BeginningDetailCVC.nib(), forCellWithReuseIdentifier: BeginningDetailCVC.identifier)

        setupCollectionLayout()
    }
    
    private func setupCollectionLayout() {
        let screenSize = UIScreen.main.bounds.width
        print(screenSize)
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

extension BeginningCVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BeginningDetailCVC.identifier, for: indexPath) as! BeginningDetailCVC
        cell.cellConfigure(time: "32dk", mode: "KURS", title: "Mutluluk Seçilebilir Mi? Deneme Tahtası", imageName: "nattu-adnan")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize
    }

}


