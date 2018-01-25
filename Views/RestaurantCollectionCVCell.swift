//
//  RestaurantCollectionCVCell.swift
//  Unit5FirstGroupProject
//
//  Created by C4Q on 1/20/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class RestaurantCollectionCVCell: UICollectionViewCell {
    lazy var restaurantImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "chicken")
        return iv
    }()
    
    lazy var restaurantNameLabel: UILabel = {
        let lab = UILabel()
        lab.text = "KFC"
        lab.textAlignment = .center
        return lab
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        restaurantImageView.layer.cornerRadius = 5
        restaurantImageView.layer.masksToBounds = true
    }
    
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
        layoutSubviews()
        setupImageViewConstraints()
        setUpLabelConstraints()
    }
    
    private func setupViews() {
        let views = [restaurantImageView, restaurantNameLabel] as [UIView]
        views.forEach{ addSubview($0); ($0).translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func setupImageViewConstraints() {
        restaurantImageView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(snp.top)
            make.right.equalTo(snp.right)
            make.left.equalTo(snp.left)
            make.bottom.equalTo(snp.bottom).offset(-20)
            
        }
    }
    
    private func setUpLabelConstraints() {
        restaurantNameLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(restaurantImageView.snp.bottom).offset(5)
            make.left.equalTo(snp.left)
            make.right.equalTo(snp.right)
            make.bottom.equalTo(snp.bottom)
            
            
        }
        
    }
    
}
