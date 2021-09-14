//
//  CarouselDetailCVC.swift
//  NefesApp
//
//  Created by Mahmut MERCAN on 14.09.2021.
//

import UIKit

class CarouselDetailCVC: UICollectionViewCell {

    static let identifier: String = "CarouselDetailCVC"
    
    @IBOutlet weak var carouselDetailImageView: UIImageView!
    @IBOutlet weak var carouselDetailTitleLabel: UILabel!
    @IBOutlet weak var carouselDetailSubtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setInterface()
        // Initialization code
    }
    
    func setInterface() {
        carouselDetailImageView.contentMode = .scaleAspectFill
        carouselDetailImageView.layer.cornerRadius = 32
        self.carouselDetailImageView.layer.masksToBounds = true

        
        carouselDetailTitleLabel.textColor = .white
        carouselDetailSubtitleLabel.textColor = .white
        
        carouselDetailTitleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        carouselDetailSubtitleLabel.font = UIFont.systemFont(ofSize: 16)
        
    }

    func cellConfigure(imageName: String, title: String, subtitle: String) {
        carouselDetailImageView.image = UIImage(named: imageName)
        carouselDetailTitleLabel.text = title
        carouselDetailSubtitleLabel.text = subtitle
    }
    static func nib()-> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
}
