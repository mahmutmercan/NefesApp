//
//  RecommentedCVC.swift
//  NefesApp
//
//  Created by Mahmut MERCAN on 7.09.2021.
//

import UIKit

class RecommentedCVC: UICollectionViewCell {

    static let identifier: String = "RecommentedCVC"

    @IBOutlet weak var recommentedImageView: UIImageView!
    @IBOutlet weak var recommentedTitleLabel: UILabel!
    @IBOutlet weak var recommentedSubtitleLabel: UILabel!
    @IBOutlet weak var recommentedSuggestedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()        
        // Initialization code
    }

    static func nib()-> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    func cellConfigure(imageName: String, title: String, subtitle: String, suggested: String) {
        recommentedImageView.image = UIImage(named: imageName)
        recommentedTitleLabel.text = title
        recommentedSubtitleLabel.text = subtitle
        recommentedSuggestedLabel.text = suggested
    }

}
