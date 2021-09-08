//
//  DiscoverCVC.swift
//  NefesApp
//
//  Created by Mahmut MERCAN on 8.09.2021.
//

import UIKit

class DiscoverCVC: UICollectionViewCell {

    static let identifier: String = "DiscoverCVC"

    @IBOutlet weak var discoverImageView: UIImageView!
    @IBOutlet weak var discoverTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setInterface()
        // Initialization code
    }
    
    func setInterface() {
        discoverImageView.contentMode = .scaleToFill
        discoverTitleLabel.textColor = .white
        
        discoverTitleLabel.alpha = 0.4
        discoverTitleLabel.backgroundColor = .gray
        self.layer.cornerRadius = 24.0
        
        self.backgroundColor = UIColor(red: 82/255, green: 135/255, blue: 169/255, alpha: 1.0)


    }

    
    func cellConfigure(discoverImageName: String, discoverTitle: String) {
        discoverImageView.image = UIImage(named: discoverImageName)
        discoverTitleLabel.text = discoverTitle
    }

    static func nib()-> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }

}
