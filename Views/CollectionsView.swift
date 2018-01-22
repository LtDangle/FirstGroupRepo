//
//  CollectionsView.swift
//  Unit5FirstGroupProject
//
//  Created by C4Q on 1/22/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class CollectionsView: UIView {
    
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(CollectionCell.self, forCellWithReuseIdentifier: "CollectionCell")
        cv.backgroundColor = .orange
        return cv
    }()
    
    
    convenience init() {
        self.init(frame: UIScreen.main.bounds)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        [collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
         collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
         collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
         collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)].forEach{$0.isActive = true}
    }
}
