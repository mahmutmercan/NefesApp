//
//  UniqueConcertsCVC.swift
//  NefesApp
//
//  Created by Mahmut MERCAN on 9.09.2021.
//

import UIKit

class UniqueConcertsCVC: UICollectionViewCell {
    static let identifier: String = "UniqueConcertsCVC"

    @IBOutlet weak var uniqueConcertsCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static func nib()-> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }

}
