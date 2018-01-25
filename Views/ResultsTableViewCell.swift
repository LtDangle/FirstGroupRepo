//
//  ResultsTableViewCell.swift
//  Unit5FirstGroupProject
//
//  Created by C4Q on 1/20/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class ResultsTableViewCell: UITableViewCell {
    
    lazy var resultsImageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    lazy var restaurantNameLabel: UILabel = {
        let lab = UILabel()
        return lab
    }()
    
    lazy var tagNameLabel: UILabel = {
        let lab = UILabel()
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
        
    }
    
    private func setUpViews() {
        
    }
    
    public func configureCell() {
        //This will take in the restaurant's name, type of restaurant, address etc.
        //The cell with the address will segue to the directions
    }
    
    
}
