//
//  ProgramsVC.swift
//  NefesApp
//
//  Created by Mahmut MERCAN on 6.09.2021.
//

import UIKit

class ProgramsVC: UIViewController {

    @IBOutlet weak var programsHeaderContainer: UIView!
    @IBOutlet weak var programsTitleLabel: UILabel!
    @IBOutlet weak var programsDescriptionLabel: UILabel!
    @IBOutlet weak var programsSegmentedControl: UISegmentedControl!
    @IBOutlet weak var programsCollectionView: UICollectionView!
    
    var itemSize = CGSize()
    var collectionViewLayout =  UICollectionViewFlowLayout()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInterface()
        setupCollectionView()
        // Do any additional setup after loading the view.
    }
    

    
    func setInterface() {
        self.view.backgroundColor = UIColor(red: 120/255, green: 197/255, blue: 245/255, alpha: 1.0)
        self.programsTitleLabel.backgroundColor = UIColor(red: 120/255, green: 197/255, blue: 245/255, alpha: 1.0)
        self.programsDescriptionLabel.backgroundColor = UIColor(red: 120/255, green: 197/255, blue: 245/255, alpha: 1.0)
        self.programsSegmentedControl.backgroundColor = UIColor(red: 120/255, green: 197/255, blue: 245/255, alpha: 1.0)
        self.programsHeaderContainer.backgroundColor = UIColor(red: 120/255, green: 197/255, blue: 245/255, alpha: 1.0)
        
        self.programsTitleLabel.textColor = .white
        self.programsTitleLabel.text = "Programlar"
        self.programsDescriptionLabel.text = "Alanında uzman eğitmenlerimizin hazırladığı kapsamlı programlar ile gelişimini güçlendir. Günlük ilerlemeler, yönlendirmeli meditasyonlar ve görevler ile hedeflerine ilerle."
        
        
    }

}

extension ProgramsVC {
    private func setupCollectionView() {
        programsCollectionView.backgroundColor = .clear
        programsCollectionView.delegate = self
        programsCollectionView.dataSource = self
        programsCollectionView.setCollectionViewLayout(collectionViewLayout, animated: true)
        programsCollectionView.showsHorizontalScrollIndicator = false
        programsCollectionView.register(ProgramCVC.nib(), forCellWithReuseIdentifier: ProgramCVC.identifier)

        setupCollectionLayout()
    }
    
    private func setupCollectionLayout() {
        let screenSize = UIScreen.main.bounds.width
        let minimumLineSpacingValue: CGFloat = 16
        let itemW = screenSize - 32
            
        let itemH :CGFloat = 350.0
        itemSize = CGSize(width: itemW, height: itemH)
        print(itemSize)
            
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionViewLayout.minimumLineSpacing = minimumLineSpacingValue
            
    }

}

extension ProgramsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProgramCVC.identifier, for: indexPath) as! ProgramCVC
        cell.cellConfigure(programImageName: "nattu-adnan",
                           programTitle: "Tasavvuf ve Farkındalık",
                           programAuthor: "Ferhat Atik",
                           featured: "ÖNE ÇIKAN",
                           examine: "İncele", chevronImageName: "chevron.right")
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return itemSize
    }

}
