//
//  PlaceView.swift
//  Unit5FirstGroupProject
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import MapKit


class LocationView: UIView {
    
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
    
    lazy var venueSearchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.placeholder = "what are you searching for?"
        sb.tintColor = .white
        return sb
    }()
    
    lazy var locationSearchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.placeholder = "Queens, NY"
        return sb
    }()
    
    lazy var mapView: MKMapView = {
        let mv = MKMapView()
        mv.showsUserLocation = true
        return mv
    }()
    
    lazy var userTrackingButton: MKUserTrackingButton = {
        let button = MKUserTrackingButton()
        button.mapView = mapView
        return button
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(BasicCell.self, forCellWithReuseIdentifier: "CollectionCell")
        // TEST
        cv.backgroundColor = UIColor.clear
        return cv
    }()
}


// MARK: - SubViews
extension LocationView {
    
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        //        setupVenueSB()
        setupLocationSB()
        setupMapView()
        setupUserTrackingButton()
        setupCollectionView()
    }
    
    //    private func setupVenueSB() {
    //        addSubview(venueSearchBar)
    //        venueSearchBar.translatesAutoresizingMaskIntoConstraints = false
    //        [<#NSLayoutConstraint#>].forEach{$0.isActive = true}
    //    }
    
    private func setupLocationSB() {
        addSubview(locationSearchBar)
        locationSearchBar.snp.makeConstraints { (make) in
//            make.edges.equalTo(safeAreaLayoutGuide.snp.edges)
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(snp.leading)
            make.trailing.equalTo(snp.trailing)
            make.height.equalTo(CGFloat(integerLiteral: 40))
        }
//        locationSearchBar.translatesAutoresizingMaskIntoConstraints = false
//        [locationSearchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
//         locationSearchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
//         locationSearchBar.trailingAnchor.constraint(equalTo: trailingAnchor),
//         locationSearchBar.heightAnchor.constraint(equalToConstant: 40)].forEach{$0.isActive = true}
    }
    
    private func setupMapView() {
        addSubview(mapView)
        mapView.snp.makeConstraints { (make) in
            make.top.equalTo(locationSearchBar.snp.bottom)
            make.leading.equalTo(snp.leading)
            make.trailing.equalTo(snp.trailing)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func setupUserTrackingButton() {
        addSubview(userTrackingButton)
        
        let padding: CGFloat = 20
        userTrackingButton.snp.makeConstraints { (make) in
            make.top.equalTo(mapView.snp.top).offset(padding)
            make.trailing.equalTo(mapView.snp.trailing).offset(-padding)
        }
    }
    
    private func setupCollectionView() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.bottom.equalTo(mapView.snp.bottom).offset(-15)
            make.centerX.equalTo(snp.centerX)
            make.height.equalTo(mapView.snp.height).multipliedBy(0.2)
            make.width.equalTo(mapView.snp.width)
        }
    }
}
