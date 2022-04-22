//
//  CarouselRowTableViewCell.swift
//  OutSchool
//
//  Created by Gopal Rao Gurram on 2/28/22.
//

import UIKit

protocol SeeMoreBooks: AnyObject {
    func showMoreBooks(for indexPath: IndexPath, with collectionView: UICollectionView)
}

class CarouselRowTableViewCell: UITableViewCell {
    
    static let nibName = "CarouselRowTableViewCell"
    
    weak var delegate: SeeMoreBooks?
    var indexPath: IndexPath?
    
    @IBOutlet weak var collectionView: UICollectionView?
    
    @IBAction func seeMoreButtonAction(_ sender: UIButton) {
        guard let indexPath = indexPath,
              let collectionView = collectionView
        else { return }
        
        delegate?.showMoreBooks(for: indexPath, with: collectionView)
    }

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
