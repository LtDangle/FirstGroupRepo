//
//  MapViewController.swift
//  Unit5FirstGroupProject
//
//  Created by C4Q on 1/22/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import MapKit
import RevealingSplashView

class LocationViewController: UIViewController {
    
    let locationView = LocationView()
    let cellSpacing: CGFloat = 20
    
    private var venueAPIService = VenueAPI()
    var venues = [Venue]() {
        didSet {
            locationView.collectionView.reloadData()
        }
    }
    
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
                self.locationView.mapView.addAnnotations(self.annotations)
                self.locationView.mapView.showAnnotations(self.annotations, animated: true)
            }
        }
    }
    private var annotations = [MKAnnotation]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.addSubview(locationView.venueSearchBar)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.addSubview(locationView)
        locationView.mapView.delegate = self
        locationView.venueSearchBar.delegate = self
        locationView.locationSearchBar.delegate = self
        locationView.collectionView.delegate = self
        locationView.collectionView.dataSource = self
         self.view.backgroundColor = UIColor(red: 38/255, green: 194/255, blue: 129/255, alpha: 1.0)
        
        configureNavBar()
        
        let _ = LocationService.manager.checkForLocationServices()
        
        
        venueAPIService.delegate = self
        
        //Initialize a revealing Splash with with the iconImage, the initial size and the background color
        let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "hangryLogo")!,iconInitialSize: CGSize(width: 70, height: 70), backgroundColor: UIColor(red:0.11, green:0.56, blue:0.95, alpha:1.0))
        
        //Adds the revealing splash view as a sub view
        self.view.addSubview(revealingSplashView)
        
        //Starts animation
        revealingSplashView.startAnimation(){
            print("Completed")
        }
        
    }
    

    
    private func configureNavBar() {
//        navigationItem.titleView = placeView.venueSearchBar
        
        if let navigationBar = self.navigationController?.navigationBar {
            locationView.venueSearchBar.frame = CGRect(x: 10, y: 0, width: navigationBar.frame.width * 0.8, height: navigationBar.frame.height)
            locationView.locationSearchBar.frame = CGRect(x: navigationBar.frame.width/2, y: 0, width: navigationBar.frame.width, height: navigationBar.frame.height)
            
            navigationBar.addSubview(locationView.venueSearchBar)
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu"), style: .plain, target: self, action: #selector(showResultsTVC))
        }
    }
    
    @objc private func showResultsTVC() {
        locationView.venueSearchBar.removeFromSuperview()
        navigationController?.pushViewController(ResultsTableViewController(), animated: true)
    }
    
}

extension LocationViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let text = locationView.venueSearchBar.text else {
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
        var locParam: String = "Queens, NY"
        if let hasLocation = locationView.locationSearchBar.text?.isEmpty, hasLocation {
            nearFlag = true
//            locParam = "Queens, NY"
        } else if LocationService.manager.checkForLocationServices() == .authorizedAlways || LocationService.manager.checkForLocationServices() == .authorizedWhenInUse {
            nearFlag = false
            LocationService.manager
        } else {
            nearFlag = true
        }
        
        var nearText = locationView.locationSearchBar.text ?? locationView.locationSearchBar.placeholder ?? "Queens, NY".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        
        
        if !encodedVenueSearch.isEmpty {
            venueAPIService.getVenueData(searchedItem: encodedVenueSearch, locParam: locParam, location: nil, useNearParam: true)
        }
        
    }
}

extension LocationViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        locationView.venueSearchBar.removeFromSuperview()
        navigationController?.pushViewController(DetailViewController(), animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numOfCells: CGFloat = 3.25
        let numOfSpaces: CGFloat = 4
        
        var sDimension: CGFloat = UIScreen.main.bounds.width
        var bDimension: CGFloat = UIScreen.main.bounds.height
        if UIScreen.main.bounds.height < UIScreen.main.bounds.width {
            bDimension = UIScreen.main.bounds.width
            sDimension = UIScreen.main.bounds.height
        }
        return CGSize(width: (sDimension - (numOfSpaces * cellSpacing)) / numOfCells, height: bDimension * 0.15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: cellSpacing, left: cellSpacing, bottom: cellSpacing, right: cellSpacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
}

extension LocationViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // TEST
        if venues.isEmpty {
            return 20
        }
        return venues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! BasicCell
        var venue: Venue
        
        if !venues.isEmpty {
            venue = venues[indexPath.row]
            cell.venueLabel.text = venue.name
        }
        return cell
    }
}

extension LocationViewController: VenueAPIDelegate {
    func getVenues(with places: [Venue]) {
        self.venues = places
    }
}

extension LocationViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationIdentifier = "Identifier"
        var annotationView: MKAnnotationView?
        if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) {
            annotationView = dequeuedAnnotationView
            annotationView?.annotation = annotation
        }
        else {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        
        if let annotationView = annotationView {
            
            annotationView.canShowCallout = true
            annotationView.image = UIImage(named: "foodPin")
        }
        return annotationView
    }
}
