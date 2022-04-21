//
//  CarouselRowCollectionViewCell.swift
//  OutSchool
//
//  Created by Gopal Rao Gurram on 2/28/22.
//

import UIKit

class CarouselRowCollectionViewCell: UICollectionViewCell {
    
    static let nibName = "CarouselRowCollectionViewCell"
    static let cellSize = CGSize(width: 140, height: 180)
    
    @IBOutlet weak var activityImageView: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
