//
//  VenuesAPI.swift
//  Unit5FirstGroupProject
//
//  Created by C4Q on 1/25/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import CoreLocation
import Alamofire

protocol VenueAPIDelegate: class {
    func getVenues(with places: [Venue])
}

struct VenueAPI {
    
    var delegate : VenueAPIDelegate?
    
    let venueURL = "https://api.foursquare.com/v2/venues/search?"
    
    
    func getVenueData(searchedItem: String, locParam: String, location: CLLocationCoordinate2D?, useNearParam nearFlag: Bool) -> Void {
        
        //To format date for version parameter
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyymmdd"
        let dateFormatted = dateFormatter.string(from: currentDate)
        
        
        var parameters: [String: String] = [
            "client_id": APIKeys.clientId,
            "client_secret": APIKeys.clientSecret,
            "query": "coffee",
            "limit": "10",
            "v": dateFormatted]
        
        parameters["query"] = searchedItem
        if nearFlag {
            parameters["near"] = locParam
        } else {
            parameters["ll"] = locParam
        }
        
        
        Alamofire.request(venueURL, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            if let error = dataResponse.error {
                print("Data Response Error: \(error.localizedDescription)")
            }
            else if let data = dataResponse.data  {
                do {
                    
                    let decodedFoursquareResult = try JSONDecoder().decode(FoursquareResults.self, from: data)
                    let venueSearch = decodedFoursquareResult.response.venues
                    self.delegate?.getVenues(with: venueSearch)
                }
                catch {
                    print("Decoding Error: \(error.localizedDescription)")
                }
            }
        }
    }
}


