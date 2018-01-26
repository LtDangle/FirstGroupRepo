//
//  NetflixTableViewCell.swift
//  Unit5FirstGroupProject
//
//  Created by C4Q on 1/22/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class NetflixTableViewCell: UITableViewCell {
    
    static let titleLabelHeight: CGFloat = 30.0
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(BasicCell.self, forCellWithReuseIdentifier: "CollectionCell")
        cv.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "monkey"))
        return cv
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "collection name here"
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "monkey"))
        return label
    }()
    
    private func commonInit() {
        setupViews()
    }
    
    private func setupViews() {
        setupTitleLabel()
        setupCollectionView()
        
    }
    
    private func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(snp.top)
            make.leading.equalTo(snp.leading)
            make.height.equalTo(NetflixTableViewCell.titleLabelHeight)
            make.trailing.equalTo(snp.trailing)
        }
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        [titleLabel.topAnchor.constraint(equalTo: topAnchor),
//         titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
//         titleLabel.heightAnchor.constraint(equalToConstant: NetflixTableViewCell.titleLabelHeight),
//         titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor)].forEach{$0.isActive = true}
    }
    
    private func setupCollectionView() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom)
            make.bottom.equalTo(snp.bottom)
            make.leading.equalTo(snp.leading)
            make.trailing.equalTo(snp.trailing)
        }
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        [collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
//         collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
//         collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
//         collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)].forEach{$0.isActive = true}
    }
    
    
    
}
