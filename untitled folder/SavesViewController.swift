//
//  CollectionsViewController.swift
//  Unit5FirstGroupProject
//
//  Created by C4Q on 1/18/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class SavesViewController: UIViewController {
    
//    let collectionsTableView = CollectionsTableView()
    
    let collectionsTableView = UITableView()
//    let addCollection = AddCollectionViewController()
    
    let numberOfVisibleCellsPerRow: CGFloat = 2.5
    let cellSpacing: CGFloat = 10
    
    var numberOfSpacesPerVisibleRow: CGFloat {
        return CGFloat(Int(numberOfVisibleCellsPerRow) + 1)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionsTableView)
        configureNavBar()
        
        collectionsTableView.register(NetflixTableViewCell.self, forCellReuseIdentifier: "NetflixCell")
        collectionsTableView.delegate = self
        collectionsTableView.dataSource = self
        
        
    }
    
    func configureNavBar() {
        let button = UIBarButtonItem(image: #imageLiteral(resourceName: "add"), style: .plain, target: self, action: #selector(addNewCollection))
        navigationItem.rightBarButtonItem = button
    }
    
    @objc func addNewCollection() {
        let alertController = UIAlertController(title: "Create New Collection", message: "Enter name of new collection", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { (_) in
            if let textField = alertController.textFields![0] as? UITextField {
                // store your data
               
            } else {
                // user did not fill field
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (_) in }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "New collection name here"
            textField.textAlignment = .center
            
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}

extension SavesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.bounds.width - (numberOfSpacesPerVisibleRow * cellSpacing)) / numberOfVisibleCellsPerRow
        
        let height = width + BasicCell.venueLabelHeight
        
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

extension SavesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! BasicCell
        return cell
    }
}

extension SavesViewController: UITableViewDataSource {
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

extension SavesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ((view.bounds.width - (numberOfSpacesPerVisibleRow * cellSpacing)) / numberOfVisibleCellsPerRow) + BasicCell.venueLabelHeight + NetflixTableViewCell.titleLabelHeight + (cellSpacing * 3)
    }
    
}
