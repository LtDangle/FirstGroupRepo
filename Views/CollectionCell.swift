//
//  CollectionCell.swift
//  Unit5FirstGroupProject
//
//  Created by C4Q on 1/22/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class CollectionCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "placeholder-image")
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .red
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var venueLabel: UILabel = {
        let label = UILabel()
        label.text = "Placeholder"
        label.textAlignment = .center
        label.backgroundColor = .white
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .cyan
        setupViews()
    }
    
    private func setupViews() {
        setupImageView()
        setupVenueLabel()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setupImageView() {
        addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.edges.equalTo(safeAreaLayoutGuide.snp.edges)
        }
    }
    
    private func setupVenueLabel() {
        addSubview(venueLabel)
        venueLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(imageView.snp.centerX)
            make.top.equalTo(imageView.snp.bottom)
        }
    }
}
