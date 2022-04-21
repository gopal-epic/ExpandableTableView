//
//  CarouselRowTableViewCell.swift
//  OutSchool
//
//  Created by Gopal Rao Gurram on 2/28/22.
//

import UIKit

class CarouselRowTableViewCell: UITableViewCell {
    
    static let nibName = "CarouselRowTableViewCell"
    
    @IBOutlet weak var collectionView: UICollectionView?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView?.register(UINib(nibName: CarouselRowCollectionViewCell.nibName, bundle: nil), forCellWithReuseIdentifier: CarouselRowCollectionViewCell.nibName)
    }
    
    override func prepareForReuse() {
        reset()
        
        super.prepareForReuse()
    }
    
    func reset() {
        collectionView?.delegate = nil
        collectionView?.dataSource = nil
    }
}
