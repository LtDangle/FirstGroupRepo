//
//  AddVenueToCollectionView.swift
//  Unit5FirstGroupProject
//
//  Created by C4Q on 1/25/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class AddVenueToCollectionView: UIView {
    
    
    lazy var cancelButton: UIButton = {
        let butt = UIButton()
        butt.setImage(#imageLiteral(resourceName: "cancel"), for: .normal)
        return butt
    }()
    
    lazy var addCollectionLabel: UILabel = {
        let lab = UILabel()
        lab.text = "Add Venue to Exisiting Or New Collection"
        lab.adjustsFontSizeToFitWidth = true
        lab.numberOfLines = 0
        lab.textAlignment = .center
        return lab
    }()
    
    lazy var createCollectionButton: UIButton = {
        let butt = UIButton()
        butt.setImage( #imageLiteral(resourceName: "checked"), for: .normal)
        return butt
    }()
    
    lazy var collectionTitleTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter Title For Collection Here."
        tf.textAlignment = .center
        return tf
    }()
    
    lazy var leaveATipLabel: UILabel = {
        let lab = UILabel()
        lab.text = "Leave a Tip!"
        lab.textAlignment = .center
        return lab
    }()
    
    
    lazy var tipTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter Tip Here."
        tf.textAlignment = .center
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
        let views = [cancelButton, addCollectionLabel, createCollectionButton, collectionTitleTextField, leaveATipLabel, tipTextField] as [UIView]
        views.forEach{addSubview($0); ($0).translatesAutoresizingMaskIntoConstraints = false }
        
        setUpCancelButtonConstraints()
        setUpAddCollectionLabelConstraints()
        setUpCreateButtonConstraints()
        setUpTitleFieldConstraints()
        setUpTipLabelConstraints()
        setUpTipTextFieldConstraints()
        
    }
    
    private func setUpCancelButtonConstraints() {
        cancelButton.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: 32, height: 32))
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            make.left.equalTo(safeAreaLayoutGuide.snp.left).offset(10)
            
        }
    }
    
    private func setUpAddCollectionLabelConstraints() {
        addCollectionLabel.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: 300, height: 32))
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            make.left.equalTo(cancelButton.snp.right).offset(10)
        }
        
    }
    
    private func setUpCreateButtonConstraints() {
        createCollectionButton.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: 32, height: 32))
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            make.right.equalTo(safeAreaLayoutGuide.snp.right).offset(-10)
        }
    }
    
    private func setUpTitleFieldConstraints() {
        collectionTitleTextField.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.addCollectionLabel.snp.bottom)
            make.height.equalTo(80)
            make.width.equalTo(safeAreaLayoutGuide.snp.width)
        }
    }
    
    private func setUpTipLabelConstraints() {
        leaveATipLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(collectionTitleTextField.snp.bottom)
            make.width.equalTo(safeAreaLayoutGuide.snp.width)
            make.height.equalTo(50)
            
        }
        
    }
    
    private func setUpTipTextFieldConstraints() {
        tipTextField.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(leaveATipLabel.snp.bottom)
            make.width.equalTo(safeAreaLayoutGuide.snp.width)
            make.height.equalTo(200)
        }
    }
}
