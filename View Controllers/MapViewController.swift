//
//  MapViewController.swift
//  Unit5FirstGroupProject
//
//  Created by C4Q on 1/22/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: UIViewController {
    
    let placeView = PlaceView()
    let cellSpacing: CGFloat = 20
    
    private var venueAPIService = VenueAPI()
    var venues = [Venue]()
    
    private var places = [Place]() {
        didSet {
            // update our map with new annotation
            for place in places {
                let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2DMake(place.coordinates.latitude, place.coordinates.longitude)
                annotation.title = place.name
                annotations.append(annotation)
            }
            // add annotations to mapview - update ui
            DispatchQueue.main.async {
                self.placeView.mapView.addAnnotations(self.annotations)
                self.placeView.mapView.showAnnotations(self.annotations, animated: true)
            }
        }
    }
    private var annotations = [MKAnnotation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(placeView)
        
        placeView.venueSearchBar.delegate = self
        placeView.locationSearchBar.delegate = self
        placeView.collectionView.delegate = self
        placeView.collectionView.dataSource = self
        
        
        configureNavBar()
        
        let _ = LocationService.manager.checkForLocationServices()
        
        venueAPIService.delegate = self
        
    }
    
    private func configureNavBar() {
        navigationItem.title = "Search"
        navigationItem.titleView = placeView.venueSearchBar
    }
    
}

extension MapViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let text = placeView.venueSearchBar.text else {
            print("venue search is nil")
            return
        }
        
        guard !text.isEmpty else {
            print("venue text is empty")
            return
        }
        
        guard let encodedVenueSearch = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            print("spaces not allowed")
            return
        }
        
        var nearFlag: Bool
        var lonlat: String
        if let hasLocation = placeView.locationSearchBar.text?.isEmpty, hasLocation {
            nearFlag = true
        } else if LocationService.manager.checkForLocationServices() == .authorizedAlways || LocationService.manager.checkForLocationServices() == .authorizedWhenInUse {
            nearFlag = false
            LocationService.manager
        } else {
            true
        }
        
        var nearText = placeView.locationSearchBar.text ?? placeView.locationSearchBar.placeholder ?? "New York, NY".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        
        
        
//        VenueAPI.manager.getVenueData(searchedItem: encodedVenueSearch, locParam: <#T##String#>, location: <#T##CLLocationCoordinate2D?#>, useNearParam: <#T##Bool#>)
        
    }
}

extension MapViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numOfCells: CGFloat = 3.25
        let numOfSpaces: CGFloat = 4
        
        var sDimension: CGFloat = UIScreen.main.bounds.width
        var bDimension: CGFloat = UIScreen.main.bounds.height
        if UIScreen.main.bounds.height < UIScreen.main.bounds.width {
            bDimension = UIScreen.main.bounds.width
            sDimension = UIScreen.main.bounds.height
        }
        return CGSize(width: (sDimension - (numOfSpaces * cellSpacing)) / numOfCells, height: bDimension * 0.2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: cellSpacing, left: cellSpacing, bottom: cellSpacing, right: cellSpacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
}

extension MapViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        
        cell.venueLabel.text = ""
        
        return cell
    }
}

extension MapViewController: VenueAPIDelegate {
    func getVenues(with places: [Venue]) {
        self.venues = places
    }
}
