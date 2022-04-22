//
//  TableViewController.swift
//  ExpandableTableView
//
//  Created by Gopal Rao Gurram on 4/20/22.
//

import UIKit

class TableViewController: UITableViewController {
    
    let tableViewCellHeight = 402.0
    
    var sections = 1
    var numOfRowsInSection = 1
    var numOfBooksInEachRow = 4
    var numOfBooksToBeInserted = 2
    var expandedIndexPaths: [IndexPath] = [IndexPath]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView?.register(UINib(nibName: CarouselRowTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: CarouselRowTableViewCell.nibName)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return numOfRowsInSection
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CarouselRowTableViewCell.nibName, for: indexPath) as! CarouselRowTableViewCell
        
        cell.indexPath = indexPath
        cell.delegate = self
        
        cell.collectionView?.delegate = self
        cell.collectionView?.dataSource = self
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if expandedIndexPaths.contains(indexPath) {
            return 64.0 + CGFloat(2) * FlipBookRecommendationCollectionViewFlowLayout.cellHeight + 72.0
        } else {
            return tableViewCellHeight
        }
    }
    
}

extension TableViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        numOfBooksInEachRow
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselRowCollectionViewCell.nibName, for: indexPath) as! CarouselRowCollectionViewCell
        
        return cell
    }
}

extension TableViewController: SeeMoreBooks {
    func showMoreBooks(for indexPath: IndexPath, with collectionView: UICollectionView) {
        
        if !expandedIndexPaths.contains(indexPath) {
            expandedIndexPaths.insert(indexPath, at: expandedIndexPaths.count)
        }
        
        var index = numOfBooksInEachRow
        
        tableView.beginUpdates()
        
        tableView.reloadRows(at: expandedIndexPaths, with: .fade)
        
        for _ in 0...self.numOfBooksToBeInserted {
            collectionView.performBatchUpdates({
                collectionView.insertItems(at: [IndexPath(item: index, section: 0)])
                self.numOfBooksInEachRow += 1
            })
            
            index += 1
        }
        
        tableView.endUpdates()
    }
}
