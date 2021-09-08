//
//  DiscoverCVC.swift
//  NefesApp
//
//  Created by Mahmut MERCAN on 7.09.2021.
//

import UIKit

class ProgramCVC: UICollectionViewCell {

    static let identifier: String = "ProgramCVC"

    @IBOutlet weak var programImageView: UIImageView!
    @IBOutlet weak var programTitleLabel: UILabel!
    @IBOutlet weak var programAuthorLabel: UILabel!
    @IBOutlet weak var featuredLabel: UILabel!
    @IBOutlet weak var examineLabel: UILabel!
    @IBOutlet weak var chevronImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
        // Initialization code
    }

    static func nib()-> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    func setupCell() {
        programImageView.contentMode = .scaleAspectFill
        self.layer.cornerRadius = 16
        programTitleLabel.textColor = .white
        examineLabel.textColor = .white
        featuredLabel.textColor = .white
        
        chevronImageView.tintColor = .gray
        chevronImageView.alpha = 0.8
        chevronImageView.backgroundColor = .white
        chevronImageView.layer.cornerRadius = 12.0

        self.backgroundColor = UIColor(red: 82/255, green: 135/255, blue: 169/255, alpha: 1.0)
        self.programAuthorLabel.backgroundColor = UIColor(red: 82/255, green: 135/255, blue: 169/255, alpha: 1.0)
        self.examineLabel.backgroundColor = UIColor(red: 82/255, green: 135/255, blue: 169/255, alpha: 1.0)
        self.featuredLabel.backgroundColor = UIColor(red: 82/255, green: 135/255, blue: 169/255, alpha: 1.0)
        self.programTitleLabel.backgroundColor = UIColor(red: 82/255, green: 135/255, blue: 169/255, alpha: 1.0)
    }

    
    func cellConfigure(programImageName: String, programTitle: String, programAuthor: String, featured: String, examine: String, chevronImageName: String) {
        programImageView.image = UIImage(named: programImageName)
        programTitleLabel.text = programTitle
        programAuthorLabel.text = programAuthor
        featuredLabel.text = featured
        examineLabel.text = examine
        chevronImageView.image = UIImage(systemName: chevronImageName)
    }


}
