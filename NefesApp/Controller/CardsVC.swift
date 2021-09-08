//
//  CardsVC.swift
//  NefesApp
//
//  Created by Mahmut MERCAN on 6.09.2021.
//

import UIKit

class CardsVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var headerContainer: UIView!
    @IBOutlet weak var cardsTitleLabel: UILabel!
    @IBOutlet weak var cardsDescriptionLabel: UILabel!
    @IBOutlet weak var cardsCollectionView: UICollectionView!
    
    var itemSize = CGSize()
    var collectionViewLayout =  UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInterface()
        setupCollectionView()
        
        
        // Do any additional setup after loading the view.
        self.cardsCollectionView.layoutSubviews()
        self.cardsCollectionView.layoutIfNeeded()
        self.cardsCollectionView.reloadData()
        
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    private func setupCollectionView() {
        cardsCollectionView.backgroundColor = .clear
        cardsCollectionView.delegate = self
        cardsCollectionView.dataSource = self
        cardsCollectionView.setCollectionViewLayout(collectionViewLayout, animated: true)
        cardsCollectionView.showsHorizontalScrollIndicator = false
        cardsCollectionView.register(cardsCollectionsCVC.nib(), forCellWithReuseIdentifier: cardsCollectionsCVC.identifier)
        
        setupCollectionLayout()
    }
    
    private func setupCollectionLayout() {
            let screenSize = UIScreen.main.bounds.width
            let minimumLineSpacingValue: CGFloat = 16
//            let rowItemCount: CGFloat = 2
//            let itemW = (screenSize - (32 + (minimumLineSpacingValue * 2))) / rowItemCount //(screenSize - (minimumLineSpacingValue * (rowItemCount - 1))) / rowItemCount
        let itemW = screenSize - 32
            
        let itemH :CGFloat = 160.0
            itemSize = CGSize(width: itemW, height: itemH)
            print(itemSize)
            
            collectionViewLayout.scrollDirection = .vertical
            collectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            collectionViewLayout.minimumLineSpacing = minimumLineSpacingValue
            
        }
    
    func setInterface() {
        
        self.view.backgroundColor = UIColor(red: 120/255, green: 197/255, blue: 245/255, alpha: 1.0)
        self.cardsTitleLabel.backgroundColor = UIColor(red: 120/255, green: 197/255, blue: 245/255, alpha: 1.0)
        self.cardsDescriptionLabel.backgroundColor = UIColor(red: 120/255, green: 197/255, blue: 245/255, alpha: 1.0)
        self.headerContainer.backgroundColor = UIColor(red: 120/255, green: 197/255, blue: 245/255, alpha: 1.0)

        
        self.cardsTitleLabel.textColor = .white
        
        self.cardsTitleLabel.text = "Kart Koleksiyonları"
        self.cardsDescriptionLabel.text = "Kişisel gelişim yolculuğuna kartlar ile devam et. Hemen bir deste seç ve kart çekmeye başla."
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cardsCollectionsCVC.identifier, for: indexPath) as! cardsCollectionsCVC
        cell.cellConfigure(cardsImageName: "nattu-adnan")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize
    }
    
}
