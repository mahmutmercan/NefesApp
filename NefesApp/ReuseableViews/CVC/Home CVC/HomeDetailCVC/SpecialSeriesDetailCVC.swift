//
//  SpecialSeriesDetailCVC.swift
//  NefesApp
//
//  Created by Mahmut MERCAN on 13.09.2021.
//

import UIKit

class SpecialSeriesDetailCVC: UICollectionViewCell {

    static let identifier: String = "SpecialSeriesDetailCVC"
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var modeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var specialSeriesImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setInterface()
        // Initialization code
    }
    func setInterface() {
        specialSeriesImageView.contentMode = .scaleAspectFill
        specialSeriesImageView.layer.cornerRadius = 16
    }

    func cellConfigure(time: String, mode: String, title: String, imageName: String) {
        timeLabel.text = time
        modeLabel.text = mode
        titleLabel.text = title
        specialSeriesImageView.image = UIImage(named: imageName)
    }


    static func nib()-> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
}
