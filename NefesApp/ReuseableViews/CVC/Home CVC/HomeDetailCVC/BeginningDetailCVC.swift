//
//  BeginningDetailCVC.swift
//  NefesApp
//
//  Created by Mahmut MERCAN on 13.09.2021.
//

import UIKit

class BeginningDetailCVC: UICollectionViewCell {

    static let identifier: String = "BeginningDetailCVC"
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var modeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var beginningImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func cellConfigure(time: String, mode: String, title: String, imageName: String) {
        timeLabel.text = time
        modeLabel.text = mode
        titleLabel.text = title
        beginningImageView.image = UIImage(named: imageName)
    }

    static func nib()-> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
}
