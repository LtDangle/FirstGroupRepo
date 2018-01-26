//
//  InfoScrollView.swift
//  Unit5FirstGroupProject
//
//  Created by C4Q on 1/26/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class InfoScrollView: UIScrollView {

    // address
    lazy var addressLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    // phone
    lazy var phoneLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    // webSite
    lazy var webLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    // facebook
    lazy var fbLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    // twitter
    lazy var twitterLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    // instagram
    lazy var igLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    
    
    convenience init() {
        self.init(frame: UIScreen.main.bounds)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        setupAddressLabel()
        setupPhoneLabel()
        setupWebLabel()
        setupFbLabel()
        setupTwitterLabel()
        setupIgLabel()
    }
    
    private func setupAddressLabel() {
        addSubview(addressLabel)
        addressLabel.snp.makeConstraints { (make) in
            
        }
    }
    private func setupPhoneLabel() {
        addSubview(phoneLabel)
        phoneLabel.snp.makeConstraints { (make) in
            
        }
    }
    private func setupWebLabel() {
        addSubview(webLabel)
        webLabel.snp.makeConstraints { (make) in
            
        }
    }
    private func setupFbLabel() {
        addSubview(fbLabel)
        fbLabel.snp.makeConstraints { (make) in
            
        }
    }
    private func setupTwitterLabel() {
        addSubview(twitterLabel)
        twitterLabel.snp.makeConstraints { (make) in
            
        }
    }
    private func setupIgLabel() {
        addSubview(igLabel)
        igLabel.snp.makeConstraints { (make) in
            
        }
    }
    
}
