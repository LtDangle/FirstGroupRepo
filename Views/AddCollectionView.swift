//
//  AddCollectionView.swift
//  Unit5FirstGroupProject
//
//  Created by C4Q on 1/18/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class AddCollectionView: UIView {
    
    lazy var addCollectionLabel: UILabel = {
        let lab = UILabel()
        return lab
    }()
    
    lazy var collectionView: UICollectionView = {
        let cv = UICollectionView()
        return cv
    }()
    
    lazy var dismissButton: UIButton = {
        let butt = UIButton()
        return butt
    }()
    
    lazy var tipTextField: UITextField = {
        let tf = UITextField()
        return tf
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
    }
    
}
