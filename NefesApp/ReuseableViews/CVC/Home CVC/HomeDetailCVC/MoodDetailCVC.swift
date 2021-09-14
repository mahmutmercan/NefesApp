//
//  MoodDetailCVC.swift
//  NefesApp
//
//  Created by Mahmut MERCAN on 10.09.2021.
//

import UIKit

class MoodDetailCVC: UICollectionViewCell {

    static let identifier: String = "MoodDetailCVC"

    @IBOutlet weak var moodDetailImageView: UIImageView!
    @IBOutlet weak var moodDetailIconImageView: UIImageView!
    @IBOutlet weak var moodDetailTitleLabel: UILabel!
    @IBOutlet weak var moodDetailSubtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setInterface()
        // Initialization code
    }
    
    func setInterface() {
        moodDetailImageView.contentMode = .scaleAspectFill
        self.layer.cornerRadius = 16
        moodDetailIconImageView.layer.cornerRadius = 8
        
        moodDetailTitleLabel.text = "Nasılsın?"
        moodDetailTitleLabel.textColor = .white
        
        moodDetailSubtitleLabel.text = "Duygu Defteri"
        moodDetailSubtitleLabel.textColor = .lightGray
        
    }

    static func nib()-> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    func cellConfigure(imageName: String, iconName: String, title: String, subtitle: String) {
        moodDetailImageView.image = UIImage(named: imageName)
        moodDetailIconImageView.image = UIImage(named: iconName)
        moodDetailTitleLabel.text = title
        moodDetailSubtitleLabel.text = subtitle
    }

}
