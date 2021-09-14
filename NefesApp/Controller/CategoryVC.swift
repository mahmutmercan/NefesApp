//
//  CategoryVC.swift
//  NefesApp
//
//  Created by Mahmut MERCAN on 6.09.2021.
//

import UIKit

class CategoryVC: UIViewController {

    @IBOutlet weak var discoverHeaderContainer: UIView!
    @IBOutlet weak var discoverTitleLabel: UILabel!
    @IBOutlet weak var discoverSearchBar: UISearchBar!
    @IBOutlet weak var discoverCollectionView: UICollectionView!

    var itemSize = CGSize()
    var collectionViewLayout =  UICollectionViewFlowLayout()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setInterface()
        // Do any additional setup after loading the view.
    }
    
    func setInterface() {
        discoverHeaderContainer.backgroundColor = UIColor(red: 70/255, green: 117/255, blue: 146/255, alpha: 1.0)
        self.view.backgroundColor = UIColor(red: 82/255, green: 135/255, blue: 169/255, alpha: 1.0)
        discoverCollectionView.backgroundColor = UIColor(red: 82/255, green: 135/255, blue: 169/255, alpha: 1.0)
        self.discoverSearchBar.backgroundColor = .clear
        discoverHeaderContainer.layer.cornerRadius = 20
    }
    
}

extension CategoryVC {
    private func setupCollectionView() {
        discoverCollectionView.backgroundColor = .clear
        discoverCollectionView.delegate = self
        discoverCollectionView.dataSource = self
        discoverCollectionView.setCollectionViewLayout(collectionViewLayout, animated: true)
        discoverCollectionView.showsHorizontalScrollIndicator = false
        discoverCollectionView.register(DiscoverCVC.nib(), forCellWithReuseIdentifier: DiscoverCVC.identifier)

        setupCollectionLayout()
    }
    
    private func setupCollectionLayout() {
        let screenSize = UIScreen.main.bounds.width
        let minimumLineSpacingValue: CGFloat = 16
        let rowItemCount: CGFloat = 2
        let itemW = (screenSize - (32 + (minimumLineSpacingValue * 2))) / rowItemCount
//        let itemW = (screenSize - (minimumLineSpacingValue * (rowItemCount - 1))) / rowItemCount
//        let itemW :CGFloat = 162.0
        print(itemW)
            
        let itemH :CGFloat = 229.0
        itemSize = CGSize(width: itemW, height: itemH)
        print(itemSize)
            
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionViewLayout.minimumLineSpacing = minimumLineSpacingValue
            
    }
}

    
extension CategoryVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscoverCVC.identifier, for: indexPath) as! DiscoverCVC
        cell.cellConfigure(discoverImageName: "nattu-adnan", discoverTitle: "Fiziksel Sağlık")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize
    }


}
