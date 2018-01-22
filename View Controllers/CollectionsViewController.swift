//
//  CollectionsViewController.swift
//  Unit5FirstGroupProject
//
//  Created by C4Q on 1/18/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class CollectionsViewController: UIViewController {
    
    
    let customView = CollectionsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(customView)
        customView.collectionView.delegate = self
        customView.collectionView.dataSource = self
        
        customView.translatesAutoresizingMaskIntoConstraints = false
        [customView.topAnchor.constraint(equalTo: view.topAnchor),
         customView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
         customView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         customView.trailingAnchor.constraint(equalTo: view.trailingAnchor)].forEach{$0.isActive = true}
    }
    
}

extension CollectionsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numOfCells: CGFloat = 2
        let cellSpacing: CGFloat = 20
        let numSpaces: CGFloat = 3
        
        let width = (view.bounds.width - (numSpaces * cellSpacing)) / numOfCells
        
        return CGSize(width: width, height: width * 1.2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }
    
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
