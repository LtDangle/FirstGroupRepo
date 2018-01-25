//
//  RestaurantDetailView.swift
//  Unit5FirstGroupProject
//
//  Created by C4Q on 1/18/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit


//TO-DO:
//When implemented, add container view

class RestaurantDetailView: UIView {
    lazy var restaurantNameLabel: UILabel = {
        //Add shadow?
        let label = UILabel()
        label.text = "Kentucky Fried Chicken"
        label.textAlignment = .left
        label.textColor = UIColor.white
        label.font = UIFont(name: "Gill Sans", size: 25)
        return label
    }()
    
    lazy var tintForImageView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.1, alpha: 0.3)
        return view
    }()
    
    lazy var restaurantImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "chicken")
        return iv
    }()
    
    lazy var restaurantTableView: UITableView = {
        let tv = UITableView()
        //Delegates, Datasource to be set up in VC
        tv.backgroundColor = UIColor.blue
        tv.register(RestaurantTableViewCell.self, forCellReuseIdentifier: "RestaurantTVCell")
        return tv
    }()
    
    lazy var addToCollection: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "add"), for: .normal)
        return button
    }()
    
    lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.setImage( #imageLiteral(resourceName: "cancel"), for: .normal)
        return button
    }()
    
    
    
    // Initialization for Custom View
    
    
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
        setUpDismissButtonConstraints()
        setUpAddButtonConstraints()
        setUpNameLabelConstraints()
        setUpImageTintConstraints()
        setUpRestaurantImageViewConstraints()
        tableViewConstraints()
    }
    
    //    override func layoutSubviews() {
    //
    //    }
    
    private func setupViews() {
        //first item in view is bottom layer
        let views = [restaurantImageView, addToCollection, dismissButton, restaurantNameLabel, restaurantTableView] as [UIView]
        views.forEach{ addSubview($0); ($0).translatesAutoresizingMaskIntoConstraints = false }
        restaurantImageView.addSubview(tintForImageView)
    }
    
    
    //Constraint Functions
    
    
    private func setUpNameLabelConstraints() {
        restaurantNameLabel.snp.makeConstraints { (make) -> Void in
            //TO - DO: Height
            make.bottom.equalTo(restaurantImageView.snp.bottom)
            make.width.equalTo(restaurantImageView)
            
        }
    }
    
    private func setUpRestaurantImageViewConstraints() {
        restaurantImageView.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(self.safeAreaLayoutGuide).inset(UIEdgeInsets(top: 0,left: 0,bottom: 175,right: 0))
            
        }
    }
    
    
    private func setUpImageTintConstraints() {
        tintForImageView.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(restaurantImageView)
        }
    }
    
    private func setUpDismissButtonConstraints() {
        dismissButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(restaurantImageView.snp.top)
            make.size.equalTo(self.dismissButton)
            make.left.equalTo(restaurantImageView.snp.left).offset(5)
        }
    }
    
    private func setUpAddButtonConstraints() {
        addToCollection.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(restaurantImageView.snp.top)
            make.right.equalTo(restaurantImageView.snp.right).offset(-5)
            make.size.equalTo(self.addToCollection)
            
        }
        
    }
    
    private func tableViewConstraints() {
        restaurantTableView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(restaurantImageView.snp.bottom)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.left.equalTo(safeAreaLayoutGuide.snp.left)
            make.right.equalTo(safeAreaLayoutGuide.snp.right)
            
        }
    }
    
}
