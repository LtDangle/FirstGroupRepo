//
//  PhotosAPI.swift
//  Unit5FirstGroupProject
//
//  Created by C4Q on 1/25/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import Alamofire

protocol PhotosAPIDelegate: class {
    func getPhotos(from photos: [PhotosItem])
    
}

struct PhotosAPI {
    
    var photoDelegate: PhotosAPIDelegate?
    
    func getPhotos(venue: String) -> Void  {
        
        //To format date for version parameter
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyymmdd"
        let dateFormatted = dateFormatter.string(from: currentDate)
        
        var params: [String:Any] = ["limit": 1,  "client_id": APIKeys.clientId,
                                    "client_secret": APIKeys.clientSecret, "v": dateFormatted, "group": "venue" ]
        
        //Results of this function get the photosItem which will be used the create the url to the venue photo
        let photoURL = "https://api.foursquare.com/v2/venues/\(venue)/photos?"
        
        Alamofire.request(photoURL, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).response { (dataResponse) in
            
            if let error = dataResponse.error {
                print("Data Response Error: \(error.localizedDescription)")
            }
            else if let data = dataResponse.data  {
                do {
                    
                    let decodedFoursquarePhotos = try JSONDecoder().decode(ImageResponse.self, from: data)
                    let returnedPhotoInfo = decodedFoursquarePhotos.response.photos.items
                    self.photoDelegate?.getPhotos(from: returnedPhotoInfo)
                    
                }
                catch {
                    print("Decoding Error: \(error.localizedDescription)")
                }
            }
        }
    }
}
