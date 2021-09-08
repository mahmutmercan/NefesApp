//
//  cardsCollectionsCVC.swift
//  NefesApp
//
//  Created by Mahmut MERCAN on 7.09.2021.
//

import UIKit

class cardsCollectionsCVC: UICollectionViewCell {

    static let identifier: String = "cardsCollectionsCVC"

    @IBOutlet weak var cardsImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
        // Initialization code

    }
    
    func setupCell() {
        cardsImageView.contentMode = .scaleAspectFill
        self.layer.cornerRadius = 16
    }
    
    func cellConfigure(cardsImageName: String) {
        cardsImageView.image = UIImage(named: cardsImageName)
    }
    
    static func nib()-> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }

}
