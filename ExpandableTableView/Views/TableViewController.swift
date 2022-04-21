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
    var numOfRowsInSection = 3
    var numOfBooksInEachRow = 15
    
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
        
        cell.collectionView?.delegate = self
        cell.collectionView?.dataSource = self
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableViewCellHeight
    }
    
}

extension TableViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        numOfBooksInEachRow
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CarouselRowCollectionViewCell.cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselRowCollectionViewCell.nibName, for: indexPath) as! CarouselRowCollectionViewCell
        
        return cell
    }
}
