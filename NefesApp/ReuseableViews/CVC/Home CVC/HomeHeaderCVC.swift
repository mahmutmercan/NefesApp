//
//  HomeHeaderCVC.swift
//  NefesApp
//
//  Created by Mahmut MERCAN on 9.09.2021.
//

import UIKit

class HomeHeaderCVC: UICollectionViewCell {

    static let identifier: String = "HomeHeaderCVC"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var favoritesButton: UIButton!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerTitleLabel: UILabel!
    @IBOutlet weak var headerDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
        // Initialization code
    }

    static func nib()-> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    func setupCell() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = headerView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        headerView.insertSubview(blurEffectView, at: 0)
        
        favoritesButton.alpha = 0.9
        favoritesButton.tintColor = .gray
        favoritesButton.backgroundColor = .white
        favoritesButton.layer.cornerRadius = 12.0
        
        headerTitleLabel.layer.cornerRadius = headerTitleLabel.frame.height / 2
        headerTitleLabel.layer.masksToBounds = true
        headerTitleLabel.backgroundColor = .orange
        
        headerView.backgroundColor = .clear
        headerView.layer.cornerRadius = 12.0
        headerView.layer.masksToBounds = true
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "nattu-adnan")
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 400)
        self.insertSubview(imageView, at: 0)

    }
    
    func cellConfigure(title: String, headerTitle: String, headerDescription: String) {
        titleLabel.text = title
        favoritesButton.alpha = 0.7
        headerTitleLabel.text = headerTitle
        headerDescriptionLabel.text = headerDescription
    }
}
