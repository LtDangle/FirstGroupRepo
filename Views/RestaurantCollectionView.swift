//
//  RestaurantCollectionView.swift
//  Unit5FirstGroupProject
//
//  Created by C4Q on 1/20/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class RestaurantCollectionView: UIView {
    
    lazy var restaurantCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(RestaurantCollectionCVCell.self, forCellWithReuseIdentifier: "RestaurantCollectionCVCell")
        layout.scrollDirection = .vertical
        cv.backgroundColor = .white
        
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        addSubview(restaurantCollectionView)
        restaurantCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        //            restaurantsCollectionView.snp.makeConstraints { (make) -> Void in
        //                make.height.equalTo(snp.height)
        //                make.width.equalTo(snp.width)
        //                make.centerX.equalTo(snp.centerX)
        //                make.centerY.equalTo(snp.centerY)
        
        //            }
    }
    
}
