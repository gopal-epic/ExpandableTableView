//
//  FlipBookRecommendationCollectionViewFlowLayout.swift
//  ExpandableTableView
//
//  Created by Gopal Rao Gurram on 4/21/22.
//

import UIKit

class FlipBookRecommendationCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    private let minColumnWidth: CGFloat = 200.0
    static let cellHeight: CGFloat = 240.0
    
    private var insertingIndexPaths = [IndexPath]()

    // MARK: Layout Overrides

    /// - Tag: ColumnFlowExample
    override func prepare() {
        super.prepare()

        guard let collectionView = collectionView else { return }
        
        let availableWidth = collectionView.bounds.inset(by: collectionView.layoutMargins).width
        let maxNumColumns = Int(availableWidth / minColumnWidth)
        let cellWidth = (availableWidth / CGFloat(maxNumColumns)).rounded(.down)
        
        self.itemSize = CGSize(width: cellWidth, height: FlipBookRecommendationCollectionViewFlowLayout.cellHeight)
        self.sectionInset = UIEdgeInsets(top: self.minimumInteritemSpacing, left: 20.0, bottom: 0.0, right: 20.0)
        self.sectionInsetReference = .fromSafeArea
    }
    
    // MARK: Attributes for Updated Items
    
    override func initialLayoutAttributesForAppearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let attributes = super.initialLayoutAttributesForAppearingItem(at: itemIndexPath) else { return nil }
        
        if insertingIndexPaths.contains(itemIndexPath) {
            attributes.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            attributes.alpha = 0.0
            attributes.zIndex = 0
        }
        
        return attributes
    }
    
    // MARK: Updates
    
    override func prepare(forCollectionViewUpdates updateItems: [UICollectionViewUpdateItem]) {
        super.prepare(forCollectionViewUpdates: updateItems)
        
        for update in updateItems {
            switch update.updateAction {
            case .insert:
                guard let indexPath = update.indexPathAfterUpdate else { return }
                insertingIndexPaths.append(indexPath)
            default:
                break
            }
        }
    }
    
    override func finalizeCollectionViewUpdates() {
        super.finalizeCollectionViewUpdates()
        
        insertingIndexPaths.removeAll()
    }
}
