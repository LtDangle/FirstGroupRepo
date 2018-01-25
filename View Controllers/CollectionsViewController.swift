//
//  CollectionsViewController.swift
//  Unit5FirstGroupProject
//
//  Created by C4Q on 1/18/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class CollectionsViewController: UIViewController {
    
    let collectionsTableView = CollectionsTableView()
    
    let addCollection = AddCollectionViewController()
    
    let numberOfVisibleCellsPerRow: CGFloat = 2.5
    let cellSpacing: CGFloat = 10
    
    var numberOfSpacesPerVisibleRow: CGFloat {
        return CGFloat(Int(numberOfVisibleCellsPerRow) + 1)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionsTableView)
        configureNavBar()
        collectionsTableView.tableView.delegate = self
        collectionsTableView.tableView.dataSource = self
    }
    
    func configureNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "add"), style: .plain, target: self, action: #selector(addNewCollection))
        
    }
    
    @objc func addNewCollection() {
        
    }
    
    
}

extension CollectionsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.bounds.width - (numberOfSpacesPerVisibleRow * cellSpacing)) / numberOfVisibleCellsPerRow
        
        let height = width + CollectionCell.venueLabelHeight
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: cellSpacing, left: cellSpacing, bottom: cellSpacing, right: cellSpacing)
    }
    
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    //        return 15
    //    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}

extension CollectionsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        return cell
    }
}

extension CollectionsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NetflixCell", for: indexPath) as! NetflixTableViewCell
        cell.collectionView.dataSource = self
        cell.collectionView.delegate = self
        return cell
    }
    
}

extension CollectionsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ((view.bounds.width - (numberOfSpacesPerVisibleRow * cellSpacing)) / numberOfVisibleCellsPerRow) + CollectionCell.venueLabelHeight + NetflixTableViewCell.titleLabelHeight + (cellSpacing * 3)
    }
    
}
