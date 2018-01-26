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
    
    static let venueLabelHeight: CGFloat = 50
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "monkey")
        iv.layer.cornerRadius = 17
        iv.layer.masksToBounds = true
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .white
        iv.clipsToBounds = true
        iv.layer.borderWidth = 1
        
        return iv
    }()
    
    lazy var venueLabel: UILabel = {
        let label = UILabel()
        label.text = "Very very very long Placeholder"
        label.textAlignment = .center
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
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
        backgroundColor = .clear
        setupViews()
    }
    
    private func setupViews() {
        setupImageView()
        setupVenueLabel()
    }
    
    private func setupImageView() {
        addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
//            make.edges.equalTo(snp.edges)
            make.top.equalTo(snp.top)
            make.centerX.equalTo(snp.centerX)
            make.width.equalTo(snp.width)
            make.height.equalTo(snp.width)
        }
//        }
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        [
//            imageView.topAnchor.constraint(equalTo: topAnchor),
//            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
//            imageView.widthAnchor.constraint(equalTo: widthAnchor),
//            imageView.heightAnchor.constraint(equalTo: widthAnchor),
//            ].forEach{$0.isActive = true}
    }
    
    private func setupVenueLabel() {
        addSubview(venueLabel)
        venueLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(snp.centerX)
            make.top.equalTo(imageView.snp.bottom)
            make.width.equalTo(snp.width)
            make.height.equalTo(CollectionCell.venueLabelHeight)
        }
//        venueLabel.translatesAutoresizingMaskIntoConstraints = false
//        [
//            venueLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
//            venueLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
//            venueLabel.widthAnchor.constraint(equalTo: widthAnchor),
//            venueLabel.heightAnchor.constraint(equalToConstant: CollectionCell.venueLabelHeight),
//            ].forEach{$0.isActive = true}
    }
}
