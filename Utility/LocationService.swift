//
//  LocationService.swift
//  Unit5FirstGroupProject
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import CoreLocation

class LocationService: NSObject {
    // MARK:- View Lifecycle
    private override init(){
        locationManager = CLLocationManager()
        super.init()
        locationManager.delegate = self
    }
    
    static let manager = LocationService()
    
    
    private var lat: Int!
    private var lon: Int!
    private var locationManager: CLLocationManager
}

// MARK:- Helper Functions
extension LocationService {
    
//    public func locationServicesOn() -> Bool {
//        return CLLocationManager.locationServicesEnabled() && ( CLLocationManager.authorizationStatus() == .authorizedAlways || CLLocationManager.authorizationStatus() == .authorizedWhenInUse)
//    }
    
    public func checkForLocationServices() -> CLAuthorizationStatus{
        var status: CLAuthorizationStatus!
        
        // check if location services is enabled
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined: // initial state on first launch
                print("not determined")
                locationManager.requestWhenInUseAuthorization()
            case .denied: // user could potentially deny access
                print("denied")
            case .authorizedAlways: print("authorized always")
            case .authorizedWhenInUse: print("authorized when in use")
            default: break
            }
            status = CLLocationManager.authorizationStatus()
        } else { // Update UI to inform User
            status = .notDetermined
        }
        return status
    }
    
    public func getMostRecentLatLon() -> String {
        return "\(lat),\(lon)"
    }
    
}



// MARK:- CLLocationManagerDelegate
extension LocationService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didUpdateLocations: \(locations)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("didFailWithError: \(error)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("didChangeAuthorization: \(status)") // e.g. .denied, .notDetermined
    }
}

