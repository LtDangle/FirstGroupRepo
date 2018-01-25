//
//  RestaurantTableViewCell.swift
//  Unit5FirstGroupProject
//
//  Created by C4Q on 1/19/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class RestaurantTableViewCell: UITableViewCell {
    
    lazy var resultsImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .black
        return iv
    }()
    
    lazy var resultsLabel: UILabel = {
        let lab = UILabel()
        //We can string interpolate the tags, name whatever here or I can separate it into two labels
        lab.text  = """
        KFC
        Fried Food, Fast Food
        """
        lab.textAlignment = .center
        lab.backgroundColor = UIColor.green
        lab.textColor = .white
        return lab
    }()
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "ResultsTVCell")
        commonInit()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setUpViews()
        setUpResultsImageViewConstraints()
        setUpResultsLabel()
        
    }
    
    private func setUpViews() {
        let views = [resultsImageView, resultsLabel] as [UIView]
        views.forEach{ addSubview($0); ($0).translatesAutoresizingMaskIntoConstraints = false }
    }
    
    
    private func setUpResultsImageViewConstraints() {
        resultsImageView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(snp.top)
            make.right.equalTo(snp.right)
            make.left.equalTo(snp.left)
            make.bottom.equalTo(snp.bottom).offset(-90)
        }
    }
    
    private func setUpResultsLabel () {
        resultsLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(resultsImageView.snp.bottom)
            make.height.equalTo(snp.height).multipliedBy(0.3)
            make.right.equalTo(snp.right)
            make.left.equalTo(snp.left)
            make.bottom.equalTo(snp.bottom)
            
        }
    }
    
    
    
    
    public func configureCell() {
        //This will take in the restaurant's name, tag, and restauranyt image
        //The cell will segue to the restaurant detailed view
    }
    
}
