//
//  PlaceView.swift
//  Unit5FirstGroupProject
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import MapKit


class PlaceView: UIView {
    
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
        cv.register(CollectionCell.self, forCellWithReuseIdentifier: "CollectionCell")
        // TEST
        cv.backgroundColor = UIColor.clear
        return cv
    }()
}


// MARK: - SubViews
extension PlaceView {
    
    
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
        locationSearchBar.translatesAutoresizingMaskIntoConstraints = false
        [locationSearchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
         locationSearchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
         locationSearchBar.trailingAnchor.constraint(equalTo: trailingAnchor),
         locationSearchBar.heightAnchor.constraint(equalToConstant: 40)].forEach{$0.isActive = true}
    }
    
    private func setupMapView() {
        addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        [mapView.topAnchor.constraint(equalTo: locationSearchBar.bottomAnchor),
         mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
         mapView.trailingAnchor.constraint(equalTo: trailingAnchor),
         mapView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)].forEach{$0.isActive = true}
    }
    
    private func setupUserTrackingButton() {
        addSubview(userTrackingButton)
        userTrackingButton.translatesAutoresizingMaskIntoConstraints = false
        [userTrackingButton.bottomAnchor.constraint(equalTo: mapView.bottomAnchor),
         userTrackingButton.trailingAnchor.constraint(equalTo: mapView.trailingAnchor)].forEach{$0.isActive = true}
    }
    
    private func setupCollectionView() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        [collectionView.bottomAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -15),
        collectionView.centerXAnchor.constraint(equalTo: centerXAnchor),
        collectionView.heightAnchor.constraint(equalTo: mapView.heightAnchor, multiplier: 0.2), collectionView.widthAnchor.constraint(equalTo: mapView.widthAnchor)].forEach { $0.isActive = true }
    }
}
