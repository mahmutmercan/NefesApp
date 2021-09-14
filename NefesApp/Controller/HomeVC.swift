//
//  HomeVC.swift
//  NefesApp
//
//  Created by Mahmut MERCAN on 6.09.2021.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    var itemSize = CGSize()
    var collectionViewLayout =  UICollectionViewFlowLayout()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "nattu-adnan")
//        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100)
//        self.view.insertSubview(imageView, at: 0)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension HomeVC {
    private func setupCollectionView() {
        homeCollectionView.backgroundColor = .clear
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        homeCollectionView.setCollectionViewLayout(collectionViewLayout, animated: true)
        homeCollectionView.showsHorizontalScrollIndicator = false
        
        homeCollectionView.register(HomeHeaderCVC.nib(), forCellWithReuseIdentifier: HomeHeaderCVC.identifier)
        homeCollectionView.register(CarouselCVC.nib(), forCellWithReuseIdentifier: CarouselCVC.identifier)
        homeCollectionView.register(MoodCVC.nib(), forCellWithReuseIdentifier: MoodCVC.identifier)
        homeCollectionView.register(BeginningCVC.nib(), forCellWithReuseIdentifier: BeginningCVC.identifier)
        homeCollectionView.register(SpecialSeriesCVC.nib(), forCellWithReuseIdentifier: SpecialSeriesCVC.identifier)
        homeCollectionView.register(UniqueConcertsCVC.nib(), forCellWithReuseIdentifier: UniqueConcertsCVC.identifier)

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

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 2 - Carousel
        // 3 - Nasılsın - Hızlı Başla - Nefes
        // 4 - Ücretsiz Kurslar
        // 5 - Özel Seriler
        // 6 - Evrendeki Denge vs.
        return 6
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeHeaderCVC.identifier, for: indexPath) as! HomeHeaderCVC
            cell.cellConfigure(title: "İyi günler, Mahmut!",
                               headerTitle: "Günlük Mucize",
                               headerDescription: "Beden ve ruh sağlığına önem veriyorum, sağlıklı olmayı hak ediyorum.")
            return cell
        }
        else if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCVC.identifier, for: indexPath) as! CarouselCVC
            return cell
        }
        else if indexPath.row == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoodCVC.identifier, for: indexPath) as! MoodCVC
            return cell

        }
        else if indexPath.row == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BeginningCVC.identifier, for: indexPath) as! BeginningCVC
            return cell

        }
        else if indexPath.row == 4 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SpecialSeriesCVC.identifier, for: indexPath) as! SpecialSeriesCVC
            return cell
        }
        else if indexPath.row == 5 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UniqueConcertsCVC.identifier, for: indexPath) as! UniqueConcertsCVC
            return cell

        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UniqueConcertsCVC.identifier, for: indexPath) as! UniqueConcertsCVC
            return cell

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: UIScreen.main.bounds.width, height: 300)

        }
        else if indexPath.row == 1 {
            return CGSize(width: UIScreen.main.bounds.width, height: 250)

        }
        else if indexPath.row == 2 {
            return CGSize(width: UIScreen.main.bounds.width, height: 120)

        }
        else if indexPath.row == 3 {
            return CGSize(width: UIScreen.main.bounds.width, height: 280)
        }
        else if indexPath.row == 4 {
            return CGSize(width: UIScreen.main.bounds.width, height: 280)

        }
        else if indexPath.row == 5 {
            return CGSize(width: UIScreen.main.bounds.width, height: 600)

        }
        else {
            return itemSize

        }

    }
        
}

